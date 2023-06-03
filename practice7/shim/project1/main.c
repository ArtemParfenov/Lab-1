#include <htc.h>
unsigned int tmpCnt;

void imp(unsigned int cnt)
{
	do{ }while(TF2==0);
	TF2 = 0;
	P10 = 1;
	while (cnt != 0)cnt--;
	P10 = 0;
}

void main()
{
	P3 = 0x0;
 	P1 = 0xFE; 
 	RCAP2H = 0x56; 
 	RCAP2L = 0xC8; 
 	T2CON &= 0xFC;
 	ET2 = 1; 
 	EA = 1; 
 	T2CON |= 0x4; 
	while(1)
	{
		if (P36 > 0) {
			imp(2700);
			continue;
		}
		else if (P37 > 0) {
			imp(1250);
			continue;
		}
		else {
			continue;
		}

	}
}