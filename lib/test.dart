import 'dart:math';

class Bicycle {
  int cadence;
  int _speed = 0;
  int gear;

  int get speed => _speed;

  Bicycle(this.cadence, this.gear);

  void applyBrake(int increment) {
    _speed -= increment;
  }

  void speedUp(int increment) {
    _speed += increment;
  }

  @override
  String toString() => 'Bicycle: $_speed mph';
}

class Rectangle {
  int width;
  int height;
  Point origin;

//  默认值必须是在编译期就可以确定的常量,因此要加上const
  Rectangle(
      {this.origin = const Point(0, 1), this.width = 10, this.height = 20});

  @override
  String toString() {
    return 'Origin:{x:${origin.x},y:${origin.y},width:$width,height:$height}';
  }
}

abstract class Shape {
  factory Shape(String type) {
    if (type == 'circle') return Circle(2);
    if (type == 'square') return Square(2);
    throw 'Can\'t create $type';
  }

  num get area;
}

class Circle implements Shape {
  final num radius;
  int _p;
  num a;

  Circle(this.radius);

  @override
  num get area => pi * pow(radius, 2);
}

//每个类都隐式的定义了一个接口
class CircleMock implements Circle {
  @override
  num get area => null;

  @override
  num get radius => null;

  @override
  int _p;

  @override
  num a;
}

class Square implements Shape {
  final num side;

  Square(this.side);

  @override
  num get area => pow(side, 2);
}

////工厂方法
//Shape shapeFactory(String type) {
//  if(type == 'circle'){
//    return Circle(2);
//  }
//  if(type=='square'){
//    return Square(2);
//  }
//  throw 'Can\'t create $type';
//}

class TestFunction {
  int call(int a, int b) {
    return a + b;
  }
}

String scream(int length) => "A${'a' * length}h!";

void aaa() {
//  var bike = Bicycle(2, 0);
//  bike._speed =10;
//  print(bike._speed);

//  var rec = Rectangle(origin: Point(11, 12));
//  print(rec);

//  final circle = Circle(2);
//  final square = Square(2);
//  print(circle.area);
//  print(square.area);

//  print(shapeFactory('circle').area);
//  print(shapeFactory('square').area);
//  print(shapeFactory('111').area);

//  print(Shape('circle').area);
//  print(Shape('square').area);

//  var tc = TestFunction();
//  print(tc(1,2));

  var values = [1, 2, 3, 5, 10];
  for (var value in values) {
    print(scream(value));
  }

//  链式调用？
  values.map(scream).forEach(print);
}

//Person类，隐式的定义了一个包含所有实例成员的接口
class Person {
  final _name;

  Person(this._name);

  //所以是一个接口？
  String greet(String who) {
    return 'Hi,$who,I am $_name';
  }
}

class Police implements Person {
  @override
  // TODO: implement _name
  get _name => null;

  @override
  String greet(String who) {
    // TODO: implement greet
    return null;
  }
}

class Teacher implements Person {
  final _name = "Teacher";

  @override
  String greet(String who) {
    return 'Hi,$who,I am $_name,Poster';
  }
}

class Musical {
  bool canPlayPiano = false;
  bool canCompose = false;
  bool canConduct = false;

  void entertainMe() {
    if (canPlayPiano) {
      print('piano');
    } else if (canCompose) {
      print('compose');
    } else {
      print('conduct');
    }
  }
}

class FireMan extends Person with Musical {
  var names = [1, 'a', "我", true];
  var map = {
    1: 'a',
    true: 'w',
  };
  FireMan(name) : super(name);

  void doSomething() {
    entertainMe();
    if (canPlayPiano) {
      print('FireMan');
    }
  }

  checkVersion() {
    Future<String> res = lookUpVersion();
  }

  lookUpVersion() async {}
}

void main() async {
  method2();
}

methodA(){
  print('A');
}

methodB() async {
  print('B start');
  await methodC('B');
  print('B end');
}

methodC(String from) async {
  print('C start from $from');

  Future((){                // <== 该代码将在未来的某个时间段执行
    print('C running Future from $from');
  }).then((_){
    print('C end of Future from $from');
  });

  print('C end from $from');
}

methodD(){
  print('D');
}

void method1() async{
  List<String> myArray = <String>['a','b','c'];
  print('before loop');
  myArray.forEach((String value) async {
    await delayedPrint(value);
  });
  print('end of loop');
}

methodTest() async {
  await delayedPrint('1');
}

void method2() async {
  List<String> myArray = <String>['a','b','c'];
  print('before loop');
  for(int i=0; i<myArray.length; i++) {
    await delayedPrint(myArray[i]);
  }
  print('end of loop');
}

Future<void> delayedPrint(String value) async {
  await Future.delayed(Duration(seconds: 1));
  print('delayedPrint: $value');
}
