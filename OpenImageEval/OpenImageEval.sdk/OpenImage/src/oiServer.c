/*
	oiServer.c

	Implementation of the Server module for the Open Image application.

	2020-08-05  WHF  Created.
*/

#include "open_image.h"


#include <stdio.h>

#include "xparameters.h"

#include "netif/xadapter.h"

#include "platform.h"
#include "platform_config.h"
#if defined (__arm__) || defined(__aarch64__)
#include "xil_printf.h"
#endif

#include "lwip/init.h"
#include "lwip/tcp.h"
#include "xil_cache.h"


#if LWIP_IPV6==1
#	error IPV6 not supported.
#endif


#if LWIP_DHCP==1
#	error DHCP not supported.
#endif


//*******************************  Module Data  ******************************//
extern volatile int TcpFastTmrFlag;
extern volatile int TcpSlowTmrFlag;

static struct netif server_netif;
struct netif *echo_netif;

static struct tcp_pcb *replyPcb = NULL;

//***********************  Local Function Declarations  **********************//
/* defined by each RAW mode application */
void print_app_header();
int start_application();
int transfer_data();
void tcp_fasttmr(void);
void tcp_slowtmr(void);

static void print_ip(char *msg, ip_addr_t *ip);
static void print_ip_settings(ip_addr_t *ip, ip_addr_t *mask, ip_addr_t *gw);


//****************************  Global Functions  ****************************//
/* missing declaration in lwIP */
//void lwip_init();

void oiServerInit(void)
{
	ip_addr_t ipaddr, netmask, gw;

	/* the mac address of the board. this should be unique per board */
	unsigned char mac_ethernet_address[] =
	{ 0x00, 0x0a, 0x35, 0x00, 0x01, 0x02 };

	echo_netif = &server_netif;

	/* initialize IP addresses to be used */
#if 0  // standalone laptop
	IP4_ADDR(&ipaddr,  169, 254,   1, 10);
	IP4_ADDR(&netmask, 255, 255,   0,  0);
	IP4_ADDR(&gw,      169, 254,   1,  1);
#else  // Creare LAN
	//10.11.34.215
	IP4_ADDR(&ipaddr,   10,  11,  34, 215);
	IP4_ADDR(&netmask, 255, 255,   0,   0);
	IP4_ADDR(&gw,       10,  11,   1,   1);
#endif

	print_app_header();

	lwip_init();

	/* Add network interface to the netif_list, and set it as default */
	if (!xemac_add(echo_netif, &ipaddr, &netmask,
						&gw, mac_ethernet_address,
						PLATFORM_EMAC_BASEADDR)) {
		xil_printf("Error adding N/W interface\r\n");
		return;
	}

	netif_set_default(echo_netif);

	/* now enable interrupts */
	platform_enable_interrupts();

	/* specify that the network if is up */
	netif_set_up(echo_netif);

	print_ip_settings(&ipaddr, &netmask, &gw);

	/* start the application (web server, rxtest, txtest, etc..) */
	start_application();
}

void oiServerVisit(void)
{
	/* receive and process packets */
	if (TcpFastTmrFlag) {
		tcp_fasttmr();
		TcpFastTmrFlag = 0;
	}
	if (TcpSlowTmrFlag) {
		tcp_slowtmr();
		TcpSlowTmrFlag = 0;
	}
	xemacif_input(echo_netif);
	transfer_data();
}

void oiServerReply(uint8_t cmd, const void* pData, uint32_t nData)
{
	if (replyPcb) {
		if (tcp_sndbuf(replyPcb) > nData) {
			uint8_t hdr[] = {
				OI_MAGIC,
				cmd,
				nData & 0xFF,
				nData >> 8 & 0xFF
			};
			err_t err = tcp_write(replyPcb, hdr, sizeof(hdr), 1);
			err = tcp_write(replyPcb, pData, nData, 1);
			UNUSED(err);
		} else {
			xil_printf("no space in tcp_sndbuf\r\n");
		}
	} else {
		// No context in which to reply.
		xil_printf("no reply context\r\n");
	}
}

