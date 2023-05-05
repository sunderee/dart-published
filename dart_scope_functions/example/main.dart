import 'package:dart_scope_functions/dart_scope_functions.dart';

void main() {
  // Usage of `also`
  final listAlso = ['one', 'two', 'three'].also((it) {
    print('list before adding new element: $it');
    it.add('four');
  });
  print(listAlso); // [one, two, three, four]

  // Usage of `let`
  final listLet = [null, 1, 2, null, 3, null];
  print(listLet.elementAt(0)?.let((it) => it.toDouble())); // null
  print(listLet.elementAt(2)?.let((it) => it.toDouble())); // 2.0

  // Usage of `run`
  final hexNumberRegex = run(() {
    final digits = '0-9';
    final hexDigits = 'a-fA-F';
    final sign = '+-';

    return RegExp('[$sign]?[$digits$hexDigits]+');
  });
  print(hexNumberRegex.stringMatch('+123 -FFFF !%*& 88 XYZ')); // +123

  // Usage of `takeIf` and `takeUnless`
  const number = 94;
  final evenOrNull = number.takeIf((it) => it % 2 == 0);
  final oddOrNull = number.takeUnless((it) => it % 2 == 0);
  print("even: $evenOrNull, odd: $oddOrNull"); // even: 94, odd: null
}
