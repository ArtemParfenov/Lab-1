#include <8051.h> 
void msec (int x)  
{
	while(x-->0) 
	{
		TH0 = (-1000)>>8; 
		TL0 = -1000; 
		TR0 = 1;  
	do;
	while(TF0==0); 
	TF0=0;  
	TR0=0;  
	}
}
void main() 
{
	int i;
	unsigned char array[9];
	TMOD=0x1;
	array[0]=0x0;
	array[1] = 0xaa;
	array[2] = 0x01;
	array[3] = 0x04;
	array[4] = 0x10;
	array[5]=0x40;
	P1=array[0]; 
	//msec(2);

	while(1) {

		P1=array[1]; 
		msec(7);
		P1=array[2]; 
		msec(3);
		P1=array[3]; 
		msec(2); 
		P1=array[4]; 
		msec(1); 
		P1=array[5]; 
		msec(2);
		P1=array[0];
}
	//while(1);
}