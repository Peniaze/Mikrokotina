#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "pic16f917.h"
#include "uart.h"

void put_char(char data);
char read_char();

void usart_init(void){
    TXSTAbits.TXEN = 1; //transmit enable
    TXSTAbits.BRGH = 1; //High speed
    
    RCSTAbits.SPEN = 1; //enabled serial port
    RCSTAbits.CREN = 1; //enabled receive
    
    SPBRG = 25; //Baud rate 9600
}

//send string by UART
void send_str(char * str){
    uint8_t i = 0;
    while(i < strlen(str)){
        put_char(str[i]);
        i++;
    }
}

void put_char(char data){
    while (!TRMT);
    TXREG = data;
}

//receive string from UART
//return first 4 received char or less and last char is \n
char * receive_str(){
    RCSTAbits.CREN = 1; //enabled receive
    char buf[5] = {0};
    uint8_t i = 0;
    while(i < 5){
        buf[i] = read_char();
        if(buf[i] == '\n'){
            RCSTAbits.CREN = 0; //disable receive
            break;
        }
        i++;
    }
    RCSTAbits.CREN = 0; //disable receive
    buf[4] = '\n';
    return buf;
}

char read_char(){                          
    while(!RCIF);
    return RCREG;
}

//copy string form scr to dst without \n
void cp_str(char * dst,char * src){
    uint8_t i = 0;
    for(i = 0; i < 5; i++){ //clear dst with 0
        dst[i] = 0;
    }
    for(i = 0; src[i] != '\n'; i++){
        dst[i] = src[i];
    }
}

void wait_s(uint32_t max){
    uint32_t i = 0;
    while(i < max){
        i++;
    }
}

// return 1 if string can be convert to number
uint8_t check_num(char * buf){
    uint8_t i = 0;
    while(i < 5){
        //if char is not number from '0' to '9' or '.', return 0 
        if(!(((buf[i] >= '0') && (buf[i] <='9')) || (buf[i] == '.') 
        || (buf[i] == 0))){
            return 0;
        }
        i++;
    }
    return 1;
}