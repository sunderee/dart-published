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
