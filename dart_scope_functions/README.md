# Dart Scope Functions

[Kotlin-inspired](https://kotlinlang.org/docs/scope-functions.html) scope 
functions implemented in Dart. The purpose of these functions is to execute a
block of code within the context of an object.

Sadly, due to the limitations of the Dart programming language, not all scope
functions could be implemented.

## Usage

*Disclaimer:* there's no need for me to reinvent the wheel with explanations on
how to use these functions, so I'll copy-paste from the official Kotlin
documentation.

For a detailed usage, refer to the examples.

### `also`

`also` is good for performing some actions that take the context object as an
argument. Use `also` for actions that need a reference to the object rather than
its properties and functions, or when you don't want to shadow the `this`
reference from an outer scope.

When you see `also` in the code, you can read it as "and also do the following
with the object."

### `let`

`let` can be used to invoke one or more functions on results of call chains.
`let` is often used for executing a code block only with non-null values. To
perform actions on a non-null object, use the null-aware operator `?.` on it and
call `let` with the actions in its lambda.

Note that in Dart, for the first use case (invoking one or more functions on the
results of call chains), you can just use the cascade operator (`..`). It is
suggested to only use `let` to execute a code block only with non-null values.

### `run`

`run` lets you execute a block of several statements where an expression is
required.

### `takeIf` and `takeUnless`

`takeIf` and `takeUnless` let you embed checks of the object state in call
chains. When called on an object with a predicate provided, `takeIf` returns
this object if it matches the predicate. Otherwise, it returns null. So, `takeIf`
is a filtering function for a single object. In turn, `takeUnless` returns the
object if it doesn't match the predicate and null if it does. The object is
available as a lambda argument (`it`).