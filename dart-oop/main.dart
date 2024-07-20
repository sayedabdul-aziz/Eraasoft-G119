import 'dart:io';

import 'shape.dart';

void main() {
  double r = double.tryParse(stdin.readLineSync() ?? '0') ?? 0;
  Circle c1 = Circle(r);
  c1.getArea();
  c1.getPerimeter();
}
