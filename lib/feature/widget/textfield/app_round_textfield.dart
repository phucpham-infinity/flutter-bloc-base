import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pine_app/core/theme/app_theme.dart';

import '../../../core/theme/size.dart';
import '../../../core/theme/text_style.dart';

class AppRoundTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? label;
  final bool? autoFocus;
  final bool? enabled;
  final String? hintText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Function validation;
  final Color? backgroundColor;
  final List<TextInputFormatter>? inputFormatter;
  final void Function(String)? onChanged;
  final bool focusWithBorder;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? suffixIcon;
  final bool? hasFocus;

  const AppRoundTextField(
      {required this.controller,
      required this.keyboardType,
      required this.textInputAction,
      required this.validation,
      required this.hintText,
      this.backgroundColor,
      this.onChanged,
      this.inputFormatter,
      this.focusWithBorder = false,
      this.borderRadius,
      Key? key,
      this.autoFocus,
      this.enabled,
      this.contentPadding,
      this.suffixIcon})
      : label = null,
        hasFocus = null,
        super(key: key);
  const AppRoundTextField.label({
    required this.controller,
    required this.keyboardType,
    required this.textInputAction,
    required this.validation,
    required this.label,
    this.onChanged,
    this.inputFormatter,
    this.backgroundColor,
    this.focusWithBorder = false,
    this.borderRadius,
    this.contentPadding,
    this.hasFocus,
    Key? key,
    this.autoFocus,
    this.enabled,
  })  : hintText = null,
        suffixIcon = null,
        super(key: key);

  @override
  State<AppRoundTextField> createState() => _AppRoundTextFieldState();
}

class _AppRoundTextFieldState extends State<AppRoundTextField> {
  final _errorString = ValueNotifier<String>('');
  final _isError = ValueNotifier<bool>(false);
  ValueNotifier<bool> _hasFocus = ValueNotifier<bool>(false);

  @override
  void dispose() {
    super.dispose();
    _errorString.dispose();
    _isError.dispose();
    _hasFocus.dispose();
  }

  @override
  void initState() {
    super.initState();
    _hasFocus = ValueNotifier<bool>(widget.hasFocus ?? false);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isError,
      builder: (BuildContext context, bool isError, _) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ValueListenableBuilder(
            valueListenable: _hasFocus,
            builder: (BuildContext context, bool hasFocus, _) => FocusScope(
              child: Focus(
                onFocusChange: (focus) {
                  _hasFocus.value = focus;
                  _onValidate();
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: widget.backgroundColor ?? background,
                      borderRadius: widget.borderRadius ??
                          BorderRadius.all(Radius.circular(Sz.i.s16)),
                      border: widget.focusWithBorder
                          ? Border.all(
                              width: 2,
                              color: _isError.value ? errorColor : colorBorder)
                          : null),
                  child: TextFormField(
                    enabled: widget.enabled ?? false,
                    controller: widget.controller,
                    cursorColor: const Color(0xff1E1C28),
                    style: textStyle,
                    autofocus: widget.autoFocus ?? false,
                    keyboardType: widget.keyboardType,
                    textInputAction: widget.textInputAction,
                    inputFormatters: widget.inputFormatter,
                    validator: (value) {
                      _onValidate();
                      return null;
                    },
                    onChanged: widget.onChanged,
                    decoration: InputDecoration(
                      suffixIcon: widget.suffixIcon,
                      labelText: widget.label,
                      labelStyle: labelStyle,
                      hintText: widget.hintText,
                      hintStyle: labelStyle,
                      contentPadding: widget.contentPadding ??
                          EdgeInsets.symmetric(
                              vertical: Sz.i.s16, horizontal: Sz.i.s32),
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      border: InputBorder.none,
                      errorStyle: const TextStyle(height: 0),
                      focusedErrorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: isError ? true : false,
            child: Padding(
              padding: EdgeInsets.only(top: Sz.i.s4),
              child: ValueListenableBuilder(
                valueListenable: _errorString,
                builder: (BuildContext context, String errorString, _) =>
                    Text(errorString, style: errorStyle),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onValidate() {
    if (widget.validation(text).isNotEmpty) {
      _isError.value = true;
      _errorString.value = widget.validation(text);
    } else {
      _isError.value = false;
      _errorString.value = widget.validation(text);
    }
  }

  Color get colorBorder =>
      _hasFocus.value ? const Color(0xff878787) : Colors.transparent;

  String get text => widget.controller.text;

  Color get errorColor => const Color(0xffFCB790);

  Color get background => Colors.white;

  TextStyle get textStyle => ptBodyLargeThin(context).copyWith(
      fontSize: Sz.i.s15, height: 1.6, color: const Color(0xff1E1C28));

  TextStyle get labelStyle => ptBodyLargeThin(context).copyWith(
      fontSize: Sz.i.s15, color: getColor(context).textActive, height: 1.16);

  TextStyle get errorStyle =>
      ptBodyLargeThin(context).copyWith(color: errorColor);
}
