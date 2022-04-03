#ifndef UART_H
#define UART_H

void usart_init(void);
void send_str(char * str);
char * receive_str();
void cp_str(char * dst,char * src);
void wait_s(uint32_t max);
uint8_t check_num(char * buf);
float str_fl(char * str);

#endif
