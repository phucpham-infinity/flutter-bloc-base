library code_input;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A widget for inputting content with a fixed length, visually treating each
/// character as a separate segment.
///
/// ## Sample code
///
/// ```dart
/// CodeInput(
///   length: 4,
///   keyboardType: TextInputType.number,
///   builder: CodeInputBuilders.lightCircle(),
///   onFilled: (value) => print('Your input is $value.'),
///   onDone: (value) => print('Your input is $value.'),
/// )
/// ```
///
/// See also:
///
/// * [TextField], an input where the characters aren't separated from each
///   other.
typedef CodeInputBuilder = Widget Function(bool hasFocus, String char);

class CodeInput extends StatefulWidget {
  CodeInput._({
    Key? key,
    required this.length,
    required this.focusNode,
    required this.keyboardType,
    required this.inputFormatters,
    required this.builder,
    required this.controller,
    this.spacing = 8,
    this.onChanged,
    this.onFilled,
    this.onDone,
  }) : super(key: key);

  factory CodeInput({
    Key? key,
    required int length,
    required TextEditingController controller,
    FocusNode? focusNode,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
    required CodeInputBuilder builder,
    double spacing = 8,
    void Function(String value)? onChanged,
    void Function(String value)? onFilled,
    void Function(String value)? onDone,
  }) {
    assert(length > 0, 'The length needs to be larger than zero.');
    assert(length.isFinite, 'The length needs to be finite.');

    return CodeInput._(
      key: key,
      length: length,
      controller: controller,
      focusNode: focusNode ?? FocusNode(),
      keyboardType: keyboardType,
      inputFormatters:
          inputFormatters ?? _createInputFormatters(length, keyboardType),
      builder: builder,
      spacing: spacing,
      onChanged: onChanged,
      onFilled: onFilled,
      onDone: onDone,
    );
  }

  /// The length of character widgets to always display.
  ///
  /// ## Sample code
  ///
  /// A code input with 4 characters:
  ///
  /// ```dart
  /// CodeInput(length: 4)
  /// ```
  final int length;

  /// Defines the keyboard focus for this widget.
  ///
  /// The [focusNode] is a long-lived object that's typically managed by a
  /// [StatefulWidget] parent. See [FocusNode] for more information.
  ///
  /// ## Sample code
  ///
  /// ```dart
  /// CodeInput(focusNode: myFocusNode);
  /// ```
  ///
  /// You can then request the `CodeInput`'s focus by calling:
  ///
  /// ```dart
  /// FocusScope.of(context).requestFocus(myFocusNode);
  /// ```
  final FocusNode focusNode;
  final TextEditingController controller;

  /// The type of keyboard which shows up.
  ///
  /// ## Sample code
  ///
  /// ```dart
  /// CodeInput(keyboardType: TextInputType.number)
  /// ```
  final TextInputType keyboardType;

  /// A list of input formatters which can validate the text as it is being
  /// typed.
  ///
  /// If you specify this parameter, the default input formatters aren't used,
  /// so make sure you really check for everything (like length of the input).
  ///
  /// ## Sample code
  ///
  /// An code input that displays a normal keyboard but only allows for
  /// hexadecimal input:
  ///
  /// ```dart
  /// CodeInput(
  ///   inputFormatters: [
  ///     FilteringTextInputFormatter.allow(RegExp('^[0-9a-fA-F]*\$'))
  ///   ]
  /// )
  /// ```
  final List<TextInputFormatter> inputFormatters;

  /// A builder for the character widgets.
  ///
  /// See [CodeInputBuilders] for examples.
  final CodeInputBuilder builder;

  /// A parameter for customizing the padding between characters.
  final double spacing;

  /// A callback for changes to the input.
  final void Function(String value)? onChanged;

  /// A callback for when the input is filled.
  final void Function(String value)? onFilled;

  /// A callback for when the done button clicked
  final void Function(String value)? onDone;

  /// A helping function that creates input formatters for a given [length] and
  /// [keyboardType].
  static List<TextInputFormatter> _createInputFormatters(
      int length, TextInputType keyboardType) {
    final formatters = <TextInputFormatter>[
      LengthLimitingTextInputFormatter(length)
    ];

    // Add keyboard specific formatters.
    // For example, a code input with a number keyboard type probably doesn't
    // want to allow decimal separators or signs.
    if (keyboardType == TextInputType.number) {
      formatters.add(FilteringTextInputFormatter.allow(RegExp('^[0-9]*\$')));
    }

    return formatters;
  }

  @override
  _CodeInputState createState() => _CodeInputState();
}

class _CodeInputState extends State<CodeInput> {
  String get text => widget.controller.text;

