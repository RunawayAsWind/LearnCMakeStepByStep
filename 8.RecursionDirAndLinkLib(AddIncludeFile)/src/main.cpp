//#include "./test1/test1.h"  //原始形式
#include <test1.h> //注意对照第6个CMake example的include形式，通过CMakeLists中的target_include_directories，已经设置了尖括号的根目录

int main() {

  Test1();

  system("pause");

  return 0;

}

 