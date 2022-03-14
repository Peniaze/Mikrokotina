subtitle "Microchip MPLAB XC8 C Compiler v2.36 (Free license) build 20220127204148 Og9 "

pagewidth 120

	opt flic

	processor	16F917
include "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\16f917.cgen.inc"
getbyte	macro	val,pos
	(((val) >> (8 * pos)) and 0xff)
endm
byte0	macro	val
	(getbyte(val,0))
endm
byte1	macro	val
	(getbyte(val,1))
endm
byte2	macro	val
	(getbyte(val,2))
endm
byte3	macro	val
	(getbyte(val,3))
endm
byte4	macro	val
	(getbyte(val,4))
endm
byte5	macro	val
	(getbyte(val,5))
endm
byte6	macro	val
	(getbyte(val,6))
endm
byte7	macro	val
	(getbyte(val,7))
endm
getword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffff)
endm
word0	macro	val
	(getword(val,0))
endm
word1	macro	val
	(getword(val,2))
endm
word2	macro	val
	(getword(val,4))
endm
word3	macro	val
	(getword(val,6))
endm
gettword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffffff)
endm
tword0	macro	val
	(gettword(val,0))
endm
tword1	macro	val
	(gettword(val,3))
endm
tword2	macro	val
	(gettword(val,6))
endm
getdword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffffffff)
endm
dword0	macro	val
	(getdword(val,0))
endm
dword1	macro	val
	(getdword(val,4))
