#include<Lib1/DLL_Test1.h>
#include<iostream>
using namespace std;


int main() {
	cout << exportDate() << endl;          //���ú������666   

	dog dog;     //ʵ����dog���󡢸�ֵ���������
	dog.getHigh(5);
	dog.getWide(6);
	cout << dog.outDate() << endl;

	cat cat;    //ʵ����cat���󡢸�ֵ�������
	cat.getHigh(16);
	cat.getWide(4);
	cout << cat.outDate() << endl;

	system("pause");
	return 0;
}

 