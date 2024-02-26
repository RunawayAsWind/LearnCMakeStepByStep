#include<iostream>
using namespace std;
#include "LibName/LibDir1/LibHead1.h"
#include "LibName/LibDir2/LibHead2.h"
#include "LibName/LibDir3/LibHead3.h"
int main() {

  cout<<"HelloWorld"<<endl;
  LibHead1();
  LibHead2();
  LibHead3();
  system("pause");

  return 0;

}

 