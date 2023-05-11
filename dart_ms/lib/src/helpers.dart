import 'package:meta/meta.dart';

@internal
@immutable
final class Helpers {
  static double get seconds => 1000.0;
  static double get minutes => seconds * 60;
  static double get hours => minutes * 60;
  static double get days => hours * 24;
  static double get weeks => days * 7;
  static double get years => days * 365.25;

  const Helpers._();
}
