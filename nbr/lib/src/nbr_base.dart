import 'dart:async';

import 'package:nbr/src/resource.dart';
import 'package:nbr/src/typedefs.dart';

/// Abstract base class that your code needs to extend. It defines a single
/// abstract method [fetch].
abstract class NetworkBoundResource {
  /// Generator method that returns a stream of [Resource] objects. It takes
  /// five required arguments:
  ///
  /// - [fetchFromAPI]: A callback that fetches data from an API and returns a
  /// future or the data transfer object (DTO).
  /// - [loadFromDB]: A callback that loads data from a database and returns a
  /// future or the entity.
  /// - [storeToDB]: A callback that stores data to a database and returns a
  /// future.
  /// - [shouldFetch]: A callback that determines whether data should be fetched
  /// from the API or not. Returns a boolean value.
  /// - [mapDTOToEntity]: A callback that maps a DTO to an entity.
  ///
  /// [fetch] begins by yielding a `Resource.loading(null)` object and then
  /// waits for the result of `loadFromDB()`. If `shouldFetch(data)` returns
  /// `true`, it yields a `Resource.loading(data)` object and tries to fetch
  /// data from the API using `fetchFromAPI()`. If the fetch is successful, it
  /// maps the DTO to an entity using `mapDTOToEntity(dto)`, stores the entity
  /// in the database using `storeToDB(entity)`, and yields a
  /// `Resource.success(entity)` object. If the [fetch] throws an exception, it
  /// catches the exception and yields a `Resource.failed(exception)` object.
  ///
  /// If `shouldFetch(data)` returns `false`, the [fetch] checks if `data` is
  /// null. If it is null, it yields a `Resource.empty()` object. If it is not
  /// null, it yields a `Resource.success(data)` object.
  Stream<Resource<Entity>> fetch<Entity, DTO>({
    required FetchFromApiCallback<DTO> fetchFromAPI,
    required LoadFromDBCallback<Entity> loadFromDB,
    required StoreToDBCallback<Entity> storeToDB,
    required ShouldFetchCallback<Entity> shouldFetch,
    required MapDTOToEntity<DTO, Entity> mapDTOToEntity,
  }) async* {
    yield* _emit(Resource.loading(null));
    final data = await loadFromDB();

    if (shouldFetch(data)) {
      yield* _emit(Resource.loading(data));
      try {
        final dto = await fetchFromAPI();
        final entity = mapDTOToEntity(dto);

        await storeToDB(entity);

        yield* _emit(Resource.success(entity));
      } on Exception catch (exception) {
        yield* _emit(Resource.failed(exception));
      }
    } else {
      if (data != null) {
        yield* _emit(Resource.success(data));
      } else {
        yield* _emit(Resource.empty());
      }
    }
  }

  Stream<T> _emit<T>(T data) => Stream.value(data);
}
