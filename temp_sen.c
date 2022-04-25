#include <stdint.h>
#include "pic16f917.h"

#include "temp_sen.h"

//TC1047A temperature sensore
//INTOSC FREQUENCY 4MHz

void temp_sen_init(){
    //reference vdd, channel AN0, 
    ADCON0bits.ADON = 1;    //enable adc
    ADCON1 &= 0x50;         //FOCS/16
    
}

//return digital value of analog signal in 10 bits
uint16_t sample_adc(){
    ADCON0bits.GO = 1;      //sample adc
    while(ADCON0bits.GO);
    return ((uint16_t)ADRESH << 2) | (ADRESL >> 6);
}

//measure temperature on sensor, return in Celsius
float read_temp(){
    return ((sample_adc() / 204.6f) - 0.5f) / 0.01f; //conversion voltage to temperature
}


//return percentage value of temp in interval max - min
float to_percent(float temp, float min , float max){
    if(temp <= min){
        return 0;
    }
    else if(temp >= max){
        return 100;
    }
    else{
        return (temp - min) / (max - min) * 100;
    }
}
