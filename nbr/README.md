# Network Bound Resource

Generic implementation of the network-bound-resource algorithm in Dart.

## Usage

The main component of `nbr` is the `NetworkBoundResource` abstract class, which
your service/repository should extend. It exposes two important members:

1. `fetch`: method to fetch the resource
2. `stream`: getter for the stream of resource objects

Together, they work something like this:

```dart
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
```
