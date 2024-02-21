//wehen we have an abstaract class
abstract class Employee {
  void work();
}

class Programmer extends Employee {
  @override
  void work() {
    // TODO: implement work
    print("coding an app");
  }
}

class HRManager extends Employee {
  @override
  void work() {
    print("recruting people");
    // TODO: implement work
  }
}

class Boss extends Employee {
  @override
  void work() {
    // TODO: implement work
    print("object");
  }
}
