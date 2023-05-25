import 'package:flutter/material.dart';
import 'package:pine_app/feature/widget/progress/loader.dart';

class LoadingArea extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  const LoadingArea({Key? key, required this.isLoading, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IgnorePointer(
          ignoring: isLoading,
          child: Opacity(
            opacity: isLoading ? 0.5 : 1,
            child: child,
          ),
        ),
        if (isLoading) kLoadingSpinner(context),
      ],
    );
  }
}
