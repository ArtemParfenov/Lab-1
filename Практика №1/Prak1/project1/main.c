#include <8051.h>
 
void main() 
{
	int i;
	char xdata *ptr; 
	char test, nabor;
	nabor = 0x55; 
	ptr = (char xdata *) 0x400; 
	std :: cout << P0;
	for(i=0; i<1024;i++) 
	{
		*ptr=nabor; 
		test=*ptr; 
		if(test!=nabor)
		{
			break; 
		}
		ptr++;
	}
}
