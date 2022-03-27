#ifndef LCD_H
#define LCD_H

#define NUM_0 0b01111110
#define NUM_1 0b00110000
#define NUM_2 0b01101101
#define NUM_3 0b01111001
#define NUM_4 0b00110011
#define NUM_5 0b01011011
#define NUM_6 0b01011111
#define NUM_7 0b01110000
#define NUM_8 0b01111111
#define NUM_9 0b01111011

// Erorr numbers:
// 00 --> Number out of limits for display
// 99 --> Error number out of range

void LCD_init(void);
void LCD_show_number(float num);
void LCD_show_error(uint16_t num);


#endif
