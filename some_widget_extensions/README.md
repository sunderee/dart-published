# Some Widget Extensions

_Some Widget Extensions_ is a collection of convenience extension methods to be used on widgets. It conserves Flutter's API making it as familiar as possible.

## Inspiration

Partially inspired by [`xtended`](https://pub.dev/packages/xtended). Mostly inspired by the idea circulating in Tech Twitter circles surrounding the comparison of Flutter and SwiftUI.

The idea is to use extensions instead of nesting widgets in widgets; using `some_widget_extensions` you're achieving the same, but with a different syntax.

For example, instead of wrapping `MyWidget` into a `Container` "the traditional way":

```dart
Container(
    width: 123.0,
    height: 456.0,
    padding: EdgeInsetsPadding.all(16.0),
    child: const MyWidget(),
)
```

you can simply do:

```dart
MyWidget()
    .container(
        width: 123.0,
        height: 456.0,
        padding: EdgeInsetsPadding.all(16.0),
    )
```

Obviously you can chain these extensions, if you need to.

## Contributions

The package is under constant development, more extensions will be added. Feel free to contribute. You can do that by opening an issue on GitHub, or by contacting me directly on [X](https://twitter.com/peteralexbizjak) (formerly known as Twitter).