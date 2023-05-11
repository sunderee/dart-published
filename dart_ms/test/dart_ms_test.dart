import 'package:dart_ms/dart_ms.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('ms function correctly parses milliseconds', () {
    expect(ms('100 ms'), equals(100));
  });

  test('ms function correctly parses seconds', () {
    expect(ms('1 s'), equals(1000));
    expect(ms('1sec'), equals(1000));
    expect(ms('1seconds'), equals(1000));
  });

  test('ms function correctly parses minutes', () {
    expect(ms('1 m'), equals(60000));
    expect(ms('1min'), equals(60000));
    expect(ms('1minutes'), equals(60000));
  });

  test('ms function correctly parses hours', () {
    expect(ms('1 h'), equals(3600000));
    expect(ms('1hr'), equals(3600000));
    expect(ms('1hour'), equals(3600000));
  });

  test('ms function correctly parses days', () {
    expect(ms('1 d'), equals(86400000));
    expect(ms('1day'), equals(86400000));
  });

  test('ms function correctly parses weeks', () {
    expect(ms('1 w'), equals(604800000));
    expect(ms('1week'), equals(604800000));
  });

  test('ms function correctly parses years', () {
    expect(ms('1 y'), equals(31557600000));
    expect(ms('1yr'), equals(31557600000));
    expect(ms('1year'), equals(31557600000));
  });

  test('ms function returns null for invalid inputs', () {
    expect(ms('invalid input'), equals(null));
  });

  test('ms function correctly parses negative values', () {
    expect(ms('-100 ms'), equals(-100));
    expect(ms('-1 s'), equals(-1000));
    expect(ms('-1 h'), equals(-3600000));
  });

  test('ms function correctly parses decimal values', () {
    expect(ms('1.5 h'), equals(5400000));
    expect(ms('.5 h'), equals(1800000));
  });
}
