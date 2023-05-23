import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:nbr/nbr.dart';
import 'package:test/test.dart';

void main() {
  final repository = SampleRepository();

  tearDown(() => repository.dispose());

  test('should work', () async {
    await repository.fetchPackageDependencies('nbr');

    expectLater(
      repository.stream,
      emitsAnyOf([
        const Resource<MapEntry<String, List<String>>>.loading(),
        const Resource<MapEntry<String, List<String>>>.success(
          MapEntry(
            'nbr',
            ['1.0.3', ' 1.0.2', '1.0.1', '1.0.0', '0.0.3', ' 0.0.2', '0.0.1'],
          ),
        ),
      ]),
    );
    repository.dispose();
  });
}

class SampleRepository
    extends NetworkBoundResource<MapEntry<String, List<String>>> {
  final Map<String, List<String>> _mockDB = {};
  final HttpClient _client = HttpClient();

  Future<void> fetchPackageDependencies(
    String package,
  ) async {
    await fetch<List<String>>(
      fetchFromAPI: () async => await _fetchDependencies(package),
      loadFromDB: () async {
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
        .transform(const Utf8Decoder(allowMalformed: true))
        .reduce((previous, element) => previous + element);
    return ((json.decode(body) as Map<String, dynamic>)['versions']
            as List<dynamic>)
        .cast<String>();
  }

  void _persistDependencies(String package, List<String> versions) {
    _mockDB[package] = versions;
  }
}
