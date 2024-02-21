import 'package:equatable/equatable.dart';

/// Enum representing different states in which a resource can be in.
enum ResourceStatus { empty, loading, success, failed }

/// Immutable class representing a resource that can be in one of four states:
/// `empty`, `loading`, `success`, or `failed`. It is designed to help manage
/// and represent the state of a resource in a clean and consistent way.
final class Resource<T> extends Equatable {
  /// The status of the resource.
  final ResourceStatus status;

  /// The data associated with the resource, if it is in the success state.
  /// It will be `null` if the resource is in any state other than success.
  final T? data;

  /// The exception associated with the resource, if it is in the failed state.
  /// It will be `null` if the resource is in any state other than failed.
  final Object? exception;

  // Private constructor used by named constructors.
  const Resource._({
    required this.status,
    this.data,
    this.exception,
  });

  /// Named constructor for creating an empty resource.
  const Resource.empty() : this._(status: ResourceStatus.empty);

  /// Named constructor for creating a loading resource. Takes the nullable
  /// [data] which may or may not be associated with the resource
  const Resource.loading([T? data])
      : this._(
          status: ResourceStatus.loading,
          data: data,
        );

  /// Named constructor for creating a success resource. Takes the [data]
  /// associated with the resource.
  const Resource.success(T data)
      : this._(
          status: ResourceStatus.success,
          data: data,
        );

  /// Named constructor for creating a failed resource. Takes the [exception]
  /// associated with the resource.
  const Resource.failed(Object exception)
      : this._(
          status: ResourceStatus.failed,
          exception: exception,
        );

  @override
  List<Object?> get props => [status, data, exception];
}
