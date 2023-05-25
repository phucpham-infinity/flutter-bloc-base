import 'package:flutter/material.dart';
import '../../../../core/theme/text_style.dart';
import 'otp_widget.dart';

class BuildOtp extends StatelessWidget {
  final TextEditingController controller;
  const BuildOtp({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: CodeInput(
            controller: controller,
            length: 4,
            builder: CodeInputBuilders.lightCircle(
                emptyRadius: 4,
                textStyle: ptBodyLargeThin(context)
                    .copyWith(fontWeight: FontWeight.w600)),
            spacing: 16,
            onFilled: (value) => print('Your input is $value.'),
            onDone: (value) => print('Your input is $value.'),
          ),
        ),
      ],
    );
  }
}
