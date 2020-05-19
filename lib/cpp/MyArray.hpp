#pragma once
#include <iostream>
using namespace std;

//自定义数组
template<class T>
class MyArray{
public:
    //构造函数
    MyArray(int capacity){
        cout << "constructor" << endl;
        m_capacity = capacity;
        m_size = 0;
        pAddress = new T[m_capacity];
    }

    MyArray(const MyArray& arr){
        cout << "copy constructor" << endl;
        m_capacity = arr.m_capacity;
        m_size = arr.m_size;
        pAddress = new T[arr.m_capacity];
        for (int i = 0; i < m_size; i++)
        {
            pAddress[i] = arr.pAddress[i];
        }
    }

    //拷贝构造函数 arr3 = arr2 = arr1;
    MyArray& operator=(const MyArray& arr){
        if (pAddress!=NULL)
        {
            delete [] pAddress;
            pAddress = NULL;
            m_capacity = 0;
            m_size = 0;
        }
        
        m_capacity = arr.m_capacity;
        m_size = arr.m_size;
        pAddress = new T[m_capacity];
        for (int i = 0; i < arr.m_size; i++)
        {
            pAddress[i] =arr.pAddress[i];
        }
        return *this;
    }

    //重载[]运算符
    T operator [](int index){
        return pAddress[index];
    }

    //添加
    void Push_Back(const T & val){
        if (m_size==m_capacity)
        {
            return;
        }
        pAddress[m_size] = val;
        m_size++;
    }

    int getSize(){
        return m_size;
    }

    int getCapacity(){
        return m_capacity;
    }

    void Pop_Back(){
        if (m_size==0)
        {
            return;
        }
        
        m_size--;
    }

    ~MyArray(){
        cout << "delete" << endl;
        if (pAddress!=NULL)
        {
            delete [] this->pAddress;
            pAddress = NULL;
            m_size = 0;
            m_capacity = 0;
        }
    }


private:
//容量 长度 指针地址
    int m_capacity;
    int m_size;
    T *pAddress;
};