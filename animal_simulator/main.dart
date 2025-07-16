import 'animal.dart';
import 'dog.dart';
import 'cat.dart';
import 'bird.dart';

void animalActivity(Animal animal) {
  animal.makeSound();
  animal.walk();
}

void main() {
  Animal dog1 = Dog();
  Animal cat1 = Cat();
  Animal bird1 = Bird();

  animalActivity(dog1);
  animalActivity(cat1);
  animalActivity(bird1);
}
