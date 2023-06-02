import 'dart:async';

import 'package:nbr/src/resource.dart';
import 'package:nbr/src/typedefs.dart';

/// Abstract class representing a resource that is bound to a network request.
/// It uses a [StreamController] to emit a stream of [Resource] objects,
/// representing the current state of the resource (`loading`, `success`,
/// `failed`, or `empty`).
abstract class NetworkBoundResource<Entity> {
  StreamController<Resource<Entity>>? _controller;
  Stream<Resource<Entity>>? _stream;

  /// Getter for the stream of Resource objects.
  Stream<Resource<Entity>> get stream {
    _ensureControllerCreated();
    return _stream!;
  }

  /// Method to fetch the resource from the network and emit [Resource] objects
  /// representing the current state of the resource.
  ///
  /// This method takes several callbacks as arguments, which are used to fetch
  /// the resource from the API, load it from the database, store it to the
  /// database, determine if it should be fetched from the API, and map it from
  /// a DTO to an entity.
  Future<void> fetch<DTO>({
    required FetchFromApiCallback<DTO> fetchFromAPI,
    required LoadFromDBCallback<Entity> loadFromDB,
    required StoreToDBCallback<Entity> storeToDB,
    required ShouldFetchCallback<Entity> shouldFetch,
    required MapDTOToEntity<DTO, Entity> mapDTOToEntity,
  }) async {
    _controller?.add(Resource<Entity>.loading());
    final data = await loadFromDB();

    if (await shouldFetch(data)) {
      _controller?.add(Resource<Entity>.loading(data));
      try {
        final dto = await fetchFromAPI();
        final entity = mapDTOToEntity(dto);

        await storeToDB(entity);

        _controller?.add(Resource<Entity>.success(entity));
      } catch (exception) {
        _controller?.add(Resource<Entity>.failed(exception));
      }
    } else {
      if (data != null) {
        _controller?.add(Resource<Entity>.success(data));
      } else {
        _controller?.add(Resource<Entity>.empty());
      }
    }
  }

  void _ensureControllerCreated() {
    if (_controller == null) {
      _controller = StreamController<Resource<Entity>>.broadcast();
      _stream = _controller?.stream.asBroadcastStream();
    }
  }

  /// Method to dispose of the [NetworkBoundResource] by closing the
  /// [StreamController].
  void dispose() {
    _controller?.close();
    _controller = null;
    _stream = null;
  }
}