  @override
  Widget build(BuildContext context) {
    // We'll display the visual widget and a not shown EditableText for doing
    // the actual work on top of each other.
    return Stack(children: <Widget>[
      // This is the actual EditableText wrapped in a Container with zero
      // dimensions.
      Container(
          width: 0.0,
          height: 0.0,
          child: EditableText(
            controller: widget.controller,
            focusNode: widget.focusNode,
            inputFormatters: widget.inputFormatters,
            keyboardType: widget.keyboardType,
            backgroundCursorColor: Colors.black,
            style: TextStyle(),
            // Doesn't really matter.
            cursorColor: Colors.black,
            // Doesn't really matter.
            onChanged: (value) => setState(() {
              widget.onChanged?.call(value);
              if (value.length == widget.length) {
                widget.onFilled?.call(value);
              }
            }),
            onEditingComplete: () => setState(() {
              widget.onDone?.call(widget.controller.text);
            }),
          )),
      // These are the actual character widgets. A transparent container lies
      // right below the gesture detector, so all taps get collected, even
      // the ones between the character widgets.
      GestureDetector(
          onTap: () {
            final focusScope = FocusScope.of(context);
            focusScope.requestFocus(FocusNode());
            Future.delayed(
              Duration.zero,
              () => focusScope.requestFocus(widget.focusNode),
            );
          },
          child: Container(
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: List.generate(widget.length, (i) {
                final hasFocus = widget.controller.selection.start == i;
                final char = i < text.length ? text[i] : '';
                var characterWidget = widget.builder(hasFocus, char);
                if (i > 0) {
                  characterWidget = Padding(
                    padding: EdgeInsets.only(left: widget.spacing),
                    child: widget.builder(hasFocus, char),
                  );
                }
                return characterWidget;
              }),
            ),
          )),
    ]);
  }
}

/// An abstract class that provides some commonly-used builders for the
/// character widgets.
///
/// * [containerized]: A builder putting chars in an animated container.
/// * [circle]: A builder putting chars in circles.
/// * [rectangle]: A builder putting chars in rectangles.
/// * [lightCircle]: A builder putting chars in light circles.
/// * [darkCircle]: A builder putting chars in dark circles.
/// * [lightRectangle]: A builder putting chars in light rectangles.
/// * [darkRectangle]: A builder putting chars in dark rectangles.
abstract class CodeInputBuilders {
  /// Builds the input inside an animated container.
  static CodeInputBuilder containerized({
    Duration animationDuration = const Duration(milliseconds: 50),
    required Size emptySize,
    required BoxDecoration emptyDecoration,
    required BoxDecoration filledDecoration,
    required TextStyle emptyTextStyle,
    required TextStyle filledTextStyle,
  }) {
    return (bool hasFocus, String char) => Container(
          width: char.isEmpty ? 12 : 12,
          height: char.isEmpty ? 12 : 12,
          alignment: Alignment.center,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 100),
            decoration: char.isEmpty
                ? emptyDecoration
                : BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            alignment: Alignment.center,
          ),
        );
  }

  /// Builds the input inside a circle.
  static CodeInputBuilder circle(
      {double emptyRadius = 4,
      required Color color,
      required TextStyle textStyle}) {
    final decoration = BoxDecoration(
      shape: BoxShape.circle,
      color: color,
    );

    return containerized(
        emptySize: Size.fromRadius(emptyRadius),
        emptyDecoration: decoration,
        filledDecoration: decoration,
        emptyTextStyle: textStyle.copyWith(fontSize: 0.0),
        filledTextStyle: textStyle);
  }

  /// Builds the input inside a rectangle.
  static CodeInputBuilder rectangle({
    Size totalSize = const Size(50.0, 60.0),
    Size emptySize = const Size(20.0, 20.0),
    Size filledSize = const Size(40.0, 60.0),
    BorderRadius borderRadius = BorderRadius.zero,
    required Border border,
    required Color color,
    required TextStyle textStyle,
  }) {
    final decoration = BoxDecoration(
      border: border,
      borderRadius: borderRadius,
      color: color,
    );

    return containerized(
        emptySize: emptySize,
        emptyDecoration: decoration,
        filledDecoration: decoration,
        emptyTextStyle: textStyle.copyWith(fontSize: 0.0),
        filledTextStyle: textStyle);
  }

  /// Builds the input inside a light circle.
  static CodeInputBuilder lightCircle(
      {double emptyRadius = 4.0, required TextStyle textStyle}) {
    return circle(
      emptyRadius: emptyRadius,
      color: Colors.white.withOpacity(0.5),
      textStyle: textStyle,
    );
  }

  /// Builds the input inside a light circle.
  static CodeInputBuilder darkCircle({
    double emptyRadius = 10.0,
  }) {
    return circle(
      emptyRadius: emptyRadius,
      color: Colors.black12,
      textStyle: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  /// Builds the input inside a light rectangle.
  static CodeInputBuilder lightRectangle({
    Size totalSize = const Size(50.0, 60.0),
    Size emptySize = const Size(20.0, 20.0),
    Size filledSize = const Size(40.0, 60.0),
    BorderRadius borderRadius = BorderRadius.zero,
  }) {
    return rectangle(
        totalSize: totalSize,
        emptySize: emptySize,
        filledSize: filledSize,
        borderRadius: borderRadius,
        border: Border.all(color: Colors.white, width: 2.0),
        color: Colors.white10,
        textStyle: TextStyle(
            color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold));
  }

  /// Builds the input inside a dark rectangle.
  static CodeInputBuilder darkRectangle({
    Size totalSize = const Size(50.0, 60.0),
    Size emptySize = const Size(20.0, 20.0),
    Size filledSize = const Size(40.0, 60.0),
    BorderRadius borderRadius = BorderRadius.zero,
  }) {
    return rectangle(
        totalSize: totalSize,
        emptySize: emptySize,
        filledSize: filledSize,
        borderRadius: borderRadius,
        border: Border.all(color: Colors.black, width: 2.0),
        color: Colors.black12,
        textStyle: TextStyle(
            color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold));
  }
}
