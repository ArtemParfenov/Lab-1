#include <iostream>
using namespace std;

extern "C" float SumR(int k, float x);

int main(int argc, char** argv)
{
	int n;
	float x;
	cout << "Input x ,n" << endl;
	cin >> x >> n;
	double R = 0.0;
	R = SumR(n, x);
	cout << "Result " << R << endl;
	return 0;
}