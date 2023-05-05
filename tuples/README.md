# KTuples

This package defines several classes that represent tuple-like structures, which
are immutable and extend the `Equatable` class. The `Pair` class represents a
tuple with two elements, the `Triple` class represents a tuple with three
elements, and so on, up to the `Quintuple` class which represents a tuple with
five elements.

These classes can be useful for situations where you need to pass around small
groups of related data and you want to ensure that the data doesn't change. They
can also make it easier to compare tuples for equality, since you can use the
`==` operator to compare two tuples for equality, and the `hashCode` method
inherited from the `Equatable` class to generate a hash code for a tuple.

## Deprecation notice

With the arrival of Dart 3.0, this package will most likely become useless for
the majority of you out there. Once Dart 3.0 is released, you should consider
using records instead of `ktuples`.

However, I will continue maintaining the package (keeping up with the latest
versions of Dart SDK and new language features) because some of you out there
might still find it useful.

Please keep in mind you should always rely on Dart's built-in features instead
of third-party dependencies such as `ktuples` in the future.
