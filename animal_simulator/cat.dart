import 'animal.dart';

class Cat implements Animal {
  @override
  void makeSound() {
    print("meow meow meow");
  }

  @override
  void walk() {
    print("cat walk");
    print("-------");
  }
}
