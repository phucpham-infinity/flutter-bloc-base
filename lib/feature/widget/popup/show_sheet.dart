import 'dart:ui';

import 'package:flutter/material.dart';

Future<T?> showSheet<T>(
  BuildContext context, {
  required Widget child,
  bool isBlurBarrier = true,
  bool isShowButtonHeader = false,
  bool isBlurGradient = false,
  double? heightBottomSheet,
  double opacity = 0.6,
  MainAxisSize mainAxisSize = MainAxisSize.min,
  Color? background,
  ImageFilter? filter,
  bool enableDrag = true,
  bool titleCenter = false,
}) {
  final bg = background ?? const Color.fromRGBO(255, 255, 255, 1);
  final filterModal = filter ?? ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0);

  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    enableDrag: enableDrag,
    backgroundColor: Colors.transparent,
    barrierColor: isBlurBarrier ? null : Colors.transparent,
    useRootNavigator: true,
    builder: (_) {
      final body = Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(opacity),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Container(
          height: heightBottomSheet,
          margin: const EdgeInsets.only(top: 1),
          decoration: BoxDecoration(
              color: bg,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40))),
          child: Column(
            mainAxisSize: mainAxisSize,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isShowButtonHeader)
                Center(
                  child: GestureDetector(
                    onTap: Navigator.of(context).pop,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      width: 80,
                      height: 6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              if (mainAxisSize == MainAxisSize.max)
                Expanded(child: child)
              else
                child,
            ],
          ),
        ),
      );

      if (isBlurBarrier) {
        final size = MediaQuery.of(context).size;
        if (isBlurGradient) {
          return Stack(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  height: size.height,
                  width: size.width,
                  decoration: BoxDecoration(gradient: gradient),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: BackdropFilter(
                  filter: filterModal,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                    child: body,
                  ),
                ),
              )
            ],
          );
        }
        return BackdropFilter(
          filter: filterModal,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            child: body,
          ),
        );
      } else {
        return ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          child: Container(
            decoration: const BoxDecoration(color: Colors.transparent),
            child: BackdropFilter(
              filter: filterModal,
              child: body,
            ),
          ),
        );
      }
    },
  );
}

Gradient get gradient => LinearGradient(
        colors: [
          Color(0xffBFB4AE).withOpacity(0.5),
          Color(0xff4F7F81).withOpacity(0.5)
        ],
        stops: [
          0.0,
          1.0
        ],
        begin: FractionalOffset.topCenter,
        end: FractionalOffset.bottomCenter,
        tileMode: TileMode.repeated);
