#include <8051.h>
void main()
{
unsigned char i,j; 
unsigned char massiv [11]=
{ 
0xF9,
0xA4,
0xB0,
0x99,
0x92,
0x82,
0xF8,
0x80,
0x90,
0xFF 
};

unsigned char massiv2[11] = {
0x90,
0xF9,
0xA4,
0xB0,
0x80,
0x99,
0x92,
0x82,
0xF8,
0xFF
};

//P2=massiv [10];
P1 = 0x00;
 
for(i=0;i<10;i++) 
{

if (P10 > 0) {
	P2 = massiv2[i];
} else {
	P2=massiv[i]; 	
}

//P2=massiv[i];
for(j=0;j<100;j++)

continue;
}
P2=massiv[10]; 
while(1);
}