endm
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
# 55 "../pic16f917.h"
INDF equ 00h ;# 
# 62 "../pic16f917.h"
TMR0 equ 01h ;# 
# 69 "../pic16f917.h"
PCL equ 02h ;# 
# 76 "../pic16f917.h"
STATUS equ 03h ;# 
# 162 "../pic16f917.h"
FSR equ 04h ;# 
# 169 "../pic16f917.h"
PORTA equ 05h ;# 
# 231 "../pic16f917.h"
PORTB equ 06h ;# 
# 293 "../pic16f917.h"
PORTC equ 07h ;# 
# 355 "../pic16f917.h"
PORTD equ 08h ;# 
# 417 "../pic16f917.h"
PORTE equ 09h ;# 
# 455 "../pic16f917.h"
PCLATH equ 0Ah ;# 
# 462 "../pic16f917.h"
INTCON equ 0Bh ;# 
# 540 "../pic16f917.h"
PIR1 equ 0Ch ;# 
# 602 "../pic16f917.h"
PIR2 equ 0Dh ;# 
# 654 "../pic16f917.h"
TMR1 equ 0Eh ;# 
# 661 "../pic16f917.h"
TMR1L equ 0Eh ;# 
# 668 "../pic16f917.h"
TMR1H equ 0Fh ;# 
# 675 "../pic16f917.h"
T1CON equ 010h ;# 
# 768 "../pic16f917.h"
TMR2 equ 011h ;# 
# 775 "../pic16f917.h"
T2CON equ 012h ;# 
# 846 "../pic16f917.h"
SSPBUF equ 013h ;# 
# 853 "../pic16f917.h"
SSPCON equ 014h ;# 
# 923 "../pic16f917.h"
CCPR1 equ 015h ;# 
# 930 "../pic16f917.h"
CCPR1L equ 015h ;# 
# 937 "../pic16f917.h"
CCPR1H equ 016h ;# 
# 944 "../pic16f917.h"
CCP1CON equ 017h ;# 
# 1002 "../pic16f917.h"
RCSTA equ 018h ;# 
# 1097 "../pic16f917.h"
TXREG equ 019h ;# 
# 1104 "../pic16f917.h"
RCREG equ 01Ah ;# 
# 1111 "../pic16f917.h"
CCPR2 equ 01Bh ;# 
# 1118 "../pic16f917.h"
CCPR2L equ 01Bh ;# 
# 1125 "../pic16f917.h"
CCPR2H equ 01Ch ;# 
# 1132 "../pic16f917.h"
CCP2CON equ 01Dh ;# 
# 1190 "../pic16f917.h"
ADRESH equ 01Eh ;# 
# 1197 "../pic16f917.h"
ADCON0 equ 01Fh ;# 
# 1298 "../pic16f917.h"
OPTION_REG equ 081h ;# 
# 1368 "../pic16f917.h"
TRISA equ 085h ;# 
# 1430 "../pic16f917.h"
TRISB equ 086h ;# 
# 1492 "../pic16f917.h"
TRISC equ 087h ;# 
# 1554 "../pic16f917.h"
TRISD equ 088h ;# 
# 1616 "../pic16f917.h"
TRISE equ 089h ;# 
# 1654 "../pic16f917.h"
PIE1 equ 08Ch ;# 
# 1716 "../pic16f917.h"
PIE2 equ 08Dh ;# 
# 1768 "../pic16f917.h"
PCON equ 08Eh ;# 
# 1809 "../pic16f917.h"
OSCCON equ 08Fh ;# 
# 1874 "../pic16f917.h"
OSCTUNE equ 090h ;# 
# 1926 "../pic16f917.h"
ANSEL equ 091h ;# 
# 2046 "../pic16f917.h"
PR2 equ 092h ;# 
# 2053 "../pic16f917.h"
SSPADD equ 093h ;# 
# 2060 "../pic16f917.h"
SSPSTAT equ 094h ;# 
# 2229 "../pic16f917.h"
WPUB equ 095h ;# 
# 2234 "../pic16f917.h"
WPU equ 095h ;# 
# 2467 "../pic16f917.h"
IOCB equ 096h ;# 
# 2472 "../pic16f917.h"
IOC equ 096h ;# 
# 2615 "../pic16f917.h"
CMCON1 equ 097h ;# 
# 2641 "../pic16f917.h"
TXSTA equ 098h ;# 
# 2722 "../pic16f917.h"
SPBRG equ 099h ;# 
# 2729 "../pic16f917.h"
CMCON0 equ 09Ch ;# 
# 2799 "../pic16f917.h"
VRCON equ 09Dh ;# 
# 2859 "../pic16f917.h"
ADRESL equ 09Eh ;# 
# 2866 "../pic16f917.h"
ADCON1 equ 09Fh ;# 
# 2908 "../pic16f917.h"
WDTCON equ 0105h ;# 
# 2966 "../pic16f917.h"
LCDCON equ 0107h ;# 
# 3042 "../pic16f917.h"
LCDPS equ 0108h ;# 
# 3112 "../pic16f917.h"
LVDCON equ 0109h ;# 
# 3165 "../pic16f917.h"
EEDATL equ 010Ch ;# 
# 3170 "../pic16f917.h"
EEDATA equ 010Ch ;# 
# 3303 "../pic16f917.h"
EEADRL equ 010Dh ;# 
# 3308 "../pic16f917.h"
EEADR equ 010Dh ;# 
# 3441 "../pic16f917.h"
EEDATH equ 010Eh ;# 
# 3491 "../pic16f917.h"
EEADRH equ 010Fh ;# 
# 3535 "../pic16f917.h"
LCDDATA0 equ 0110h ;# 
# 3697 "../pic16f917.h"
LCDDATA1 equ 0111h ;# 
# 3859 "../pic16f917.h"
LCDDATA2 equ 0112h ;# 
# 4021 "../pic16f917.h"
LCDDATA3 equ 0113h ;# 
# 4183 "../pic16f917.h"
LCDDATA4 equ 0114h ;# 
# 4345 "../pic16f917.h"
LCDDATA5 equ 0115h ;# 
# 4507 "../pic16f917.h"
LCDDATA6 equ 0116h ;# 
# 4669 "../pic16f917.h"
LCDDATA7 equ 0117h ;# 
# 4831 "../pic16f917.h"
LCDDATA8 equ 0118h ;# 
# 4993 "../pic16f917.h"
LCDDATA9 equ 0119h ;# 
# 5155 "../pic16f917.h"
LCDDATA10 equ 011Ah ;# 
# 5317 "../pic16f917.h"
LCDDATA11 equ 011Bh ;# 
# 5479 "../pic16f917.h"
LCDSE0 equ 011Ch ;# 
# 5641 "../pic16f917.h"
LCDSE1 equ 011Dh ;# 
# 5803 "../pic16f917.h"
LCDSE2 equ 011Eh ;# 
# 5965 "../pic16f917.h"
EECON1 equ 018Ch ;# 
# 6024 "../pic16f917.h"
EECON2 equ 018Dh ;# 
# 55 "../pic16f917.h"
INDF equ 00h ;# 
# 62 "../pic16f917.h"
TMR0 equ 01h ;# 
# 69 "../pic16f917.h"
PCL equ 02h ;# 
# 76 "../pic16f917.h"
STATUS equ 03h ;# 
# 162 "../pic16f917.h"
FSR equ 04h ;# 
# 169 "../pic16f917.h"
PORTA equ 05h ;# 
# 231 "../pic16f917.h"
PORTB equ 06h ;# 
# 293 "../pic16f917.h"
PORTC equ 07h ;# 
# 355 "../pic16f917.h"
PORTD equ 08h ;# 
# 417 "../pic16f917.h"
PORTE equ 09h ;# 
# 455 "../pic16f917.h"
PCLATH equ 0Ah ;# 
# 462 "../pic16f917.h"
INTCON equ 0Bh ;# 
# 540 "../pic16f917.h"
PIR1 equ 0Ch ;# 
# 602 "../pic16f917.h"
PIR2 equ 0Dh ;# 
# 654 "../pic16f917.h"
TMR1 equ 0Eh ;# 
# 661 "../pic16f917.h"
TMR1L equ 0Eh ;# 
# 668 "../pic16f917.h"
TMR1H equ 0Fh ;# 
# 675 "../pic16f917.h"
T1CON equ 010h ;# 
# 768 "../pic16f917.h"
TMR2 equ 011h ;# 
# 775 "../pic16f917.h"
T2CON equ 012h ;# 
# 846 "../pic16f917.h"
SSPBUF equ 013h ;# 
# 853 "../pic16f917.h"
SSPCON equ 014h ;# 
# 923 "../pic16f917.h"
CCPR1 equ 015h ;# 
# 930 "../pic16f917.h"
CCPR1L equ 015h ;# 
# 937 "../pic16f917.h"
CCPR1H equ 016h ;# 
# 944 "../pic16f917.h"
CCP1CON equ 017h ;# 
# 1002 "../pic16f917.h"
RCSTA equ 018h ;# 
# 1097 "../pic16f917.h"
TXREG equ 019h ;# 
# 1104 "../pic16f917.h"
RCREG equ 01Ah ;# 
# 1111 "../pic16f917.h"
CCPR2 equ 01Bh ;# 
# 1118 "../pic16f917.h"
CCPR2L equ 01Bh ;# 
# 1125 "../pic16f917.h"
CCPR2H equ 01Ch ;# 
# 1132 "../pic16f917.h"
CCP2CON equ 01Dh ;# 
# 1190 "../pic16f917.h"
ADRESH equ 01Eh ;# 
# 1197 "../pic16f917.h"
ADCON0 equ 01Fh ;# 
# 1298 "../pic16f917.h"
OPTION_REG equ 081h ;# 
# 1368 "../pic16f917.h"
TRISA equ 085h ;# 
# 1430 "../pic16f917.h"
TRISB equ 086h ;# 
# 1492 "../pic16f917.h"
TRISC equ 087h ;# 
# 1554 "../pic16f917.h"
TRISD equ 088h ;# 
# 1616 "../pic16f917.h"
TRISE equ 089h ;# 
# 1654 "../pic16f917.h"
PIE1 equ 08Ch ;# 
# 1716 "../pic16f917.h"
PIE2 equ 08Dh ;# 
# 1768 "../pic16f917.h"
PCON equ 08Eh ;# 
# 1809 "../pic16f917.h"
OSCCON equ 08Fh ;# 
# 1874 "../pic16f917.h"
OSCTUNE equ 090h ;# 
# 1926 "../pic16f917.h"
ANSEL equ 091h ;# 
# 2046 "../pic16f917.h"
PR2 equ 092h ;# 
# 2053 "../pic16f917.h"
SSPADD equ 093h ;# 
# 2060 "../pic16f917.h"
SSPSTAT equ 094h ;# 
# 2229 "../pic16f917.h"
WPUB equ 095h ;# 
# 2234 "../pic16f917.h"
WPU equ 095h ;# 
# 2467 "../pic16f917.h"
IOCB equ 096h ;# 
# 2472 "../pic16f917.h"
IOC equ 096h ;# 
# 2615 "../pic16f917.h"
CMCON1 equ 097h ;# 
# 2641 "../pic16f917.h"
TXSTA equ 098h ;# 
# 2722 "../pic16f917.h"
SPBRG equ 099h ;# 
# 2729 "../pic16f917.h"
CMCON0 equ 09Ch ;# 
# 2799 "../pic16f917.h"
VRCON equ 09Dh ;# 
# 2859 "../pic16f917.h"
ADRESL equ 09Eh ;# 
# 2866 "../pic16f917.h"
ADCON1 equ 09Fh ;# 
# 2908 "../pic16f917.h"
WDTCON equ 0105h ;# 
# 2966 "../pic16f917.h"
LCDCON equ 0107h ;# 
# 3042 "../pic16f917.h"
LCDPS equ 0108h ;# 
# 3112 "../pic16f917.h"
LVDCON equ 0109h ;# 
# 3165 "../pic16f917.h"
EEDATL equ 010Ch ;# 
# 3170 "../pic16f917.h"
EEDATA equ 010Ch ;# 
# 3303 "../pic16f917.h"
EEADRL equ 010Dh ;# 
# 3308 "../pic16f917.h"
EEADR equ 010Dh ;# 
# 3441 "../pic16f917.h"
EEDATH equ 010Eh ;# 
# 3491 "../pic16f917.h"
EEADRH equ 010Fh ;# 
# 3535 "../pic16f917.h"
LCDDATA0 equ 0110h ;# 
# 3697 "../pic16f917.h"
LCDDATA1 equ 0111h ;# 
# 3859 "../pic16f917.h"
LCDDATA2 equ 0112h ;# 
# 4021 "../pic16f917.h"
LCDDATA3 equ 0113h ;# 
# 4183 "../pic16f917.h"
LCDDATA4 equ 0114h ;# 
# 4345 "../pic16f917.h"
LCDDATA5 equ 0115h ;# 
# 4507 "../pic16f917.h"
LCDDATA6 equ 0116h ;# 
# 4669 "../pic16f917.h"
LCDDATA7 equ 0117h ;# 
# 4831 "../pic16f917.h"
LCDDATA8 equ 0118h ;# 
# 4993 "../pic16f917.h"
LCDDATA9 equ 0119h ;# 
# 5155 "../pic16f917.h"
LCDDATA10 equ 011Ah ;# 
# 5317 "../pic16f917.h"
LCDDATA11 equ 011Bh ;# 
# 5479 "../pic16f917.h"
LCDSE0 equ 011Ch ;# 
# 5641 "../pic16f917.h"
LCDSE1 equ 011Dh ;# 
# 5803 "../pic16f917.h"
LCDSE2 equ 011Eh ;# 
# 5965 "../pic16f917.h"
EECON1 equ 018Ch ;# 
# 6024 "../pic16f917.h"
EECON2 equ 018Dh ;# 
# 55 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
INDF equ 00h ;# 
# 62 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
TMR0 equ 01h ;# 
# 69 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
PCL equ 02h ;# 
# 76 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
STATUS equ 03h ;# 
# 162 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
FSR equ 04h ;# 
# 169 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
PORTA equ 05h ;# 
# 231 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
PORTB equ 06h ;# 
# 293 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
PORTC equ 07h ;# 
# 355 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
PORTD equ 08h ;# 
# 417 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
PORTE equ 09h ;# 
# 455 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
PCLATH equ 0Ah ;# 
# 462 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
INTCON equ 0Bh ;# 
# 540 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
PIR1 equ 0Ch ;# 
# 602 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
PIR2 equ 0Dh ;# 
# 654 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
TMR1 equ 0Eh ;# 
# 661 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
TMR1L equ 0Eh ;# 
# 668 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
TMR1H equ 0Fh ;# 
# 675 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
T1CON equ 010h ;# 
# 768 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
TMR2 equ 011h ;# 
# 775 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
T2CON equ 012h ;# 
# 846 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
SSPBUF equ 013h ;# 
# 853 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
SSPCON equ 014h ;# 
# 923 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
CCPR1 equ 015h ;# 
# 930 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
CCPR1L equ 015h ;# 
# 937 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
CCPR1H equ 016h ;# 
# 944 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
CCP1CON equ 017h ;# 
# 1002 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
RCSTA equ 018h ;# 
# 1097 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
TXREG equ 019h ;# 
# 1104 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
RCREG equ 01Ah ;# 
# 1111 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
CCPR2 equ 01Bh ;# 
# 1118 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
CCPR2L equ 01Bh ;# 
# 1125 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
CCPR2H equ 01Ch ;# 
# 1132 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
CCP2CON equ 01Dh ;# 
# 1190 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
ADRESH equ 01Eh ;# 
# 1197 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
ADCON0 equ 01Fh ;# 
# 1298 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
OPTION_REG equ 081h ;# 
# 1368 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
TRISA equ 085h ;# 
# 1430 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
TRISB equ 086h ;# 
# 1492 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
TRISC equ 087h ;# 
# 1554 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
TRISD equ 088h ;# 
# 1616 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
TRISE equ 089h ;# 
# 1654 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
PIE1 equ 08Ch ;# 
# 1716 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
PIE2 equ 08Dh ;# 
# 1768 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
PCON equ 08Eh ;# 
# 1809 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
OSCCON equ 08Fh ;# 
# 1874 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
OSCTUNE equ 090h ;# 
# 1926 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
ANSEL equ 091h ;# 
# 2046 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
PR2 equ 092h ;# 
# 2053 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
SSPADD equ 093h ;# 
# 2060 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
SSPSTAT equ 094h ;# 
# 2229 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
WPUB equ 095h ;# 
# 2234 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
WPU equ 095h ;# 
# 2467 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
IOCB equ 096h ;# 
# 2472 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
IOC equ 096h ;# 
# 2615 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
CMCON1 equ 097h ;# 
# 2641 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
TXSTA equ 098h ;# 
# 2722 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
SPBRG equ 099h ;# 
# 2729 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
CMCON0 equ 09Ch ;# 
# 2799 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
VRCON equ 09Dh ;# 
# 2859 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
ADRESL equ 09Eh ;# 
# 2866 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
ADCON1 equ 09Fh ;# 
# 2908 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
WDTCON equ 0105h ;# 
# 2966 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
LCDCON equ 0107h ;# 
# 3042 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
LCDPS equ 0108h ;# 
# 3112 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
LVDCON equ 0109h ;# 
# 3165 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
EEDATL equ 010Ch ;# 
# 3170 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
EEDATA equ 010Ch ;# 
# 3303 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
EEADRL equ 010Dh ;# 
# 3308 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
EEADR equ 010Dh ;# 
# 3441 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
EEDATH equ 010Eh ;# 
# 3491 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
EEADRH equ 010Fh ;# 
# 3535 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
LCDDATA0 equ 0110h ;# 
# 3697 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
LCDDATA1 equ 0111h ;# 
# 3859 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
LCDDATA2 equ 0112h ;# 
# 4021 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
LCDDATA3 equ 0113h ;# 
# 4183 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
LCDDATA4 equ 0114h ;# 
# 4345 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
LCDDATA5 equ 0115h ;# 
# 4507 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
LCDDATA6 equ 0116h ;# 
# 4669 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
LCDDATA7 equ 0117h ;# 
# 4831 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
LCDDATA8 equ 0118h ;# 
# 4993 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
LCDDATA9 equ 0119h ;# 
# 5155 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
LCDDATA10 equ 011Ah ;# 
# 5317 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
LCDDATA11 equ 011Bh ;# 
# 5479 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
LCDSE0 equ 011Ch ;# 
# 5641 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
LCDSE1 equ 011Dh ;# 
# 5803 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
LCDSE2 equ 011Eh ;# 
# 5965 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
EECON1 equ 018Ch ;# 
# 6024 "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\include\proc\pic16f917.h"
EECON2 equ 018Dh ;# 
	debug_source C
	FNCALL	_main,_clock_init
	FNCALL	_main,_printf
	FNCALL	_main,_uart_send_char
	FNCALL	_main,_usart_init
	FNCALL	_printf,_putch
	FNROOT	_main
	global	_RCSTA
