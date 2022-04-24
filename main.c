#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include "pic16f917.h"

#include "uart.h"
#include "LCD.h"
#include "brushctrl.h"
#include "temp_sen.h"

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
// TEMP --> AN0         --> Temperature sensor


//UART communication
//Baud 9600
//8bits
//parity none
//send string end with '\n' or LF

uint8_t _motor_cnt = 0;

//#define _AUTOCOMP
#ifndef _AUTOCOMP

void __interrupt() Isr(void) {
    // Global interrupt service routine (only 1 interrupt vector)
    if (INTCONbits.INTF) {
        INTCONbits.INTF = 0;
        if (!--_motor_cnt) {
            PORTDbits.RD7 = 0;
            PORTDbits.RD6 = 0;
        }
    }

}
#endif

int main() {
    // Entry point
    LCD_init();
    motor_init();
    temp_sen_init();
    usart_init();

    float temp = 0;
    char quest_1[10] = "MIN TEMP:";
    char quest_2[10] = "MAX TEMP:";
    char st_min[5] = {0};
    char st_max[5] = {0};
    float fl_min = 0;
    float fl_max = 0;

    uint8_t temp_limit_set = 0;
    // Prescaler 1:128 for TMR0
    // Interrupt on falling edge?
    // TMR0 clock source select -> Internal instruction cycle (CLKO)
    // TMR0 increment on low-to-high
    // Prescaler is assigned to TMR0
    OPTION_REG = 0b10000111;
    float temp_prev = 0;
    float temp_next = 0;
    uint8_t rot = 0;
    uint8_t dir = 0;
    uint8_t btn_cnt = 0;
    uint8_t btndbc = 0;
    int time_cnt = 0;

    uint8_t update_disp = 0;


    TRISAbits.TRISA4 = 1; // Configure switch 2 to input


    while (1) {
        if (temp_limit_set == 0) {
            LCD_show_error(0);
            step_motor(200, 0); //set default position of the window == closed
            //ask for min temperature, receive min temperature and send back
            send_str(quest_1);
            cp_str(st_min, receive_str());
            while (check_num(st_min) == 0) {
                LCD_show_error(1);
                send_str(quest_1);
                cp_str(st_min, receive_str());
            }
            send_str(st_min);
            send_str("\n\r");
            fl_min = (float) atof(st_min);

            //ask for max temperature, receive max temperature and send back
            send_str(quest_2);
            cp_str(st_max, receive_str());
            while (check_num(st_max) == 0) {
                LCD_show_error(2);
                send_str(quest_2);
                cp_str(st_max, receive_str());
            }
            send_str(st_max);
            send_str("\n\r");
            fl_max = (float) atof(st_max);
            temp_limit_set = 1; //temperature limits from user were set
            btn_cnt = 3;        // Show current temperature
            time_cnt = 150;     // Update temperature reading
        }
        if (temp_limit_set == 1) { //check if temperature limits from user were set
            if (INTCONbits.T0IF) { //timer 0, 25ms
                INTCONbits.T0IF = 0;
                TMR0 = 60; //25ms 
                time_cnt++;
                if (time_cnt >= 150) { //25ms * 2400 == 1 minute //25ms * 400 == 10 s//25ms * 150 == 3.75 s
                    time_cnt = 0;
                    temp = read_temp(); //read actual temperature from sensor 
                    update_disp = 1;    // Update display w/ current temperature
                    temp_next = to_percent(temp, fl_min, fl_max); //conversion actual temp to percent
                    if (temp_next > temp_prev) { //hotter or colder - set direction of the rotation
                        dir = 1;
                    } else {
                        dir = 0;
                    }
                    rot = (uint8_t)(2 * abs((int)(temp_next - temp_prev))); //number of rotations for DC motor
                    temp_prev = temp_next; //update of temp value
                    if (rot > 0) { //adjust the window position if the temperature has changed
                        step_motor(rot, dir);
                    }
                }
            }
        }
        if (!PORTAbits.RA4 || update_disp) { //board button
            btndbc = (uint8_t)(btndbc << 1) | (!PORTAbits.RA4); //button debounc
            if (btndbc == 1 || update_disp) {
                if (update_disp)
                    update_disp=0;
                else
                    btn_cnt++;
                if (btn_cnt>4)
                    btn_cnt = 1;
                switch (btn_cnt) {
                    case 1:
                        LCD_show_number(fl_min);
                        break;
                    case 2:
                        LCD_show_number(fl_max);
                        break;
                    case 3:
                        //temp = read_temp(); //read temperature on sensor
                        LCD_show_number(temp);
                        break;
                    case 4:
                        LCD_show_number(to_percent(temp, fl_min, fl_max));
                        break;
                    default:
                        LCD_show_error(3);
                        break;
                }
            }
        } else {
            btndbc = 0;
        }
    }
    return 0;
}
