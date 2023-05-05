import 'package:ktuples/ktuples.dart';

void main() {
  // Example for `Pair`, other tuples work the same
  const pair = Pair('meaning of life', 42);
  print(pair); // Pair<String, int>: meaning of life, 42

  print(pair == const Pair('meaning of life', 42)); // true
  print(pair == const Pair('meaning of life', 43)); // false
}