_RCSTA	set	0x18
	global	_TXREG
_TXREG	set	0x19
	global	_INTCON
_INTCON	set	0xB
	global	_SPBRG
_SPBRG	set	0x99
	global	_TXSTA
_TXSTA	set	0x98
	global	_OSCCON
_OSCCON	set	0x8F
	global	_TXEN
_TXEN	set	0x4C5
	global	_TXIE
_TXIE	set	0x464
psect	strings,class=STRING,delta=2,noexec
global __pstrings
__pstrings:
stringtab:
	global    __stringtab
__stringtab:
;	String table - string pointers are 1 byte each
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
	global __stringbase
__stringbase:
	retlw	0
psect	strings
	global    __end_of__stringtab
__end_of__stringtab:
	
STR_1:	
	retlw	72	;'H'
	retlw	101	;'e'
	retlw	108	;'l'
	retlw	108	;'l'
	retlw	111	;'o'
	retlw	0
psect	strings
; #config settings
	config pad_punits      = on
	config apply_mask      = off
	config ignore_cmsgs    = off
	config default_configs = off
	config default_idlocs  = off
	config FOSC = "EXTRCCLK"
	config WDTE = "ON"
	config PWRTE = "OFF"
	config MCLRE = "ON"
	config CP = "OFF"
	config CPD = "OFF"
	config BOREN = "ON"
	config IESO = "ON"
	config FCMEN = "ON"
	config DEBUG = "OFF"
	file	"main.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

