import 'dart:math';

abstract class Area {
  getArea();
}

abstract class Perimeter {
  getPerimeter();
}

class Circle implements Area, Perimeter {
  final double r;
  Circle(this.r);

  @override
  getArea() {
    print(pi * r * r);
  }

  @override
  getPerimeter() {
    print(2 * pi * r);
  }
}
