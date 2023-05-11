import 'package:dart_ms/src/helpers.dart';
import 'package:dart_scope_functions/dart_scope_functions.dart';

/// Parse the given [input] string and return milliseconds. It may throw an
/// error ([ArgumentError]) in case something goes wrong or `null`, in case the
/// input is invalid.
double? ms(String input) {
  return RegExp(
    r'^(-?(?:\d+)?\.?\d+) *?(milliseconds?|msecs?|ms|seconds?|secs?|s|minutes?|mins?|m|hours?|hrs?|h|days?|d|weeks?|w|years?|yrs?|y)?$',
    caseSensitive: false,
  )
      .firstMatch(input)
      ?.let((it) => (
            it.group(1)?.toString().let((value) => double.tryParse(value)),
            it.group(2)?.toString()
          ))
      .takeIf((it) => it.$1 != null && it.$2 != null)
      ?.let((it) => (it.$1 as double, it.$2 as String))
      .let((it) => switch (it.$2) {
            'years' || 'year' || 'yrs' || 'yr' || 'y' => it.$1 * Helpers.years,
            'weeks' || 'week' || 'w' => it.$1 * Helpers.weeks,
            'days' || 'day' || 'd' => it.$1 * Helpers.days,
            'hours' || 'hour' || 'hrs' || 'hr' || 'h' => it.$1 * Helpers.hours,
            'minutes' ||
            'minute' ||
            'mins' ||
            'min' ||
            'm' =>
              it.$1 * Helpers.minutes,
            'seconds' ||
            'second' ||
            'secs' ||
            'sec' ||
            's' =>
              it.$1 * Helpers.seconds,
            'milliseconds' ||
            'millisecond' ||
            'msecs' ||
            'msec' ||
            'ms' =>
              it.$1,
            _ => throw ArgumentError(
                'Unit ${it.$2} was matched, but no matching case exists',
              )
          });
}