global __initialization
__initialization:
psect cinit,class=CODE,delta=2,merge=1
global end_of_initialization,__end_of__initialization

;End of C runtime variable initialization code

end_of_initialization:
__end_of__initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1,noexec
global __pcstackCOMMON
__pcstackCOMMON:
??_usart_init:	; 1 bytes @ 0x0
??_uart_send_char:	; 1 bytes @ 0x0
??_printf:	; 1 bytes @ 0x0
?_putch:	; 1 bytes @ 0x0
??_putch:	; 1 bytes @ 0x0
??_clock_init:	; 1 bytes @ 0x0
?_usart_init:	; 2 bytes @ 0x0
?_uart_send_char:	; 2 bytes @ 0x0
	global	?_printf
?_printf:	; 2 bytes @ 0x0
?_clock_init:	; 2 bytes @ 0x0
?_main:	; 2 bytes @ 0x0
	global	clock_init@bits
clock_init@bits:	; 1 bytes @ 0x0
	global	uart_send_char@c
uart_send_char@c:	; 1 bytes @ 0x0
	global	usart_init@tx_bits
usart_init@tx_bits:	; 1 bytes @ 0x0
putch@c:	; 1 bytes @ 0x0
	ds	1
	global	usart_init@rx_bits
usart_init@rx_bits:	; 1 bytes @ 0x1
	global	printf@ap
