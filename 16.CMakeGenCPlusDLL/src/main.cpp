#include<Lib1/DLL_Test1.h>
#include<iostream>
using namespace std;


int main() {
	cout << exportDate() << endl;          //调用函数输出666   

	dog dog;     //实例化dog对象、赋值、并输出。
	dog.getHigh(5);
	dog.getWide(6);
	cout << dog.outDate() << endl;

	cat cat;    //实例化cat对象、赋值、并输出
	cat.getHigh(16);
	cat.getWide(4);
	cout << cat.outDate() << endl;

	system("pause");
	return 0;
}

 