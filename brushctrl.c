#include <stdint.h>

#include "main.h"
#include "brushctrl.h"
#include "pic16f917.h"


void step_motor(uint8_t steps, uint8_t direction){
    // Moves motor 'steps'-numer of steps (half rotations)
    // Direction --> True == Push, False == Pull
    _motor_cnt = steps;
    if (direction){
        // CCW rotation
        PORTDbits.RD7 = 0;
        PORTDbits.RD6 = 1;
        PORTDbits.RD5 = 1;
    } else {
        // CW rotation
        PORTDbits.RD7 = 1;
        PORTDbits.RD6 = 0;
        PORTDbits.RD5 = 0;
    }
}

void motor_init(){
    INTCONbits.INTE = 1;    // Enable external interrupt on RB0/INT/SEG0 pin   
    INTCONbits.GIE = 1;     // Enable global interrupt
    INTCONbits.PEIE = 1;
    OPTION_REGbits.INTEDG = 1; // Interrupt on rising edge

    TRISDbits.TRISD7 = 0;
    TRISDbits.TRISD6 = 0;
    TRISDbits.TRISD5 = 0;
    TRISDbits.TRISD2 = 0;
    
    PORTDbits.RD7 = 0;
    PORTDbits.RD6 = 0;
    PORTDbits.RD5 = 1;
    PORTDbits.RD2 = 1;

    // PWM control
    T2CON = 0b10;           // Prescaler 16x
    T2CONbits.TMR2ON = 1;   // Timer2 enable
    PIE1bits.TMR2IE = 0;    // Disable PWM interrupt
    PR2 = 0x30;             // Period

    CCP2CON = 0b00 << 4;    // Two Lsbs for CCPR
    CCPR2L = 0x18;          // Capture compare register (0x18 for 2.5V)
    CCP2CON = 0b1100;       // PWM mode
}


