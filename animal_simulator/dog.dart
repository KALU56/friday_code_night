import 'animal.dart';

class Dog implements Animal {
  @override
  void makeSound() {
    print("wu wu wu");
  }

  @override
  void walk() {
    print("dog walk");
    print("-------");
  }
}
