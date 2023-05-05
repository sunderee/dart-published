typedef PredicateCallback<T> = bool Function(T it);

extension ScopeFunctionTakes<T> on T {
  /// Returns `this` value if it satisfies the given [predicament] or null if
  /// it doesn't.
  T? takeIf(PredicateCallback<T> predicament) =>
      predicament.call(this) ? this : null;

  /// Returns `this` value if it does not satisfy the given [predicament] or
  /// null if it does.
  T? takeUnless(PredicateCallback<T> predicament) =>
      predicament.call(this) ? null : this;
}
