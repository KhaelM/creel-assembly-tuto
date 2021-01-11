#include <iostream>

int WhereVarStored(int one, int two, int three, int four, int five, int six) {
	std::cout << one << "," << two << "," << three << "," << four << "," << five << std::endl;
	return one;
}

int main() {
	std::cout << WhereVarStored(5, 6, 7, 8, 9, 10);
}