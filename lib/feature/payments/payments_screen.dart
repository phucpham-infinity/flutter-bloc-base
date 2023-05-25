import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/icons/icons.dart';
import 'package:pine_app/core/theme/size.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/core/util/navigation_utils.dart';
import 'package:pine_app/feature/payments/creat_invoice_screen.dart';
import 'package:pine_app/feature/widget/container/frosted_container.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';
import 'package:pine_app/feature/widget/scaffold/base_gradient_scaffold.dart';
import 'package:pine_app/generated/l10n.dart';

import 'create_transfer_screen.dart';

class PaymentsScreen extends StatefulWidget {
  const PaymentsScreen({super.key});

  @override
  State<PaymentsScreen> createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  final List<Item> _listItem = [
    Item(S.current.pendingTransactionsn,
        S.current.monitorTransactionsInProgress),
    Item(S.current.pendingInvoices, S.current.reviewInvoicesIssuedToYou),
  ];
  @override
  Widget build(BuildContext context) {
    return BaseGradientScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: Sz.i.s10, horizontal: Sz.i.s24),
                child: Text(
                  S.current.payments,
                  style: ptTitle4(context).copyWith(
                    fontSize: Sz.i.s24,
                    color: getColor(context).white,
                  ),
                ),
              ),
              const SpacingBox(h: 21),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
                child: Column(
                  children: [
                    _buildCard(
                      context,
                      onTap: () {
                        navigateTo(CreatInvoiceScreen());
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Spacer(),
                              SvgPicture.asset(
                                AppIcons.arrowUpRight,
                                width: Sz.i.s24,
                                height: Sz.i.s24,
                              ),
                            ],
                          ),
                          const SpacingBox(h: 68),
                          Text(
                            S.current.creatInvoice,
                            style: ptBodyLargeBold(context).copyWith(
                              fontSize: Sz.i.s20,
                              color: getColor(context).black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SpacingBox(h: 16),
                    _buildCard(
                      context,
                      bgColor: getColor(context).white.withOpacity(0.5),
                      onTap: () {
                        navigateTo(CreateTransferScreen());
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: Sz.i.s10),
                            child: SvgPicture.asset(
                              AppIcons.arrowUpRight,
                              width: Sz.i.s24,
                              height: Sz.i.s24,
                            ),
                          ),
                          Text(
                            S.current.newTransfer,
                            style: ptBodyLargeBold(context).copyWith(
                              fontSize: Sz.i.s20,
                              color: getColor(context).black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SpacingBox(h: 24),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) =>
                          const SpacingBox(h: 16),
                      itemBuilder: (context, index) {
                        return _buildItem(context, item: _listItem[index]);
                      },
                      itemCount: _listItem.length,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, {required Item item}) {
    return FrostedContainer(
        padding: EdgeInsets.all(Sz.i.s24),
        border: Border.all(color: getColor(context).white.withOpacity(0.1)),
        boxShadow: const [BoxShadow(color: Colors.transparent)],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.title,
              style: ptBodyLargeBold(context).copyWith(fontSize: Sz.i.s20),
            ),
            const SpacingBox(h: 16),
            Text(
              item.sub,
              style: ptBodyLargeThin(context).copyWith(
                  fontSize: Sz.i.s15,
                  height: 1.3333,
                  color: getColor(context).white),
            ),
          ],
        ));
  }

  Widget _buildCard(
    BuildContext context, {
    void Function()? onTap,
    Widget? child,
    Color? bgColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: deviceWidth(context),
          padding: EdgeInsets.all(Sz.i.s24),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Sz.i.s20),
              color: bgColor ?? getColor(context).white),
          child: child),
    );
  }
}

class Item {
  final String title;
  final String sub;

  Item(this.title, this.sub);
}
