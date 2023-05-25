import 'package:flutter/material.dart';

class DisableArea extends StatelessWidget {
  final bool disabled;
  final Widget child;
  const DisableArea({super.key, required this.disabled, required this.child});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: disabled,
      child: Opacity(
        opacity: disabled ? 0.5 : 1,
        child: child,
      ),
    );
  }
}