//***********************  Local Function Definitions  ***********************//
static void print_ip(char *msg, ip_addr_t *ip)
{
	print(msg);
	xil_printf("%d.%d.%d.%d\r\n", ip4_addr1(ip), ip4_addr2(ip),
			ip4_addr3(ip), ip4_addr4(ip));
}

static void print_ip_settings(ip_addr_t *ip, ip_addr_t *mask, ip_addr_t *gw)
{

	print_ip("Board IP: ", ip);
	print_ip("Netmask : ", mask);
	print_ip("Gateway : ", gw);
}


int transfer_data() {
	return 0;
}

void print_app_header()
{
#if (LWIP_IPV6==0)
	xil_printf("\r\n\r\n-----lwIP TCP echo server ------\r\n");
#else
	xil_printf("\r\n\r\n-----lwIPv6 TCP echo server ------\r\n");
#endif
	xil_printf("TCP packets sent to port 6001 will be echoed back\r\n");
}

static uint8_t defrag[0x100000];
static uint32_t nDefrag;

err_t recv_callback(void *arg, struct tcp_pcb *tpcb,
                               struct pbuf *p, err_t err)
{
	/* do not read the packet if we are not in ESTABLISHED state */
	if (!p) {
		tcp_close(tpcb);
		tcp_recv(tpcb, NULL);
		return ERR_OK;
	}
	
	replyPcb = tpcb;

	/* indicate that the packet has been received */
	tcp_recved(tpcb, p->len);
	
	void* toHandle;
	uint32_t handleLen = 0u;
	bool doDefrag = false;
	if (p->len == echo_netif->mtu - 40) {
		// The packet filled the MTU.  Assume that this is a fragment of
		//  a larger packet; defrag.
		doDefrag = true;
	} else if (nDefrag > 0) {
		// This will finish a fragmented packet.
		doDefrag = true;
		toHandle = defrag;
		handleLen = nDefrag + p->len;
	} else {
		// Smaller than the MTU.  No fragmentation.
		doDefrag = false;
		toHandle = p->payload;
		handleLen = p->len;
	}
	
	if (doDefrag) {
		memcpy(&defrag[nDefrag], p->payload, p->len);
		nDefrag += p->len;
	} else {
		// Not a fragment.
	}
	
	if (handleLen > 0) {
		// Pass the packet to the command module:
		oiCmdHandle(toHandle, handleLen);
		nDefrag = 0u;
	} else {
		// Continue to defrag.
	}

	/* free the received pbuf */
	pbuf_free(p);

	return ERR_OK;
}

err_t accept_callback(void *arg, struct tcp_pcb *newpcb, err_t err)
{
	static int connection = 1;

	/* set the receive callback for this connection */
	tcp_recv(newpcb, recv_callback);

	/* just use an integer number indicating the connection id as the
	   callback argument */
	tcp_arg(newpcb, (void*)(UINTPTR)connection);

	/* increment for subsequent accepted connections */
	connection++;

	return ERR_OK;
}


int start_application()
{
	struct tcp_pcb *pcb;
	err_t err;

	/* create new TCP PCB structure */
	pcb = tcp_new_ip_type(IPADDR_TYPE_ANY);
	if (!pcb) {
		xil_printf("Error creating PCB. Out of Memory\r\n");
		return -1;
	}

	/* bind to specified @port */
	err = tcp_bind(pcb, IP_ANY_TYPE, OI_TCP_PORT);
	if (err != ERR_OK) {
		xil_printf("Unable to bind to port %d: err = %d\r\n", OI_TCP_PORT, err);
		return -2;
	}

	/* we do not need any arguments to callback functions */
	tcp_arg(pcb, NULL);

	/* listen for connections */
	pcb = tcp_listen(pcb);
	if (!pcb) {
		xil_printf("Out of memory while tcp_listen\r\n");
		return -3;
	}

	/* specify callback to use for incoming connections */
	tcp_accept(pcb, accept_callback);

	xil_printf("TCP echo server started @ port %d\r\n", OI_TCP_PORT);

	return 0;
}




