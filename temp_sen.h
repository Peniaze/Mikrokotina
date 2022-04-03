#ifndef TEMP_SEN_H
#define	TEMP_SEN_H

void timer0_init();
float read_temp();
void temp_sen_init();
float to_percent(float temp, float min , float max);

#endif	

    