printf@ap:	; 1 bytes @ 0x1
	ds	1
	global	printf@c
printf@c:	; 1 bytes @ 0x2
	ds	1
	global	printf@f
printf@f:	; 1 bytes @ 0x3
	ds	1
??_main:	; 1 bytes @ 0x4
	global	main@inter_bits
main@inter_bits:	; 1 bytes @ 0x4
	ds	1
;!
;!Data Sizes:
;!    Strings     6
;!    Constant    0
;!    Data        0
;!    BSS         0
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMMON           14      5       5
;!    BANK0            80      0       0
;!    BANK1            80      0       0
;!    BANK3            96      0       0
;!    BANK2            80      0       0

;!
;!Pointer List with Targets:
;!
;!    printf@f	PTR const unsigned char  size(1) Largest target is 6
;!		 -> STR_1(CODE[6]), 
;!
;!    printf@ap	PTR void [1] size(1) Largest target is 2
;!		 -> ?_printf(COMMON[2]), 
;!


;!
;!Critical Paths under _main in COMMON
;!
;!    _main->_printf
;!
;!Critical Paths under _main in BANK0
;!
;!    None.
;!
;!Critical Paths under _main in BANK1
;!
;!    None.
;!
;!Critical Paths under _main in BANK3
;!
;!    None.
;!
;!Critical Paths under _main in BANK2
;!
;!    None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;!
;!Call Graph Tables:
;!
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (0) _main                                                 2     2      0     180
;!                                              4 COMMON     1     1      0
;!                         _clock_init
;!                             _printf
;!                     _uart_send_char
;!                         _usart_init
;! ---------------------------------------------------------------------------------
;! (1) _usart_init                                           2     2      0      30
;!                                              0 COMMON     2     2      0
;! ---------------------------------------------------------------------------------
;! (1) _uart_send_char                                       1     1      0      15
;!                                              0 COMMON     1     1      0
;! ---------------------------------------------------------------------------------
;! (1) _printf                                              16    16      0      73
;!                                              0 COMMON     4     4      0
;!                              _putch
;! ---------------------------------------------------------------------------------
;! (2) _putch                                                1     1      0       0
;! ---------------------------------------------------------------------------------
;! (1) _clock_init                                           1     1      0      15
;!                                              0 COMMON     1     1      0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 2
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   _clock_init
;!   _printf
;!     _putch
;!   _uart_send_char
;!   _usart_init
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BITCOMMON            E      0       0       0        0.0%
;!EEDATA             100      0       0       0        0.0%
;!NULL                 0      0       0       0        0.0%
;!CODE                 0      0       0       0        0.0%
;!COMMON               E      5       5       1       35.7%
;!BITSFR0              0      0       0       1        0.0%
;!SFR0                 0      0       0       1        0.0%
;!BITSFR1              0      0       0       2        0.0%
;!SFR1                 0      0       0       2        0.0%
;!STACK                0      0       0       2        0.0%
;!BITBANK0            50      0       0       3        0.0%
;!BANK0               50      0       0       4        0.0%
;!BITSFR3              0      0       0       4        0.0%
;!SFR3                 0      0       0       4        0.0%
;!BITBANK1            50      0       0       5        0.0%
;!BITSFR2              0      0       0       5        0.0%
;!SFR2                 0      0       0       5        0.0%
;!BANK1               50      0       0       6        0.0%
;!BITBANK3            60      0       0       7        0.0%
;!BANK3               60      0       0       8        0.0%
;!BANK2               50      0       0       9        0.0%
;!ABS                  0      0       0      10        0.0%
;!BITBANK2            50      0       0      11        0.0%
;!DATA                 0      0       0      12        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 31 in file "../main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  inter_bits      1    4[COMMON] struct .
;;  c               1    0        unsigned char 
;; Return value:  Size  Location     Type
;;                  2   17[None  ] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : B00/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels required when called: 2
;; This function calls:
;;		_clock_init
;;		_printf
;;		_uart_send_char
;;		_usart_init
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext,global,class=CODE,delta=2,split=1,group=0
	file	"../main.c"
	line	31
