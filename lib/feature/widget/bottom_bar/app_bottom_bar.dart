import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pine_app/core/theme/app_theme.dart';

import '../../../core/theme/size.dart';

class AppBottomBar extends StatelessWidget {
  final int currentIndex;
  final List<String> icons;
  final Function(int index) onTap;
  const AppBottomBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
    required this.icons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sz.i.s68,
      margin: EdgeInsets.symmetric(horizontal: Sz.i.s24, vertical: Sz.i.s21),
      decoration: BoxDecoration(
          color: getColor(context).primaryNormal,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          icons.length,
          (index) => InkWell(
            onTap: () => onTap.call(index),
            enableFeedback: true,
            borderRadius: BorderRadius.circular(50),
            highlightColor: Colors.white.withOpacity(0.1),
            child: SizedBox(
              height: Sz.i.s68,
              width: Sz.i.s68,
              child: Center(
                child: SvgPicture.asset(
                  icons[index],
                  height: Sz.i.s20,
                  width: Sz.i.s20,
                  colorFilter: ColorFilter.mode(
                      currentIndex == index ? Colors.white : Colors.white60,
                      BlendMode.srcIn),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
