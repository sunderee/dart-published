typedef AlsoCallback<T> = void Function(T it);

extension ScopeFunctionAlso<T> on T {
  /// Calls the specified function [block] with this value as its argument and
  /// returns `this` value.
  T also(AlsoCallback<T> block) {
    block.call(this);
    return this;
  }
}
