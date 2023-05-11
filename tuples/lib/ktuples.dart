/// Collection of Kotlin-inspired named tuples (from Pair to Sextuple).
library ktuples;

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// A class representing a pair of values, which are immutable and extend the
/// [Equatable] class.
@immutable
final class Pair<A, B> extends Equatable {
  /// The first value in the pair.
  final A first;

  /// The second value in the pair.
  final B second;

  @override
  List<Object?> get props => [first, second];

  /// Creates a new instance of [Pair] with the given values.
  @literal
  const Pair(
    this.first,
    this.second,
  );

  @override
  String toString() => '$runtimeType: ${props.join(', ')}';
}

/// A class representing a triple of values, which are immutable and extend the
/// [Equatable] class.
@immutable
final class Triple<A, B, C> extends Equatable {
  /// The first value in the triple.
  final A first;

  /// The second value in the triple.
  final B second;

  /// The third value in the triple.
  final C third;

  @override
  List<Object?> get props => [first, second, third];

  /// Create a new instance of [Triple] with the given values.
  @literal
  const Triple(
    this.first,
    this.second,
    this.third,
  );

  @override
  String toString() => '$runtimeType: ${props.join(', ')}';
}

/// A class representing a quadruple of values, which are immutable and extend
/// the [Equatable] class.
@immutable
final class Quadruple<A, B, C, D> extends Equatable {
  /// The first value in the quadruple.
  final A first;

  /// The second value in the quadruple.
  final B second;

  /// The third value in the quadruple.
  final C third;

  /// The fourth value in the quadruple.
  final D fourth;

  @override
  List<Object?> get props => [first, second, third, fourth];

  /// Create a new instance of [Quadruple] with the given values.
  @literal
  const Quadruple(
    this.first,
    this.second,
    this.third,
    this.fourth,
  );

  @override
  String toString() => '$runtimeType: ${props.join(', ')}';
}

/// A class representing a quintuple of values, which are immutable and extend
/// the [Equatable] class.
@immutable
final class Quintuple<A, B, C, D, E> extends Equatable {
  /// The first value in the quintuple.
  final A first;

  /// The second value in the quintuple.
  final B second;

  /// The third value in the quintuple.
  final C third;

  /// The fourth value in the quintuple.
  final D fourth;

  /// The fifth value in the quintuple.
  final E fifth;

  @override
  List<Object?> get props => [first, second, third, fourth, fifth];

  /// Create a new instance of [Quintuple] with the given values.
  @literal
  const Quintuple(
    this.first,
    this.second,
    this.third,
    this.fourth,
    this.fifth,
  );

  @override
  String toString() => '$runtimeType: ${props.join(', ')}';
}
