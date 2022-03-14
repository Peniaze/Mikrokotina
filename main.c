#include <stdio.h>
#include <stdint.h>
#include "pic16f917.h"

#include "uart.h"

// Pragma configuration

// Oscillator Selection bits : RC oscillator: CLKOUT function on RA6/OSC2/CLKOUT/T1OSO pin, RC on RA7/OSC1/CLKIN/T1OSI
// Watchdog Timer Enable bit : WDT enabled
// Power Up Timer Enable bit : PWRT disabled
// RE3/MCLR pin function select bit : RE3/MCLR pin function is MCLR
// Code Protection bit : Program memory code protection is disabled
// Data Code Protection bit : Data memory code protection is disabled
// Brown-out Reset Selection bits : BOR enabled
// Internal External Switchover bit : Internal/External Switchover mode is enabled
// Fail-Safe Clock Monitor Enabled bit : Fail-Safe Clock Monitor is enabled
// In-Circuit Debugger Mode bit : In-Circuit Debugger disabled, RB6/ISCPCLK and RB7/ICSPDAT are general purpose I/O pins
#pragma config FOSC = EXTRCCLK, WDTE = ON, PWRTE = OFF, MCLRE = ON, CP = OFF, CPD = OFF, BOREN = ON, IESO = ON, FCMEN = ON, DEBUG = OFF


int clock_init(void){
    // Clock configuration
    OSCCONbits_t bits;
    bits.IRCF = 0b110;  // Postscaler -- 4 Mhz
    bits.SCS = 1;       // Internal clock select
    OSCCON = *((uint8_t*) &bits);
    return 0;
}

int main(){
    // Interrupt control
    INTCONbits_t inter_bits;
    inter_bits.GIE = 1; // Global interrupt enable
    inter_bits.PEIE = 1;  
    INTCON = *((uint8_t*) &inter_bits);

    clock_init();
    usart_init();

    // Loading TXREG starts transmission
    uint8_t c = 0xff;

    while (1);
    return 0;
}
