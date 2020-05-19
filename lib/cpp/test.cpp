#include <iostream>
using namespace std;
#define Day 7
#include <string>
#include <fstream>
#include "test.h"
#include "MyArray.hpp"

class Phone{
public:
    Phone(string name):name(name){
        cout << "Phone constructor executed" << endl;
    }
    string name;
};
class Person{
public:
    Person(string name,string p):name(name),phone(p){
        cout << "Person constructor executed" << endl;
    }
    string name;
    Phone phone;
};

class Empty{
public:
    char age;
    int name;
   
};

class Stranger;
class Man;
class Man{


public:
    int age;
private:
    int money;
};

class Stranger{
public:
    Stranger();
    string name;
    void visit(Man a){
        cout << "age is " << a.age << endl;
        // cout << "money is " << a.money << endl;
    }
};
Stranger::Stranger(){
    
}

// void visitPrivate(Man * man){
//     man->age;
//     man->money;
// }

// void test(){
//     Stranger s;
//     s.visit();
// }

class MyPrint{

public:
    //重载调用函数运算符
    void operator()(string text){
        cout << text << endl;
    }
    int operator()(int x, int y){
        return x+y;
    }
};

//继承
class Base{
public:
    Base(){
        m_a = 100;
        cout << "Base constructor" << endl;
    }
    ~Base(){
        cout << "Base delete" << endl;
    }
    void header(){
        cout << "header" << endl;
    }
    void footer(){
        cout << "footer" << endl;
    }
    void test(int a){
        
    }
    int m_a;
};
class Base2{};
class Child:public Base,public Base2{
public:
    Child(){
        m_a = 200;
        cout << "Child constructor" << endl;
    }
    ~Child(){
        cout << "Child delete" << endl;
    }
    void content(){
        cout << "content" << endl;
    }
    void test(){
        
    }
    int m_a;
};

class Animal{
    public:
    //虚函数
    virtual void speak(){
        cout << "Animal is speaking" << endl;
    }
};
class Cat:public Animal{
public:
    void speak(){
         cout << "Cat is speaking" << endl;
    }
};
//地址早绑定，在编译阶段就确定函数地址，因此都会走Animal.speak()
//如果想调用子类的方法，需要在运行阶段确定函数地址。
void testSpeak(Animal &animal){
    animal.speak();
}

class AbstractCalculator{
    public:
    //虚函数
    virtual int getResult(){
        return 0;
    }
    int m_num1;
    int m_num2;
};

class AddCalculator:public AbstractCalculator{
    public:
    int getResult(){
        return m_num1 + m_num2;
    }
};

void cal(){
    //多态使用条件：父类指针或者引用指向子类对象
    AbstractCalculator * cal = new AddCalculator;
    cal->m_num1 = 10;
    cal->m_num2 = 20;
    cout << cal->getResult() << endl;
}

void writeFile(){
    //1.头文件
    //2.定义文件
    ofstream ofs;
    //3.打开文件及方式
    ofs.open("test.txt",ios::out|ios::trunc);
    //4.写东西
    ofs << "随便瞎几把写点东西" << endl;
    ofs << "随便瞎几把写点" << endl;
    ofs << "随便瞎几把" << endl;
    //5.关闭文件
    ofs.close();
}

void readFile(){
    //1.头文件
    //2.创建流对象
    ifstream ifs;
    //3.打开文件并判断打开文件是否成功
    ifs.open("test.txt",ios::in);
    if (!ifs.is_open())
    {
        cout << "打开文件失败" << endl;
        return;
    }
    //4.读文件数据
    //4.1 定义缓冲区，一行一行的读，完了自动退出循环
    // char buf[1024] = { 0 };
    // while (ifs >> buf)
    // {
    //     cout << buf << endl;
    // }

    //4.2 一行一行的读，完了自动退出循环
    // char buf[1024] = { 0 };
    // while (ifs.getline(buf,sizeof(buf)))
    // {
    //     cout << buf << endl;
    // }
    
    //4.3
    string buf;
    while (getline(ifs,buf))
    {
       cout << buf << endl;
    }

    //4.4 不推荐 一个字符一个字符读，直到文件尾 EOF end of file
    char c;
    while ((c = ifs.get())!=EOF)
    {
        cout << c ;
    }
    
    //5.关闭文件
    ifs.close();
}

void writeBFile(){
    //
}

//声明一个模板，告诉编译器后面T不要报错，T是通用数据类型
template<class T>
void aaswap(T &a,T &b){
    T temp;
    temp = a;
    a = b;
    b = temp;
}

template<class T>
void func(){
    cout << "" << endl;
}

template<class T>
void sort(T arr[],int len){
    //选择排序:第一个值和后面每个值比较,如果有更大的，则交换，一轮完成后，获取最大值的下标和初始值的下标，不同则交换
    for (int i = 0; i < len; i++)
    {
        //最大值的下标
        int max = i;
        for (int j = i+1; j < len; j++)
        {
            //说明j下标才是最大的值，保存j的下标
            if (arr[max]<arr[j])
            {
                max = j;
            }
            
        }
        if (max != i)
        {
            aaswap(arr[max],arr[i]);
        }
    }
}

