import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//状态类（被观察者），存储了数据及更改数据的方法以及获取数据
class CounterModel with ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;
  int _test = 1;

  int get value2 => _test;

  void increment() {
    _counter++;
    //调用这个方法的时候，会通知所有观察者进行刷新。
    notifyListeners();
  }
}

class Person with ChangeNotifier {}

class Women with ChangeNotifier {}

class Teacher with ChangeNotifier {}

void main() {
  //1.声明Model类，即被观察者对象（）
  final counter = CounterModel();
  //2.将Provider包裹Widget,则该Widget可以获取到观察者的数据
  runApp(Provider<CounterModel>.value(
    value: counter,
    child: ProviderWidget(),
  ));
  //3.如果需要多个的话，可能会Provider嵌套，如:
  Provider<Person>.value(
    value: Person(),
    child: Provider<Women>.value(
      value: Women(),
      child: Provider<Teacher>.value(
        value: Teacher(),
        child: ProviderWidget(),
      ),
    ),
  );
  //4.此时可以使用MultiProvider提高可读性
  MultiProvider(
    providers: [
      Provider<Person>.value(value: Person()),
      Provider<Women>.value(value: Women()),
      Provider<Teacher>.value(value: Teacher()),
    ],
    child: ProviderWidget(),
  );
}

class ProviderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          RaisedButton(onPressed: (){
            Provider.of<CounterModel>(context).increment();
          },child: Text('点我'),),
          Text(Provider.of<CounterModel>(context).counter.toString()),
        ],
      ),
    );
  }
}
