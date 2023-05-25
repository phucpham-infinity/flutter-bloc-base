import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/images/images.dart';
import 'package:pine_app/core/theme/size.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/core/util/navigation_utils.dart';
import 'package:pine_app/feature/phone_verification/enter_your_phone_number_screen.dart';
import 'package:pine_app/feature/widget/button/app_expand_button.dart';
import 'package:pine_app/feature/widget/container/blur_image_container.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';
import 'package:pine_app/generated/l10n.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlurImageContainer(
        urlImage: Images.bgWelcome,
        child: Padding(
          padding:
              EdgeInsets.symmetric(vertical: Sz.i.s48, horizontal: Sz.i.s24),
          child: Column(
            children: [
              const Spacer(),
              AnimationLimiter(
                child: AnimationConfiguration.staggeredList(
                  position: 50,
                  duration: const Duration(milliseconds: 100),
                  child: SlideAnimation(
                    horizontalOffset: 50,
                    child: FadeInAnimation(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.current.pineBanking,
                            style: ptBodyLargeThin(context).copyWith(
                                height: 1.5,
                                fontSize: Sz.i.s24,
                                color: getColor(context).white,
                                fontWeight: FontWeight.w400),
                          ),
                          const SpacingBox(h: 27),
                          Text(
                            S.current
                                .intuitiveBankingAcceleratingBusinessMomentum,
                            style: ptTitle4(context).copyWith(
                              fontSize: Sz.i.s48,
                              color: getColor(context).white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SpacingBox(h: 57),
                          AppExpandButton.primary(
                              forceUppercase: false,
                              enabled: true,
                              onTap: () {
                                navigateTo(const EnterYourPhoneNumberScreen());
                              },
                              label: S.current.getStarted),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