template<class T>
void printArr(T arr[],int len){
    for (int i = 0; i < len; i++)
    {
        cout << arr[i] << endl;
    }
    
}

int myAdd(int a,int b){
    return a+b;
}


template<class T1,class T2>
class Women{
    friend void printWomen(Women &w){
        cout << w.m_name <<","<< w.m_age << endl;
    }
public:
    Women(T1 name,T2 age){
            this->m_name = name;
            this->m_age = age;
    }
private:
    T1 m_name;
    T2 m_age;
};

void printMyArr( MyArray<int> arr){
    for (int i = 0; i < arr.getSize(); i++)
    {
        cout << arr[i] << "," << endl;
    }
        
}

void printArr(int arr[]){
    int len = sizeof(arr)/sizeof(int);
    cout << len << "," << endl;

    for (int i = 0; i < len; i++)
    {
        cout << arr[i] << "," << endl;
    }
    

}

int main()
{

    int arr[] = {1,2,3,4,5,6};
    printArr(arr,6);

    // MyArray<int> arr1(5);
    // arr1.Push_Back(3);
    // arr1.Push_Back(2);
    // arr1.Push_Back(1);
    // arr1.Pop_Back();
    // arr1.Pop_Back();
    // printMyArr(arr1);


    // MyArray<int> arr2(arr1);
    // MyArray<int> arr3(100);
    // arr3= arr2;


    // Women<string,int> w("XWY",24);
    // printWomen(w);


    // int a = 10;
    // char c = 'c';
    // myAdd(a,c);


    // int arr[] = {5,2,7,1,3};
    // sort(arr,5); 
    // printArr(arr,5);


    // func();
    // func<int>();


    // writeFile();
    // readFile();

    // cal();


    // Cat cat;
    // testSpeak(cat);



    // Child child;
    // child.test(10);
    // child.Base::test(10);

    // MyPrint p;
    // p("XWY");
    // int res = p(1,2);
    // cout << res << endl;




    // cout << "Hello world!" << endl;
    // cout << "sizeof int " << sizeof(long double) << endl;
    // int a =10;
    // int b =3;
    // cout << a/b << endl;

    // (a>b ? a:b) = 30;
    // cout << a << endl;

    // goto FLAG;
    // cout << "1...." << endl;
    // cout << "2...." << endl;
    // cout << "3...." << endl;
    // FLAG:
    // cout << "4...." << endl;
    // cout << "5...." << endl;

    // int arr[10];
    // int brr[] = {1,2,3};
    // int crr[3] = {1,2,3};

    // cout << &brr[0] << endl;
    // cout << (int)&brr[0] << endl;

    // int arr[] = {4, 2, 6, 1, 5, 3};
    // int len = sizeof(arr) / sizeof(arr[0]);
    // for (int i = 0; i < len - 1; i++)
    // {
    //     for (int j = 0; j < len - 1 -i; j++)
    //     {
    //         if (arr[j] > arr[j + 1])
    //         {
    //             int temp = arr[j];
    //             arr[j] = arr[j + 1];
    //             arr[j + 1] = temp;

    //             for (int i = 0; i < len; i++)
    //             {
    //                 cout << arr[i] << ",";
    //             }
    //             cout << endl;
    //         }
    //     }
    // }
    // for (int i = 0; i < len; i++)
    // {
    //     cout << arr[i] << ",";
    // }
    // cout << endl;

    //定义1：
    //2行3列二维数组
    // int arr[2][3] = {
    //     {1,2,3},
    //     {4,5,6}
    // };
    // //定义2：
    // int brr[2][3] = {};
    // //第0行 第1，2，3列数据
    // brr[0][0] = 1;
    // brr[0][1] = 2;
    // brr[0][2] = 3;
    // //第1行 第1，2，3列数据
    // brr[1][0] = 4;
    // brr[1][1] = 5;
    // brr[1][2] = 6;
    // //定义3：
    // //程序可以识别出来
    // int crr[2][3] = {1,2,3,4,5,6};
    // //定义4：
    // //至少写一个列数，不能只写行数不写列数
    // int drr[][3] = {1,2,3,4,5,6};

    // int row = 2;
    // int column = 3;
    // for (int i = 0; i < row; i++)
    // {
    //     for (int j = 0; j < column; j++)
    //     {
    //         cout << brr[i][j] << endl;
    //     }

    // }

    // cout << max(1,2) << endl;

    // int* p = NULL;

    // int a = 10;
    // int b = 10;
    // //指针的指向可以修改，但指针指向的值不可修改
    // const int *p = &a;
    // *p = 20;
    // p = &b;

    // int a = 10;
    // int b =20;
    // //指针常量
    // int *const p = &a;
    // //指针指向不可以改，指针指向的值可以修改
    // *p = 20;
    // p = &b;

    //指针指向和指向的值都不可以修改
    // int a =10;
    // int b = 10;
    // const int * const p = &a;
    // p = &b;
    // *p = b;

    // Phone p("IPHONE");
    // Person person("XWY","IPHONE");
    // cout << person.name << endl;
    // cout << person.phone.name << endl;

    // Empty e;
    // cout << sizeof(e) << endl;

    return 0;
}

//函数的定义
int max(int a, int b)
{
    return a > b ? a : b;
}