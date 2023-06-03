#include <8051.h>

void delay(unsigned int milliseconds) {
    unsigned int i, j;
    for (i = 0; i < milliseconds; i++)
        for (j = 0; j < 1275; j++);
}

void tput(unsigned char c1)
{
	SBUF=c1; 
	while(!TI); 
	TI=0; 
	//delay(1000);
}

void main()
{
	char z;
	int i;
	unsigned char src[]={'a','b','c'};
	unsigned char xdata *ptr = (unsigned char xdata *)0x30;
	unsigned char nabor;

	//TMOD = 0x20;
	PCON = 0x80;
	//TH1 = 0x0F8;

    for (i = 0; i < sizeof(src); i++) {
        *ptr = src[i];
        ptr++; 
    }
	ptr = (unsigned char xdata *)0x30;

	for(i=0; i<sizeof(src); i++)
	{
		ACC = *ptr;
		nabor = *ptr;
		SCON = 0x88;
		tput(nabor);
		ptr++;
	}
	while(1){} 
}