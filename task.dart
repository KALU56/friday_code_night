abstract class animal{
  void make_sound();
  void walk();
}

class dog implements animal{
  @override
  void make_sound(){
    print("wu wu wu");
    
  }
  void walk(){
    print("dog walk");
    print("-------");
  }
}
class cat implements animal{
  @override
  void make_sound(){
    print("meow meow meow");
    
  }
  void walk(){
    print("cat walk");
    print("-------");
  }
}
class bird  implements animal{
  @override
  void make_sound(){
    print("siwu siwu siwu");
    
  }
  void walk(){
    print("flying");
    print("-------");
  }
}
void animals(animal animal){
  animal.make_sound();
  animal.walk();
}

void main(){
  animal dogs = dog();
  animal cats = cat();
  animal birds= bird();

  animals(dogs);
  animals(cats);
  animals(birds);
  print("-------");
}