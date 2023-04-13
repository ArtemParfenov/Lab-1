#include <math.h>
#include <stdio.h>

int factorial(int k);

int factorial(int k) {
	return (k < 2) ? 1 : k * factorial(k - 1);
}

extern float fun_el(int k, float x)
{
	float f;
	f = powf(x, -k) / (factorial(k) * cosf(x));
	printf("x=%f\n", x);
	printf("k=%d\n", k);
	printf("f=%f\n", f);
	return f;
}