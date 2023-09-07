/// Millisecond conversion utility library inspired by
/// [`ms`](https://www.npmjs.com/package/ms).
library dart_ms;

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
            'years' || 'year' || 'yrs' || 'yr' || 'y' => it.$1 * _years,
            'weeks' || 'week' || 'w' => it.$1 * _weeks,
            'days' || 'day' || 'd' => it.$1 * _days,
            'hours' || 'hour' || 'hrs' || 'hr' || 'h' => it.$1 * _hours,
            'minutes' || 'minute' || 'mins' || 'min' || 'm' => it.$1 * _minutes,
            'seconds' || 'second' || 'secs' || 'sec' || 's' => it.$1 * _seconds,
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

const double _seconds = 1000.0;
const double _minutes = _seconds * 60;
const double _hours = _minutes * 60;
const double _days = _hours * 24;
const double _weeks = _days * 7;
const double _years = _days * 365.25;

extension _ScopeFunctionExt<T> on T {
  R let<R>(R Function(T it) block) {
    return block.call(this);
  }

  T? takeIf(bool Function(T it) predicament) {
    return predicament.call(this) ? this : null;
  }
}
