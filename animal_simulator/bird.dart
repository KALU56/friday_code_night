import 'animal.dart';

class Bird implements Animal {
  @override
  void makeSound() {
    print("siwu siwu siwu");
  }

  @override
  void walk() {
    print("flying");
    print("-------");
  }
}
