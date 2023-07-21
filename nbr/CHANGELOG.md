## 0.0.1

- Initial version.

## 0.0.2

- Bump Dart SDK version constraint and update dependencies.

## 0.0.3

- Bump Dart SDK version constraint and update dependencies.

## 0.0.4

- Bump Dart SDK version constraint and update dependencies.

## 1.0.0

- GitHub repository cleanup
- Regenerate `analysis_options.yaml` file

## 1.0.1

- Dart 3 ready: new `analysis_options.yaml` file + bumped Dart SDK constraints

## 1.0.2

- Update `analysis_options.yaml` file.

## 1.0.3

- `shouldFetch` callback has a different signature, it's now defined as `typedef ShouldFetchCallback<Entity> = FutureOr<bool> Function(Entity? entity)` instead of `typedef ShouldFetchCallback<Entity> = bool Function(Entity? entity)`

## 2.0.0

- This version contains **breaking changes**.
- `NetworkBoundResource`
  - Added
    - Implemented use of a `StreamController` to manage the stream of `Resource` objects emitted by the `NetworkBoundResource`. The stream can be accessed via a `stream` getter.
    - Added a `dispose` method to close the `StreamController` when the `NetworkBoundResource` is no longer needed.
  - Changed
    - Modified the `fetch` method to use the `StreamController` to emit `Resource` objects representing the current state of the resource.
    - Updated exception handling in the `fetch` method to emit a `Resource.failed` object with the caught exception.
- `Resource`
  - Added
    - Added a `ResourceStatus` enum to represent the different states a resource can be in.
    - Added `status` field to `Resource` to indicate the current state of the resource.
    - Added `exception` field to `Resource` to hold an exception if the resource is in the `failed` state.
  - Changed
    - Made `Resource` an immutable class.
    - Replaced separate subclasses for each resource state (empty, loading, success, failed) with named constructors in the `Resource` class itself.
    - Renamed `baseData` to `data` and `baseException` to `exception` for clarity.

## 2.0.1

- Bump Dart SDK constraint and update `test` dependency version.
- Updates to the documentation.

## 2.0.2

- Minor fixes related to the stream getter potentially causing `Bad state: Stream has already been listened to`.
- Bump minimum Dart SDK version

## 2.0.3

- Bump Dart SDK version constraint.
