#include <iostream>

// extern means this function is defined extern to this file
// "C" is a calling convention which means how the arguments are passed to and from the function
extern "C" int SomeFunction();
extern "C" void RegTest();
extern "C" int WhichRegForParam(int, int, int, int, int);
extern "C" unsigned long long AsmGCD(unsigned long long, unsigned long long);

unsigned long long GCD(unsigned long long a, unsigned long long b) {
	while (b != 0) {
		unsigned long long temp = b;
		b = a % b;
		a = temp;
	}
	return a;
}

/* 
Note: C++ is designed such as when a function returns, C++ looks into register rax as the return value 
*/

int main() {
	//std::cout << "Output: " << SomeFunction() << std::endl;
	//RegTest();
	//WhichRegForParam(5, 6, 7, 8, 9);
	std::cout << AsmGCD(1170, 210) << std::endl;
	return 0;
}