#include <stdint.h>
#include <math.h>

#include "LCD.h"
#include "pic16f917.h"

// Array of all digits
uint8_t list_nums[] = {NUM_0, NUM_1, NUM_2, NUM_3, NUM_4, NUM_5, NUM_6, NUM_7, NUM_8, NUM_9};

void clear_display(void);

void LCD_init(){
    // Initialization of LCD

    // Enabling of segments
    // SEG0 is disabled (only pin for external interrupt)
    LCDSE0 = 0b01001110; // 1 -> enabled, 0 -> disabled
    LCDSE1 = 0b00001000;
    LCDSE2 = 0b11100001;

    LCDCONbits.LCDEN = 1;   // LCD enabled
    LCDCONbits.CS = 0;      // Clock select (FOSC/8192)
    LCDCONbits.LMUX = 0b11; // Multiplex 1/4 (COM <3:0>)
}

void clear_display(){
    // Clear display
    LCDDATA0    &= 0b10110000;
    LCDDATA1    &= 0b11110111;
    LCDDATA2    &= 0b00011110;
    LCDDATA3    &= 0b10110000;
    LCDDATA4    &= 0b11110111;
    LCDDATA5    &= 0b00011110;
    LCDDATA6    &= 0b10110000;
    LCDDATA7    &= 0b11110111;
    LCDDATA8    &= 0b00011110;
    LCDDATA9    &= 0b10110000;
    LCDDATA10   &= 0b11110111;
    LCDDATA11   &= 0b00011110;
}

void LCD_show_error(uint16_t num){

    clear_display();
    // display --> 'E'
    LCDDATA0    |= 1 << 3;  // COM3, A
    LCDDATA1    |= 0 << 3;  // COM3, B
    LCDDATA7    |= 0 << 3;  // COM3, C
    LCDDATA9    |= 1 << 3;  // COM3, D
    LCDDATA6    |= 1 << 3;  // COM3, E
    LCDDATA3    |= 1 << 3;  // COM3, F
    LCDDATA4    |= 1 << 3;  // COM3, G

    if (num>99){
        num = 99;
    }

    uint8_t temp = (uint8_t)(num/10);

    LCDDATA0    |= ((list_nums[temp] & 1 << 6) >> 6) << 6;  // COM2, A
    LCDDATA2    |= ((list_nums[temp] & 1 << 5) >> 5) << 5;  // COM2, B
    LCDDATA8    |= ((list_nums[temp] & 1 << 4) >> 4) << 5;  // COM2, C
    LCDDATA9    |= ((list_nums[temp] & 1 << 3) >> 3) << 6;  // COM2, D
    LCDDATA6    |= ((list_nums[temp] & 1 << 2) >> 2) << 6;  // COM2, E
    LCDDATA3    |= ((list_nums[temp] & 1 << 1) >> 1) << 6;  // COM2, F
    LCDDATA5    |= ((list_nums[temp] & 1 << 0) >> 0) << 5;  // COM2, G

    temp = (uint8_t)(num%10);

    LCDDATA2    |= ((list_nums[temp] & 1 << 6) >> 6) << 6;  // COM1, A
    LCDDATA2    |= ((list_nums[temp] & 1 << 5) >> 5) << 7;  // COM1, B
    LCDDATA8    |= ((list_nums[temp] & 1 << 4) >> 4) << 7;  // COM1, C
    LCDDATA11   |= ((list_nums[temp] & 1 << 3) >> 3) << 6;  // COM1, D
    LCDDATA8    |= ((list_nums[temp] & 1 << 2) >> 2) << 6;  // COM1, E
    LCDDATA5    |= ((list_nums[temp] & 1 << 1) >> 1) << 6;  // COM1, F
    LCDDATA5    |= ((list_nums[temp] & 1 << 0) >> 0) << 7;  // COM1, G
}

void LCD_show_number(float num){
    // Display a single positive number (from 0.0 to 100.0)

    if (num<0 || num>100.0){
        LCD_show_error(0);
        return;
    }

    clear_display();

    LCDDATA11 |= 1 << 5;    //Decimal point


    uint8_t temp = (uint8_t)(num/100);
    if (temp){
        // Hundreds
        LCDDATA6 |= 1 << 2;
    }

    // Tens
    temp = (uint8_t)(fmod(num,100)/10);

    LCDDATA0    |= ((list_nums[temp] & 1 << 6) >> 6) << 3;  // COM3, A
    LCDDATA1    |= ((list_nums[temp] & 1 << 5) >> 5) << 3;  // COM3, B
    LCDDATA7    |= ((list_nums[temp] & 1 << 4) >> 4) << 3;  // COM3, C
    LCDDATA9    |= ((list_nums[temp] & 1 << 3) >> 3) << 3;  // COM3, D
    LCDDATA6    |= ((list_nums[temp] & 1 << 2) >> 2) << 3;  // COM3, E
    LCDDATA3    |= ((list_nums[temp] & 1 << 1) >> 1) << 3;  // COM3, F
    LCDDATA4    |= ((list_nums[temp] & 1 << 0) >> 0) << 3;  // COM3, G

    // Ones
    temp = (uint8_t)fmod(num,10);

    LCDDATA0    |= ((list_nums[temp] & 1 << 6) >> 6) << 6;  // COM2, A
    LCDDATA2    |= ((list_nums[temp] & 1 << 5) >> 5) << 5;  // COM2, B
    LCDDATA8    |= ((list_nums[temp] & 1 << 4) >> 4) << 5;  // COM2, C
    LCDDATA9    |= ((list_nums[temp] & 1 << 3) >> 3) << 6;  // COM2, D
    LCDDATA6    |= ((list_nums[temp] & 1 << 2) >> 2) << 6;  // COM2, E
    LCDDATA3    |= ((list_nums[temp] & 1 << 1) >> 1) << 6;  // COM2, F
    LCDDATA5    |= ((list_nums[temp] & 1 << 0) >> 0) << 5;  // COM2, G

    // 10^-1s
    temp = (uint8_t)(fmod(num,1)*10);
    
    LCDDATA2    |= ((list_nums[temp] & 1 << 6) >> 6) << 6;  // COM1, A
    LCDDATA2    |= ((list_nums[temp] & 1 << 5) >> 5) << 7;  // COM1, B
    LCDDATA8    |= ((list_nums[temp] & 1 << 4) >> 4) << 7;  // COM1, C
    LCDDATA11   |= ((list_nums[temp] & 1 << 3) >> 3) << 6;  // COM1, D
    LCDDATA8    |= ((list_nums[temp] & 1 << 2) >> 2) << 6;  // COM1, E
    LCDDATA5    |= ((list_nums[temp] & 1 << 1) >> 1) << 6;  // COM1, F
    LCDDATA5    |= ((list_nums[temp] & 1 << 0) >> 0) << 7;  // COM1, G
}
