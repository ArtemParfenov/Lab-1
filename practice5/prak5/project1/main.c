#include <8051.h>

void main(){
	char symbol[3][3] = {
		{'1', '2', '3'},
		{'4', '5', '6'},
		{'7', '8', '9'}
	};

 	P0 = 0x38;
 	P2 = 0x1;
 	P2 = 0x0;
 	P0 = 0x80;
 	P2 = 0x1;
 	P2 = 0x0;

	while(1) {
		P30 = 0;
  		if(P10 == 0){ P0 = symbol[0][0]; P2 = 0x3; P2 = 0x2;P0 = 0x01;P2 = 0x0;}
  		if(P11 == 0){ P0 = symbol[0][1]; P2 = 0x3; P2 = 0x2;P0 = 0x01;P2 = 0x0;}
  		if(P12 == 0){ P0 = symbol[0][2]; P2 = 0x3; P2 = 0x2;P0 = 0x01;P2 = 0x0;}
  		P30 = 1;
		
  		P31 = 0;
  		if(P10 == 0){ P0 = symbol[1][0]; P2 = 0x3; P2 = 0x2;P0 = 0x01;P2 = 0x0;}
  		if(P11 == 0){ P0 = symbol[1][1]; P2 = 0x3; P2 = 0x2;P0 = 0x01;P2 = 0x0;}
  		if(P12 == 0){ P0 = symbol[1][2]; P2 = 0x3; P2 = 0x2;P0 = 0x01;P2 = 0x0;}
  		P31 = 1;
     		
 		P32 = 0;
  		if(P10 == 0){ P0 = symbol[2][0]; P2 = 0x3; P2 = 0x2;P0 = 0x01;P2 = 0x0;}
  		if(P11 == 0){ P0 = symbol[2][1]; P2 = 0x3; P2 = 0x2;P0 = 0x01;P2 = 0x0;}
  		if(P12 == 0){ P0 = symbol[2][2]; P2 = 0x3; P2 = 0x2;P0 = 0x01;P2 = 0x0;}
 		P32 = 1;
		
	}
}
	
	