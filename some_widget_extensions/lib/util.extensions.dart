import 'package:flutter/material.dart';

/// Convenience utility extensions on [BuildContext].
extension UtilExtensions on BuildContext {
  /// Obtain [ThemeData] from the current [BuildContext].
  ThemeData get theme => Theme.of(this);

  /// Obtain [MediaQueryData] from the current [BuildContext].
  MediaQueryData get media => MediaQuery.of(this);
}
