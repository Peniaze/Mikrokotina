#include <stdint.h>
#include "pic16f917.h"
#include "uart.h"

void putch(char data){
    while (!TXIF)
        continue;
    TXREG = data;
}

int usart_init(void){
    // Initialization
    // Baud rate == Fosc/(64 * (X+1))
    // X --> SPBRG register
    TXSTAbits_t tx_bits;
    tx_bits.CSRC = 0;  // Don't care
    tx_bits.TX9 = 0;   // 8-bit transmission
    tx_bits.SYNC = 0;  // Asynchronous mode
    tx_bits.BRGH = 1;  // High speed
    TXSTA = *((uint8_t*) &tx_bits);
    TXIE = 0;           // Disable interrupt
    TXEN = 1;           // Enable transmission

    RCSTAbits_t rx_bits;
    rx_bits.SPEN = 1;   // Serial port enabled
    rx_bits.RX9 = 0;    // 8-bit reception
    rx_bits.SREN = 0;   // Don't care
    rx_bits.CREN = 1;   // Enables continuous receive
    rx_bits.ADDEN = 0;  // Disables address detection

    RCSTA = *((uint8_t*) &rx_bits);

    SPBRG = 12;     // 19.231 kBaud

    return 0;
}

