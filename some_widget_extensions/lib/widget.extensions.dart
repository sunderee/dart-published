import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Collection of extensions on Material [Widget].
extension WidgetExtensions on Widget {
  /// Wrap a widget in [Card].
  Card card({
    Key? key,
    Color? color,
    Color? shadowColor,
    Color? surfaceTintColor,
    double? elevation,
    ShapeBorder? shape,
    bool borderOnForeground = true,
    EdgeInsetsGeometry? margin,
    Clip? clipBehavior,
    bool semanticContainer = true,
  }) {
    return Card(
      key: key,
      color: color,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      elevation: elevation,
      shape: shape,
      borderOnForeground: borderOnForeground,
      margin: margin,
      clipBehavior: clipBehavior,
      child: this,
    );
  }

  /// Wrap a widget in [SafeArea].
  SafeArea safeArea({
    Key? key,
    bool left = true,
    bool top = true,
    bool right = true,
    bool bottom = true,
    EdgeInsets minimum = EdgeInsets.zero,
    bool maintainBottomViewPadding = false,
  }) {
    return SafeArea(
      key: key,
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      minimum: minimum,
      maintainBottomViewPadding: maintainBottomViewPadding,
      child: this,
    );
  }

  /// Wrap a widget in [Padding].
  Padding padding({
    Key? key,
    required EdgeInsetsGeometry padding,
  }) {
    return Padding(
      key: key,
      padding: padding,
      child: this,
    );
  }

  /// Wraps a widget in [SizedBox].
  SizedBox sizedBox({
    Key? key,
    double? width,
    double? height,
  }) {
    return SizedBox(
      key: key,
      width: width,
      height: height,
      child: this,
    );
  }

  /// Wraps a widget in [Container].
  Container container({
    Key? key,
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    Color? color,
    Decoration? decoration,
    Decoration? foregroundDecoration,
    double? width,
    double? height,
    BoxConstraints? constraints,
    EdgeInsetsGeometry? margin,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    Clip clipBehavior = Clip.none,
  }) {
    return Container(
      key: key,
      alignment: alignment,
      padding: padding,
      color: color,
      decoration: decoration,
      foregroundDecoration: foregroundDecoration,
      width: width,
      height: height,
      constraints: constraints,
      margin: margin,
      transform: transform,
      transformAlignment: transformAlignment,
      clipBehavior: clipBehavior,
      child: this,
    );
  }

  /// Wrap a widget in [Expanded].
  Expanded expanded({
    Key? key,
    int flex = 1,
  }) {
    return Expanded(
      key: key,
      flex: flex,
      child: this,
    );
  }

  /// Wrap a widget in [ClipRect].
  ClipRect clipRect({
    Key? key,
    CustomClipper<Rect>? clipper,
    Clip clipBehavior = Clip.hardEdge,
  }) {
    return ClipRect(
      key: key,
      clipper: clipper,
      clipBehavior: clipBehavior,
      child: this,
    );
  }

  /// Wrap a widget in [ClipRRect].
  ClipRRect clipRRect({
    Key? key,
    BorderRadiusGeometry borderRadius = BorderRadius.zero,
    CustomClipper<RRect>? clipper,
    Clip clipBehavior = Clip.antiAlias,
  }) {
    return ClipRRect(
      key: key,
      borderRadius: borderRadius,
      clipper: clipper,
      clipBehavior: clipBehavior,
      child: this,
    );
  }

  /// Wrap a widget in [ClipOval].
  ClipOval clipOval({
    Key? key,
    CustomClipper<Rect>? clipper,
    Clip clipBehavior = Clip.antiAlias,
  }) {
    return ClipOval(
      key: key,
      clipper: clipper,
      clipBehavior: clipBehavior,
      child: this,
    );
  }

  /// Wrap a widget in [ClipPath].
  ClipPath clipPath({
    Key? key,
    CustomClipper<Path>? clipper,
    Clip clipBehavior = Clip.antiAlias,
  }) {
    return ClipPath(
      key: key,
      clipper: clipper,
      clipBehavior: clipBehavior,
      child: this,
    );
  }

  /// Wrap a widget in [InkWell].
  InkWell inkWell({
    Key? key,
    void Function()? onTap,
    void Function()? onDoubleTap,
    void Function()? onLongPress,
    void Function(TapDownDetails)? onTapDown,
    void Function(TapUpDetails)? onTapUp,
    void Function()? onTapCancel,
    void Function()? onSecondaryTap,
    void Function(TapUpDetails)? onSecondaryTapUp,
    void Function(TapDownDetails)? onSecondaryTapDown,
    void Function()? onSecondaryTapCancel,
    void Function(bool)? onHighlightChanged,
    void Function(bool)? onHover,
    MouseCursor? mouseCursor,
    Color? focusColor,
    Color? hoverColor,
    Color? highlightColor,
    MaterialStateProperty<Color?>? overlayColor,
    Color? splashColor,
    InteractiveInkFeatureFactory? splashFactory,
    double? radius,
    BorderRadius? borderRadius,
    ShapeBorder? customBorder,
    bool? enableFeedback = true,
    bool excludeFromSemantics = false,
    FocusNode? focusNode,
    bool canRequestFocus = true,
    void Function(bool)? onFocusChange,
    bool autofocus = false,
    MaterialStatesController? statesController,
  }) {
    return InkWell(
      key: key,
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onTapCancel: onTapCancel,
      onSecondaryTap: onSecondaryTap,
      onSecondaryTapUp: onSecondaryTapUp,
      onSecondaryTapDown: onSecondaryTapDown,
      onSecondaryTapCancel: onSecondaryTapCancel,
      onHighlightChanged: onHighlightChanged,
      onHover: onHover,
      mouseCursor: mouseCursor,
      focusColor: focusColor,
      hoverColor: hoverColor,
      highlightColor: highlightColor,
      overlayColor: overlayColor,
      splashColor: splashColor,
      splashFactory: splashFactory,
      radius: radius,
      borderRadius: borderRadius,
      customBorder: customBorder,
      enableFeedback: enableFeedback,
      excludeFromSemantics: excludeFromSemantics,
      focusNode: focusNode,
      canRequestFocus: canRequestFocus,
      onFocusChange: onFocusChange,
      autofocus: autofocus,
      statesController: statesController,
      child: this,
    );
  }

  /// Wrap a widget in [SingleChildScrollView].
  SingleChildScrollView singleChildScrollView({
    Key? key,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    EdgeInsetsGeometry? padding,
    bool? primary,
    ScrollPhysics? physics,
    ScrollController? controller,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    Clip clipBehavior = Clip.hardEdge,
    String? restorationId,
    ScrollViewKeyboardDismissBehavior keyboardDismissBehavior =
        ScrollViewKeyboardDismissBehavior.manual,
  }) {
    return SingleChildScrollView(
      key: key,
      scrollDirection: scrollDirection,
      reverse: reverse,
      padding: padding,
      primary: primary,
      physics: physics,
      controller: controller,
      dragStartBehavior: dragStartBehavior,
      clipBehavior: clipBehavior,
      restorationId: restorationId,
      keyboardDismissBehavior: keyboardDismissBehavior,
      child: this,
    );
  }
}
