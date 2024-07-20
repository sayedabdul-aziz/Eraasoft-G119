enum Gender { Male, Female }

class Person {
  // attr.
  String? name;
  int? age;
  Gender? gender;
  Person(this.name, this.age, this.gender);
  void display() {
    print('Parent Class');
  }
}

class Student extends Person {
  double? grade;
  Student(this.grade, super.name, super.age, super.gender);

  @override
  void display() {
    super.display();
    print('$name : $age : $grade');
  }
}

// class Doctor extends Person {
//   double? salary;

//   displayDoctor() {
//     print(salary);
//   }
// }
