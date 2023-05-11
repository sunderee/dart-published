import 'package:dart_ms/dart_ms.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('ms (string)', () {
    test(
      'should not throw an error',
      () => expect(ms('1m'), isA<double>()),
    );
  });
}
