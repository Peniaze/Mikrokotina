#ifndef TEMP_SEN_H
#define	TEMP_SEN_H

float read_temp(void);
void temp_sen_init(void);
float to_percent(float temp, float min , float max);

#endif	

    
