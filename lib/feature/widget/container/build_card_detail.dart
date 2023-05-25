import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pine_app/core/model/card_detail.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/images/images.dart';
import 'package:pine_app/core/theme/size.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/core/util/navigation_utils.dart';
import 'package:pine_app/feature/app.dart';
import 'package:pine_app/feature/company_register/delivery_screen.dart';
import 'package:pine_app/feature/company_register/widget/cuarcode_hero.dart';
import 'package:pine_app/feature/company_register/widget/full_screen_cuarcode.dart';
import 'package:pine_app/feature/widget/button/app_expand_button.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';
import 'package:pine_app/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class BuildCardDetail extends StatefulWidget {
  final String title;
  final String subtitle;
  final String icon;
  final bool noButton;
  final List<CardDetail> listCard;
  final ScrollController? controller;
  final Widget? widget;
  final VoidCallback? onTap;

  const BuildCardDetail(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.icon,
      required this.listCard,
      this.controller,
      this.widget,
      this.noButton = false,
      required this.onTap});

  @override
  State<BuildCardDetail> createState() => _BuildCardDetailState();
}

class _BuildCardDetailState extends State<BuildCardDetail> {
  int _index = 0;

  void _onCall() {
    launch('tel://0385140807');
    _index = 2;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.65,
      decoration: BoxDecoration(
          color: getColor(context).white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(Sz.i.s40))),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        controller: widget.controller,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: Sz.i.s40),
          child: Wrap(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Sz.i.s32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(Sz.i.s4c5),
                      child: SvgPicture.asset(
                        widget.listCard[_index].icon ?? widget.icon,
                        width: Sz.i.s27,
                        height: Sz.i.s27,
                      ),
                    ),
                    const SpacingBox(h: 24),
                    Center(
                      child: Text(
                        widget.listCard[_index].nameCard ?? widget.title,
                        style: ptBodyLargeBold(context).copyWith(
                            fontSize: Sz.i.s28, color: getColor(context).black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SpacingBox(h: 16),
                    Text(
                      widget.listCard[_index].descriptionCard ??
                          widget.subtitle,
                      style: ptBodyLargeThin(context)
                          .copyWith(fontSize: Sz.i.s17, height: 1.41),
                      textAlign: TextAlign.center,
                    ),
                    const SpacingBox(h: 24),
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return _buildItem(
                    context,
                    index: index,
                    onTap: () => widget.onTap?.call(),
                    cardDetail: widget.listCard[index],
                    lastIndex: widget.listCard.length - 1,
                  );
                },
                itemCount: widget.listCard.length,
              ),
              const SpacingBox(h: 24),
              if (!widget.noButton) ...[
                Padding(
                  padding: EdgeInsets.all(Sz.i.s24),
                  child: Column(
                    children: [
                      AppExpandButton.primary(
                        onTap: () {
                          _index == 0
                              ? _onCall()
                              : _index == 1
                                  ? _index = 3
                                  : _index == 2
                                      ? {
                                          navigateTo(
                                            const DeliveryScreen(),
                                          )
                                        }
                                      : _onCall();
                          setState(() {});
                        },
                        label: _index == 0
                            ? S.current.callToCourier
                            : _index == 1
                                ? S.current.openChat
                                : _index == 2
                                    ? S.current.provideDetailsForDelivery
                                    : S.current.callToCourier,
                        enabled: true,
                        forceUppercase: false,
                      ),
                      if (_index == 0 || _index == 3)
                        Column(
                          children: [
                            const SpacingBox(h: 16),
                            AppExpandButton.primary(
                              onTap: () {
                                final Uri smsLaunchUri = Uri(
                                  scheme: 'sms',
                                  path: '0385140807',
                                  queryParameters: <String, String>{
                                    'body': Uri.encodeComponent(
                                        'Hello there! I am interested in your product. Could you please provide me with more details?'),
                                  },
                                );
                                _index = 3;
                                setState(() {});
                                launchUrl(smsLaunchUri);
                              },
                              label: S.current.openChat,
                              enabled: true,
                              forceUppercase: false,
                              backgroundTransparent: true,
                              textColor: getColor(context).black,
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ],
              widget.widget ?? const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context,
      {required int index,
      required CardDetail cardDetail,
      required int lastIndex,
      required VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Sz.i.s24, vertical: Sz.i.s16)
                    .copyWith(top: Sz.i.s8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Sz.i.s8),
                        color: index <= _index
                            ? getColor(context).primaryLightActive
                            : getColor(context).iconGray,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Sz.i.s8, vertical: Sz.i.s1),
                        child: Text(
                          '${index + 1}',
                          style: pt17SFProText(context).copyWith(
                            color: index <= _index
                                ? getColor(context).white
                                : getColor(context).textActive,
                          ),
                        ),
                      ),
                    ),
                    const SpacingBox(w: 16),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cardDetail.title,
                          style: ptBodyLargeBold(context).copyWith(
                              fontSize: Sz.i.s16,
                              color: getColor(context).black),
                        ),
                        const SpacingBox(h: 8),
                        if (index == _index && cardDetail.description != null)
                          Text(
                            cardDetail.description!,
                            style: ptBodyLargeThin(context).copyWith(
                                fontSize: Sz.i.s14,
                                height: 1.7143,
                                color: getColor(context).gray3),
                          ),
                      ],
                    ))
                  ],
                ),
                if (!widget.noButton)
                  if ((index == 0 || index == 3) &&
                      index == _index &&
                      cardDetail.description != null)
                    CuarCodeHero(
                      photo: Images.cuarcode,
                      onTap: () {
                        navigateTo(const FullScrennCuarCode());
                        _index = 1;
                        setState(() {});
                        print(_index);
                      },
                      width: deviceWidth(context),
                    )
              ],
            ),
          ),
          index != lastIndex
              ? Padding(
                  padding: EdgeInsets.only(left: Sz.i.s36, bottom: Sz.i.s8),
                  child: SizedBox(
                    height:
                        cardDetail.description != null ? Sz.i.s32 : Sz.i.s16,
                    child: VerticalDivider(
                      width: Sz.i.s1,
                      thickness: Sz.i.s1,
                      color: cardDetail.description != null
                          ? getColor(context).gray3
                          : getColor(context).textActive,
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