global __pmaintext
__pmaintext:	;psect for function _main
psect	maintext
	file	"../main.c"
	line	31
	
_main:	
;incstack = 0
	callstack 6
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	34
	
l638:	
	bsf	(main@inter_bits),7
	line	35
	bsf	(main@inter_bits),6
	line	36
	
l640:	
	movf	(main@inter_bits),w
	movwf	(11)	;volatile
	line	38
	
l642:	
	fcall	_clock_init
	line	39
	
l644:	
	fcall	_usart_init
	line	43
	
l646:	
	movlw	low(0FFh)
	fcall	_uart_send_char
	line	44
	
l648:	
	movlw	(low((((STR_1)-__stringbase)|8000h)))&0ffh
	fcall	_printf
	line	46
	
l18:	
	global	start
	ljmp	start
	callstack 0
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,90
	global	_usart_init

;; *************** function _usart_init *****************
;; Defined at:
;;		line 10 in file "../uart.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  rx_bits         1    1[COMMON] struct .
;;  tx_bits         1    0[COMMON] struct .
;; Return value:  Size  Location     Type
;;                  2    6[None  ] int 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : B00/100
;;		On exit  : B00/100
;;		Unchanged: 800/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,local,class=CODE,delta=2,merge=1,group=0
	file	"../uart.c"
	line	10
