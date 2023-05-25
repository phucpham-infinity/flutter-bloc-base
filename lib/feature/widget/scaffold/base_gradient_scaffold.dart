import 'package:flutter/material.dart';

class BaseGradientScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;
  const BaseGradientScaffold({
    super.key,
    this.appBar,
    this.body,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(gradient: gradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBar,
        body: body,
      ),
    );
  }

  Gradient get gradient => const LinearGradient(
      colors: [Color(0xffBFB4AE), Color(0xff4F7F81)],
      stops: [0.0, 1.0],
      begin: FractionalOffset.topCenter,
      end: FractionalOffset.bottomCenter,
      tileMode: TileMode.repeated);
}
