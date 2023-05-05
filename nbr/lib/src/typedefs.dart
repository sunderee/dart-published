import 'dart:async';

/// Defines a callback that fetches data from an API and returns a future or the
/// data transfer object (DTO).
typedef FetchFromApiCallback<DTO> = FutureOr<DTO> Function();

/// Defines a callback that loads data from a database and returns a future or
/// the entity.
typedef LoadFromDBCallback<Entity> = FutureOr<Entity?> Function();

/// Defines a callback that stores data to a database and returns a future.
typedef StoreToDBCallback<Entity> = FutureOr<void> Function(Entity data);

/// Defines a callback that determines whether data should be fetched from the
/// API or not. Returns a boolean value.
typedef ShouldFetchCallback<Entity> = bool Function(Entity? entity);

/// Defines a callback that maps a DTO to an entity.
typedef MapDTOToEntity<DTO, Entity> = Entity Function(DTO dto);
