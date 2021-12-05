#ifndef __SYS_H
#define __SYS_H

#include "wm_hal.h"
#include "assert.h"

//一条nop等于  1/(freq(Mhz)/12)us
//240/160 MHZ下  3个nop就是20ns

//160MZH  48个nop就是1us
//240Mhz  80个nop就是1us
//可以实现1ms以下的延时，多了的 就不要用了。不准。
//5u以下的延时会存在误差 注意。
static void Delay_Us(uint8_t freq,uint32_t time)
{
	uint32_t i;
	uint16_t num = 90;
	if(time > 1000)
	{
		printf("delay time is too lager than 1000, please use HAL_Delay()\r\n");
	}
	switch(freq)
	{
		case 240: num = 83;break;
		case 160: num = 55;break;
		default: printf("delay input freq err...default set 240MHZ us time \r\n ");break;
	}
	
	for (i = 0; i < (num)*time; i++)
	{
		__NOP();
	}
}



static char table[]={'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};

/*
 * str：	字符串
 * number：	数字
 * g：		整数位数
 * l：		小数位数
 * chr：	单位
 */
void num2char(uint8_t *str, double number, uint8_t g, uint8_t l, char *chr)
{
	assert(str != NULL);
	assert(chr != NULL);
	
    uint8_t i;
    int temp = number/1;
    double t2 = 0.0;
    for (i = 1; i<=g; i++)
    {
        if (temp==0)
            str[g-i] = table[0];
        else
            str[g-i] = table[temp%10];
        temp = temp/10;
    }
	if(0 == l)
		goto end;
    *(str+g) = '.';
    temp = 0;
    t2 = number;
    for(i=1; i<=l; i++)
    {
        temp = t2*10;
        str[g+i] = table[temp%10];
        t2 = t2*10;
    }
	//加上单位
	memcpy(str+g+l+1,chr,strlen(chr)+1);
	return ;
	end:
	//没有冒号
	memcpy(str+g+l,chr,strlen(chr)+1);
}


void time2string(uint8_t *str, uint8_t Hour, uint8_t Min, uint8_t Sec)
{
	assert(str != NULL);
	assert(Hour <= 999);
	assert(Min <= 59);
	assert(Sec <= 59);
	
	uint8_t i;
	uint8_t *dst_str = str;
    int temp = Hour/1;
	uint8_t hour_len = 3;
	uint8_t min_len = 2;
	uint8_t sec_len = 2;
    for (i = 1; i<=hour_len; i++)
    {
        if (temp==0)
            dst_str[hour_len-i] = table[0];
        else
            dst_str[hour_len-i] = table[temp%10];
        temp = temp/10;
    }
	
	dst_str+=3;
    *dst_str++ = ':';
	
	//Min
	temp = Min/1;
	for (i = 1; i<=min_len; i++)
    {
        if (temp==0)
            dst_str[min_len-i] = table[0];
        else
            dst_str[min_len-i] = table[temp%10];
        temp = temp/10;
    }
	dst_str+=2;
	
	//加1是因为":"占位了
    *dst_str++ = ':';
	
	//Sec
	temp = Sec/1;
	for (i = 1; i<=sec_len; i++)
    {
        if (temp==0)
            dst_str[sec_len-i] = table[0];
        else
            dst_str[sec_len-i] = table[temp%10];
        temp = temp/10;
    }
	dst_str+=2;
	
	//加2是因为两个":"占位了
    *dst_str++ = '\0';
}




#endif
