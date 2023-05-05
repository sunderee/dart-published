import 'package:nbr/nbr.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

class Nothing {
  const Nothing._();
}

void main() {
  group('Resource', () {
    test('should create empty resource', () {
      final res = Resource<Nothing>.empty();

      expect(res.baseData, null);
      expect(res.baseException, null);
    });

    test('should create loading resource (without data)', () {
      final res = Resource<int>.loading(null);

      expect(res.baseData, null);
      expect(res.baseException, null);
    });

    test('should create loading resource (with data)', () {
      final res = Resource<int>.loading(42);

      expect(res.baseData, 42);
      expect(res.baseException, null);
    });

    test('should create successful resource', () {
      final res = Resource.success('meaning of life');

      expect(res.baseData != null, true);
      expect(res.baseData is String, true);
      expect(res.baseException, null);
    });

    test('should create failed resource', () {
      final res = Resource<dynamic>.failed(Exception(false));

      expect(res.baseData, null);
      expect(res.baseException != null, true);
      expect(res.baseException.toString(), 'Exception: false');
    });
  });
}