global __ptext1
__ptext1:	;psect for function _usart_init
psect	text1
	file	"../uart.c"
	line	10
	
_usart_init:	
;incstack = 0
	callstack 7
; Regs used in _usart_init: [wreg]
	line	15
	
l588:	
	bcf	(usart_init@tx_bits),7
	line	16
	bcf	(usart_init@tx_bits),6
	line	17
	bcf	(usart_init@tx_bits),4
	line	18
	bsf	(usart_init@tx_bits),2
	line	19
	
l590:	
	movf	(usart_init@tx_bits),w
	movwf	(152)^080h	;volatile
	line	20
	
l592:	
	bsf	(1124/8)^080h,(1124)&7	;volatile
	line	21
	
l594:	
	bsf	(1221/8)^080h,(1221)&7	;volatile
	line	24
	
l596:	
	bsf	(usart_init@rx_bits),7
	line	25
	
l598:	
	bcf	(usart_init@rx_bits),6
	line	26
	
l600:	
	bcf	(usart_init@rx_bits),5
	line	27
	
l602:	
	bsf	(usart_init@rx_bits),4
	line	28
	
l604:	
	bcf	(usart_init@rx_bits),3
	line	30
	movf	(usart_init@rx_bits),w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(24)	;volatile
	line	32
	movlw	low(0Ch)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(153)^080h	;volatile
	line	35
	
l36:	
	return
	callstack 0
GLOBAL	__end_of_usart_init
	__end_of_usart_init:
	signat	_usart_init,90
	global	_uart_send_char

;; *************** function _uart_send_char *****************
;; Defined at:
;;		line 5 in file "../uart.c"
;; Parameters:    Size  Location     Type
;;  c               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  c               1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    8[None  ] int 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : B00/100
;;		On exit  : B00/0
;;		Unchanged: 800/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text2,local,class=CODE,delta=2,merge=1,group=0
	line	5
global __ptext2
__ptext2:	;psect for function _uart_send_char
psect	text2
	file	"../uart.c"
	line	5
	
_uart_send_char:	
;incstack = 0
	callstack 7
; Regs used in _uart_send_char: [wreg]
	movwf	(uart_send_char@c)
	line	6
	
l608:	
	movf	(uart_send_char@c),w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	8
	
