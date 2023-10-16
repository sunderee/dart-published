import 'package:flutter/material.dart';
import 'package:some_widget_extensions/widget.extensions.dart';
import 'package:some_widget_extensions/widget_list.extensions.dart';

final class FirstWidget extends StatelessWidget {
  const FirstWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

final class SecondWidget extends StatelessWidget {
  const SecondWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

void main() {
  // Imagine you have a few widgets that need to become a column...
  final traditionalColumnWidget = Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      const Expanded(
        child: Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: FirstWidget(),
        ),
      ),
      Container(
        constraints: const BoxConstraints(maxWidth: 145.0),
        child: const SecondWidget(),
      )
    ],
  );

  // ...using some_widget_extensions, this can become
  final lovelyColumnWidget = [
    const FirstWidget()
        .padding(padding: const EdgeInsets.only(bottom: 8.0))
        .expanded(),
    const SecondWidget()
        .container(constraints: const BoxConstraints(maxWidth: 145.0))
  ].column(mainAxisSize: MainAxisSize.min);
}
