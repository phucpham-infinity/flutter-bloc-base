import 'package:flutter/material.dart';

import '../../../core/theme/size.dart';
import 'app_button.dart';

class AppExpandButton extends StatelessWidget {
  final AppButton child;
  final bool? loading;

  const AppExpandButton({required this.child, this.loading, Key? key})
      : super(key: key);

  factory AppExpandButton.primary({
    required VoidCallback onTap,
    required String label,
    bool? enabled,
    bool? loading,
    bool forceUppercase = true,
    Color? textColor,
    bool backgroundTransparent = false,
    ButtonStyle? buttonStyle,
  }) =>
      AppExpandButton(
          loading: loading,
          child: AppButton.primary(
            onTap: onTap,
            enabled: enabled,
            backgroundTransparent: backgroundTransparent,
            label: label,
            buttonStyle: buttonStyle,
            forceUppercase: forceUppercase,
            textColor: textColor,
          ));

  factory AppExpandButton.secondary({
    required VoidCallback onTap,
    required String label,
    bool? enabled,
    bool? loading,
    bool forceUppercase = true,
  }) =>
      AppExpandButton(
          loading: loading,
          child: AppButton.secondary(
            onTap: onTap,
            enabled: enabled,
            label: label,
          ));

  factory AppExpandButton.icon(
          {required VoidCallback onTap,
          required Widget label,
          IconData? icon,
          bool? loading,
          double iconSize = 24,
          ButtonStyle? style,
          bool? enabled,
          Color? iconColor,
          AppIconButtonPosition? iconPosition,
          double? radius,
          Widget? wIcon}) =>
      AppExpandButton(
          loading: loading,
          child: AppButton.icon(
            spaceBetween: Sz.i.s10,
            heightItem: Sz.i.s72,
            onTap: onTap,
            label: label,
            icon: icon,
            iconSize: iconSize,
            enabled: enabled,
            iconColor: iconColor,
            style: style,
            iconPosition: iconPosition,
            expand: false,
            padIconSymmetrically: false,
            wIcon: wIcon,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            radius: radius,
          ));

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        transitionBuilder: _transition,
        layoutBuilder: _layoutBuilder,
        child: (loading ?? false) ? _loader : child);
  }

  Widget _layoutBuilder(Widget? currentChild, List<Widget> previousChildren) {
    List<Widget> children = [
      currentChild ?? const SizedBox(),
      ...previousChildren
    ];

    if (loading == false) children = children.reversed.toList();

    return SizedBox(
      height: Sz.i.s56,
      child: Stack(
        alignment: Alignment.center,
        children: children,
      ),
    );
  }

  Widget _transition(Widget child, Animation<double> animation) {
    return _AwareAnimatedWidget(sizeFactor: animation, child: child);
  }

  Widget get _loader => Align(
      alignment: Alignment.center,
      child: Container(
          height: Sz.i.s52,
          width: Sz.i.s52,
          padding: const EdgeInsets.all(8),
          decoration: _decoration,
          child: CircularProgressIndicator(
              strokeWidth: 2,
              color: child.style?.foregroundColor
                  ?.resolve({MaterialState.focused}))));

  Decoration get _decoration =>
      (child is OutlinedButton ? _outlineButtonDeco : _textButtonDeco)
          .copyWith(shape: BoxShape.circle);

  BoxDecoration get _textButtonDeco => BoxDecoration(
      color: child.style?.backgroundColor?.resolve({MaterialState.focused}));

  BoxDecoration get _outlineButtonDeco => BoxDecoration(
      color: child.style?.backgroundColor?.resolve({MaterialState.focused}));
}

class _AwareAnimatedWidget extends AnimatedWidget {
  const _AwareAnimatedWidget({
    Key? key,
    required Animation<double> sizeFactor,
    this.child,
  }) : super(key: key, listenable: sizeFactor);

  Animation<double> get sizeFactor => listenable as Animation<double>;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, layout) {
      return SizedBox(width: layout.maxWidth * sizeFactor.value, child: child);
    });
  }
}