l33:	
	return
	callstack 0
GLOBAL	__end_of_uart_send_char
	__end_of_uart_send_char:
	signat	_uart_send_char,4218
	global	_printf

;; *************** function _printf *****************
;; Defined at:
;;		line 477 in file "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\sources\c90\common\doprnt.c"
;; Parameters:    Size  Location     Type
;;  f               1    wreg     PTR const unsigned char 
;;		 -> STR_1(6), 
;; Auto vars:     Size  Location     Type
;;  f               1    3[COMMON] PTR const unsigned char 
;;		 -> STR_1(6), 
;;  tmpval          4    0        struct .
;;  cp              2    0        PTR const unsigned char 
;;  len             2    0        unsigned int 
;;  val             2    0        unsigned int 
;;  c               1    2[COMMON] unsigned char 
;;  ap              1    1[COMMON] PTR void [1]
;;		 -> ?_printf(2), 
;;  flag            1    0        unsigned char 
;;  prec            1    0        char 
;; Return value:  Size  Location     Type
;;                  2   10[None  ] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : B00/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         3       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		_putch
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text3,local,class=CODE,delta=2,merge=1,group=1
	file	"G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\sources\c90\common\doprnt.c"
	line	477
global __ptext3
__ptext3:	;psect for function _printf
psect	text3
	file	"G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\sources\c90\common\doprnt.c"
	line	477
	
_printf:	
;incstack = 0
	callstack 6
; Regs used in _printf: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	movwf	(printf@f)
	line	550
	
l632:	
	movlw	(low(?_printf|((0x00)<<8)))&0ffh
	movwf	(??_printf+0)+0
	movf	(??_printf+0)+0,w
	movwf	(printf@ap)
	line	553
	goto	l636
	line	558
	
l634:	
	movf	(printf@c),w
	fcall	_putch
	line	553
	
l636:	
	movlw	01h
	addwf	(printf@f),f
	movlw	-01h
	addwf	(printf@f),w
	movwf	fsr0
	fcall	stringdir
	movwf	(??_printf+0)+0
	movf	(??_printf+0)+0,w
	movwf	(printf@c)
	movf	(((printf@c))),w
	btfss	status,2
	goto	u21
	goto	u20
u21:
	goto	l634
u20:
	line	1567
	
l128:	
	return
	callstack 0
GLOBAL	__end_of_printf
	__end_of_printf:
	signat	_printf,602
	global	_putch

;; *************** function _putch *****************
;; Defined at:
;;		line 7 in file "G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\sources\c90\common\putch.c"
;; Parameters:    Size  Location     Type
;;  c               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  c               1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_printf
;; This function uses a non-reentrant model
;;
psect	text4,local,class=CODE,delta=2,merge=1,group=3
	file	"G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\sources\c90\common\putch.c"
	line	7
global __ptext4
__ptext4:	;psect for function _putch
psect	text4
	file	"G:\nainstalovane_programy\Microchip\xc8\v2.36\pic\sources\c90\common\putch.c"
	line	7
	
_putch:	
;incstack = 0
	callstack 6
; Regs used in _putch: [wreg]
	line	9
	
l558:	
	return
	callstack 0
GLOBAL	__end_of_putch
	__end_of_putch:
	signat	_putch,4217
	global	_clock_init

;; *************** function _clock_init *****************
;; Defined at:
;;		line 22 in file "../main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  bits            1    0[COMMON] struct .
;; Return value:  Size  Location     Type
;;                  2   12[None  ] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : B00/0
;;		On exit  : B00/100
;;		Unchanged: 800/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text5,local,class=CODE,delta=2,merge=1,group=0
	file	"../main.c"
	line	22
global __ptext5
__ptext5:	;psect for function _clock_init
psect	text5
	file	"../main.c"
	line	22
	
_clock_init:	
;incstack = 0
	callstack 7
; Regs used in _clock_init: [wreg+status,2+status,0]
	line	25
	
l580:	
	movf	(clock_init@bits),w
	andlw	not (((1<<3)-1)<<4)
	iorlw	(06h & ((1<<3)-1))<<4
	movwf	(clock_init@bits)
	line	26
	
l582:	
	bsf	(clock_init@bits),0
	line	27
	
l584:	
	movf	(clock_init@bits),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(143)^080h	;volatile
	line	29
	
l13:	
	return
	callstack 0
GLOBAL	__end_of_clock_init
	__end_of_clock_init:
	signat	_clock_init,90
global	___latbits
___latbits	equ	2
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp+0
	end
