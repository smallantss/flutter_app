//生物
abstract class Biology {
  Biology() {
    initInstance();
    print('Biology()');
  }

  void initInstance() {
    print('Biology initInstance()');
  }
}

//吃饭 只能被生物或子类 mixin
mixin Eat on Biology {
  @override
  void initInstance() {
    super.initInstance();
    print('Eat initInstance()');
  }
}

mixin Speak on Biology {
  @override
  void initInstance() {
    super.initInstance();
    print('Speak initInstance()');
  }
}

//人
class Person extends Biology with Eat, Speak {
  Person() {
    print('Person()');
  }

  static void ensureInit() {
    Person();
  }
}

void main() {
  // Person.ensureInit();
  WidgetBinding().attachToRoot();
}

class Animal {

  void eat(String food){
    print(food);
  }
}

class WidgetBinding{

  RenderObjectToWidgetElement get renderViewElement => _renderViewElement;
  RenderObjectToWidgetElement _renderViewElement;

  void attachToRoot(){
    _renderViewElement = RenderObjectToWidgetAdapter().attachToRenderTree(null as RenderObjectToWidgetElement);
  }
}

class RenderObjectToWidgetElement{

}

class RenderObjectToWidgetAdapter{

  RenderObjectToWidgetElement attachToRenderTree(RenderObjectToWidgetElement a){
    print('attach');
    return a;
  }
}

class Cat extends Animal {
  final String name;
  final int age;

  Cat(this.name) : age = 10;
}
