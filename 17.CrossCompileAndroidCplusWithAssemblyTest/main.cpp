#include <iostream>

extern "C" int AssemblyAdd(int a, int b);
int main() {
    int a = 10, b = 20;
    int c = AssemblyAdd(10, 20);
    std::cout << "Result: " << c << std::endl;
    std::cout << "Program finished." << std::endl;
    return 0;
}