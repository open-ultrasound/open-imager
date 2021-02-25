#
# delay_cycles_a53_gcc.s
#
# Calibrated delay function for the ARM Cortex-A53 processor (Zynq), for the GCC
#  compiler suite.
#
# 2020-05-12  WHF  Created.
#

	.section .text
	.global delay_cycles
delay_cycles:
	CMP W0, #0
	BEQ done         // skip loop if already zero
	
loop:                    // Typically this loop is three cycles.	
	SUBS W0, W0, #1
	BNE loop
done:
	RET

	.end

