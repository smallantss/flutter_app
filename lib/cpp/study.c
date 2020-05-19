#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void swap(int*,int*);

enum {
    MON,TUE,WED,THU,FRI,SAT,SUN
} day;

void changeData(int*);

int getData();

int max(int x,int y){
    return x>y ? x:y;
}

void notifyChange(){
    printf("changed\n");
}

void doSomething(void(* m)()){
    printf("doSomething\n");
    m();
}

// struct Person;

struct Person
{
   char name[10];
   int age;
//    struct Book book;
};

struct Book
{
    char name[10];
    int pages;
    // struct Person person;
};

union Student
{
    char name[20];
    int age;
    float score;
};

struct{
     int width;
     int height;
} status1;

struct{
     int width : 1;
     int height : 1;
} status2;

/*
* 打印数组
*/
void printArrary(int arr[],int length){
        int i = 0;
    for (; i < length ; i++){
        printf("%d\n",arr[i]);
    }
}


int main(){


    int arr[] = { 1, 2, 3 ,4};
    
    printf("%d\n",sizeof(arr)/sizeof(arr[0]));
    // printArrary(arr,4);


    // int a =10;
    // int b =20;
    // swap(&a,&b);
    // printf("a的值为%d\n",a);
    // printf("b的值为%d\n",b);

    // int arr[]={1,2,3,4,5};
    // printf("arr[8] value is %d\n",arr[8]);
   
    
    // day = WED;
    // printf("mon is %d\n",day);

    //定义数组
    // int arr[] = {1,2,3,4,5};
    // //定义指针变量ptr
    // int *ptr;
    // //指针指向数组的地址
    // ptr = arr;
    // for (int i = 0; i < 5; i++)
    // {
    //    printf("valus is arr[%d] = %d\n",i,*ptr);
    //    //移动指针到下一个位置
    //    ptr++;
    // }

    //定义一个指针数组：数组里面元素都是指针（地址）
    // int *ptr[3] ;
    // //定义一个数组
    // int arr[]= {1,2,3};
    // for (int i = 0; i < 3; i++)
    // {
    //     //遍历数组，将元素地址加入指针数组
    //     ptr[i] = &arr[i];
    // }
    // for (int i = 0; i < 3; i++)
    // {
    //     printf("addr ptr[%d] = %p\n",i,ptr[i]);
    //     printf("value ptr[%d] = %d\n",i,*ptr[i]);
    // }

    
    // int var = 100;
    // //获取var的指针地址
    // int *ptr = &var;
    // //获取var的指针的指针
    // int **pptr = &ptr;
    // //获取二级指针的一级指针
    // int *res = *pptr;
    // //获取一级指针的实际的值
    // int rr = *res;
    // printf("var is %d\n",rr);

    // int a = 1;
    // changeData(&a);
    // printf("a is %d\n",a);

    // int x = getData();
    // printf("result is %d\n",x);
    
    // int (*p)(int,int) = &max;
    // int res = p(1,2);
    // res = p(p(1,2),3);
    // printf("res is %d\n",res);


    // doSomething(notifyChange);

    // char x = '\0';
    // printf("res is %c",x);

    // char str1[] = "hello";
    // char str2[] = "world";
    // char str3[1];
    // //拼接str2到str1上
    // strcat(str1,str2);
    // printf("strcat result is %s\n",str1);
    // //copy str2到str3
    // char *s = strcpy(str3,str2);
    // printf("strcpy result is %s\n",s);
    // //获取str1的长度
    // int len = strlen(str1);
    // printf("strlen result is %d\n",len);

    // struct Person person;
    // struct Book book;
    // strcpy(book.name,"English");
    // book.pages = 100;
    // // book.person = person;
    // strcpy(person.name,"XWY");
    // person.age = 10;
    // // person.book = book;
    // printf("book name is %s\n",book.name);

    // char* tips = "hello world";
    // printf("tips is %s\n",tips);


    // printf("enter student count\n");
    // int count;
    // scanf("%d",&count);
    // //根据学生人数申请堆内存
    // int* array = malloc(sizeof(int)*count);
    // int i ;
    // for ( i = 0; i < count; i++)
    // {

    //     printf("enter number %d code \n",i+1);
    //     //保存对应的学号
    //     scanf("%d",array+i);
    // }

    // for (i = 0; i < count; i++)
    // {
    //    printf("number %d code is %d \n",i+1,*(array+i));
    // }

    // int increament;
    // printf("enter insert count\n");
    // //保存插班人数
    // scanf("%d",&increament);
    // //重新申请内存
    // realloc(array,sizeof(int)*(count+increament));
    
    // for ( i = 0; i < increament; i++)
    // {
    //     printf("enter insert num %d code\n",i+1);
    //     //保存插班生的号码
    //     scanf("%d",array+count+i);
    // }

    // for ( i = 0; i < increament; i++)
    // {
    //     printf("insert num %d code is %d\n",i+1,*(array+count+i));
    // }
    

    // union Student stu;
    // stu.age = 18;
    // strcpy(stu.name,"Tom");
    // stu.score = 98.0;
    
    // printf("stu.age is %d\n",stu.age);
    // printf("sizeof stu is %d\n",sizeof(stu));
    // printf("stu.score is %.1f\n",stu.score);
    // printf("stu.name is %s\n",stu.name);

    // printf("memory of status1 is %d\n",sizeof(status1));
    // printf("memory of status2 is %d\n",sizeof(status2));

    

}




int getData(){
    int a = 10;
    return a;
}

//通过指针修改数据
void changeData(int *x){
    *x = 100;
}

void swap(int *x,int *y){
    int temp = *x;
    *x = *y;
    *y = temp;
}


