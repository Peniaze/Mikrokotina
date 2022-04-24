#ifndef LCD_H
#define LCD_H

// Error numbers:
// 00 --> Power on reset
// 01 --> Failed to read min temperature
// 02 --> Failed to read max temperature
// 03 --> Wrong button state
// 04 --> Number out of limits for display
// 99 --> Error number out of range

void LCD_init(void);
void LCD_show_number(float num);
void LCD_show_error(uint16_t num);


#endif
