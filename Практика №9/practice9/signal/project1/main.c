#include <8051.h>
/*0, 63.75, 59.25, 54.75, 50.25, 45.75, 41.25, 36.75, 32.25, 27.75, 23.25, 18.75, 14.25, 0*/
void main()
{
	unsigned int sin_value[42] = {
	128, 128, 128, 128, 128, 192, 192, 192, 192, 
	184, 176, 168, 160, 255, 247, 239, 231, 223,
 	215, 207, 199, 191, 183, 175, 168, 160,
	160, 160, 160, 160, 128, 128, 128, 128, 
	128, 128, 128, 128, 128, 128, 128, 128
	/*255, 246, 237, 228, 219, 210, 201, 192, 183, 174, 165,  156, 147, 138,
	63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 63*/
};

	int i;

	while(1){
		for(i = 0; i<42; i++){
			P2 = sin_value[i];
		}
	}
}