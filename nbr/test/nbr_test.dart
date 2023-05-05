import 'dart:convert';
import 'dart:io';

import 'package:nbr/nbr.dart';
import 'package:test/test.dart';

void main() {
  final repository = _SampleRepository();

  group('NetworkBoundResource', () {
    test('should collect values', () async {
      final streamValues =
          await repository.fetchPackageDependencies('get_it').toList();
      for (var element in streamValues) {
        print('Type: ${element.runtimeType}');
        print('Data: ${element.baseData}, exception: ${element.baseException}');
        print('---\n');
      }

      expect(streamValues.length, 3);
      expect(streamValues.first is Loading, true);
      expect(streamValues.last is Success, true);
      expect(streamValues.last.baseData?.value.isNotEmpty, true);
    });
  });
}

class _SampleRepository extends NetworkBoundResource {
  final Map<String, List<String>> _mockDB = {};
  final HttpClient _client = HttpClient();

  Stream<Resource<MapEntry<String, List<String>>>> fetchPackageDependencies(
    String package,
  ) async* {
    yield* fetch<MapEntry<String, List<String>>, List<String>>(
      fetchFromAPI: () async => await _fetchDependencies(package),
      loadFromDB: () {
        final versions = _mockDB[package];
        return versions != null ? MapEntry(package, versions) : null;
      },
      storeToDB: (entry) => _persistDependencies(entry.key, entry.value),
      shouldFetch: (entry) => entry == null || !_mockDB.containsKey(package),
      mapDTOToEntity: (versions) => MapEntry(package, versions),
    );
  }

  Future<List<String>> _fetchDependencies(String package) async {
    final url = Uri.https('pub.dev', 'packages/$package.json');
    final request = await _client.getUrl(url);
    final response = await request.close();

    if (response.statusCode != 200) {
      throw Exception('API returned ${response.statusCode}');
    }

    final body = await response
        .transform(Utf8Decoder(allowMalformed: true))
        .reduce((previous, element) => previous + element);
    return ((json.decode(body) as Map<String, dynamic>)['versions']
            as List<dynamic>)
        .cast<String>();
  }

  void _persistDependencies(String package, List<String> versions) {
    _mockDB[package] = versions;
  }
}
