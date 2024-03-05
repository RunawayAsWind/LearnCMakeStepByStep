#include <iostream>

using namespace std;

extern "C" 
{
int foo(int x, int y);
}

int main() {
  int result = foo(100, 200);
  cout << result << endl;
}
