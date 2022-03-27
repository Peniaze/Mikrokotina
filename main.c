#include <stdio.h>
#include <stdint.h>
#include "pic16f917.h"

#include "uart.h"
#include "LCD.h"
#include "brushctrl.h"

// Pragma configuration

// Oscillator Selection bits : INTOSC oscillator: CLKOUT function on RA6/OSC2/CLKOUT/T1OSO pin, RC on RA7/OSC1/CLKIN/T1OSI
// Watchdog Timer Enable bit : WDT disabled
// Power Up Timer Enable bit : PWRT disabled
// RE3/MCLR pin function select bit : RE3/MCLR pin function is MCLR
// Code Protection bit : Program memory code protection is disabled
// Data Code Protection bit : Data memory code protection is disabled
// Brown-out Reset Selection bits : BOR enabled
// Internal External Switchover bit : Internal/External Switchover mode is enabled
// Fail-Safe Clock Monitor Enabled bit : Fail-Safe Clock Monitor is enabled
// In-Circuit Debugger Mode bit : In-Circuit Debugger disabled, RB6/ISCPCLK and RB7/ICSPDAT are general purpose I/O pins
#pragma config FOSC = INTOSCCLK, WDTE = OFF, PWRTE = OFF, MCLRE = ON, CP = OFF, CPD = OFF, BOREN = ON, IESO = ON, FCMEN = ON, DEBUG = OFF

// PIN mapping:
// J7   --> RB0/SEG0    --> Optical interrupter (DC motor)
// N1   --> RD6         --> NMOS drive 1
// N2   --> RD2/CCP2    --> NMOS drive 2
// P1   --> RD7         --> PMOS drive 1
// P2   --> RD5         --> PMOS drive 2
// SW2  --> RA4         --> button 2


uint8_t _motor_cnt = 0;

//#define _AUTOCOMP
#ifndef _AUTOCOMP
void __interrupt() Isr(void){
    // Global interrupt service routine (only 1 interrupt vector)
    if (INTCONbits.INTF){
        INTCONbits.INTF = 0;
        if (!--_motor_cnt){
            PORTDbits.RD7 = 0;
            PORTDbits.RD6 = 0;
        }
    }

}
#endif

int main(){
    // Entry point
    
    LCD_init();
    motor_init();

    float test = 48.95f;
    //test = 101.0f;
    LCD_show_number(test);

    TRISAbits.TRISA4 = 1;  // Configure switch 2 to input
    
    while (PORTAbits.RA4);  // Wait for button press

    while (1){
        if (!PORTAbits.RA4)
            step_motor(200, 0);
    }
    return 0;
}
