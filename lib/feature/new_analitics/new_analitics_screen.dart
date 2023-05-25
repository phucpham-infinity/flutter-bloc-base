import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/icons/icons.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/feature/new_analitics/bloc/analytics_provider.dart';
import 'package:pine_app/feature/new_analitics/bloc/analytics_state.dart';
import 'package:pine_app/feature/widget/button/back_button.dart';
import 'package:pine_app/feature/widget/button/icon_button.dart';
import 'package:pine_app/feature/widget/container/frosted_container.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';
import 'package:pine_app/feature/widget/date_picker/app_date_picker.dart';
import 'package:pine_app/feature/widget/date_time/date_time.dart';
import 'package:pine_app/feature/widget/popup/feature_under_development.dart';
import 'package:pine_app/feature/widget/popup/show_date_picker.dart';
import 'package:pine_app/feature/widget/scaffold/base_gradient_scaffold.dart';

import '../../../core/theme/size.dart';
import '../../../generated/l10n.dart';

class NewAnaliticsScreen extends ConsumerStatefulWidget {
  const NewAnaliticsScreen({super.key});

  @override
  _NewAnaliticsScreenState createState() => _NewAnaliticsScreenState();
}

class _NewAnaliticsScreenState extends ConsumerState<NewAnaliticsScreen> {
  List<ItemMonthlySpendings> _listItemMonthlySpending = [];

  final getAnalyticsSummary = FutureProvider((ref) {
    return ref
        .watch(analyticsProvider.notifier)
        .getAnalyticsSummary(startDate: '1', endDate: '2');
  });

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref
          .read(analyticsProvider.notifier)
          .getAnalyticsSummary(startDate: 'startDate', endDate: 'aaa');
    });

    _listItemMonthlySpending = [
      ItemMonthlySpendings(
        icon: _buildIcon(
            bgColor: const Color(0xff86ABBB), icon: AppIcons.calendarClock),
        value: '1 345 AED',
        description: S.current.invoicePayments,
        bgColor: const Color(0xffA6BCD1),
      ),
      ItemMonthlySpendings(
        icon:
            _buildIcon(bgColor: const Color(0xff629799), icon: AppIcons.users),
        value: '1 345 AED',
        description: S.current.payrollTransfers,
        bgColor: const Color(0xff9BCCC9),
      ),
      ItemMonthlySpendings(
        icon: _buildIcon(
            bgColor: const Color(0xff9FA877), icon: AppIcons.mainComponent),
        value: '1 345 AED',
        description: S.current.servicePayments,
        bgColor: const Color(0xffc2cb9b),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(analyticsProvider);

    ref.listen(
      analyticsProvider,
      ((AnalyticsState? previous, AnalyticsState next) {
        print('========>>>>>>> NEXT $next');
        if (next.status == AnalyticsStatus.failure) {
          if (next.message.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message.toString()),
            ));
          }
        }
        if (next.status == AnalyticsStatus.loaded) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Load done!"),
          ));
        }
        if (next.status == AnalyticsStatus.loading) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("=========== Loading =============!"),
          ));
        }
      }),
    );

    return BaseGradientScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: Sz.i.s24)
                    .copyWith(top: Sz.i.s8, left: Sz.i.s8),
                child: Row(
                  children: [
                    const BuildBackButton(),
                    Text(
                      'Company 12345',
                      style: ptBodyLargeThin(context).copyWith(
                          fontSize: Sz.i.s14, color: getColor(context).white),
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: Sz.i.s24),
                      child: GestureDetector(
                        onTap: () => showFeatureUnderDevelopment(context),
                        child: SvgPicture.asset(
                          AppIcons.menu,
                          width: Sz.i.s36,
                          height: Sz.i.s36,
                          colorFilter: ColorFilter.mode(
                              getColor(context).white, BlendMode.srcIn),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(Sz.i.s24).copyWith(top: Sz.i.s8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${S.current.overviewFor} ',
                      style:
                          ptBodyLargeBold(context).copyWith(fontSize: Sz.i.s20),
                    ),
                    GestureDetector(
                      onTap: () {
                        showAppDatePicker(context,
                            child: AppDatePicker(
                              onSelect: (dateTime) {
                                // _deliveryDay = dateTime.MMddYYYY();
                                setState(() {});
                              },
                              initValue: DateTime(DateTime.now().year,
                                  toMonthNumber('December'), 1),
                            ));
                      },
                      child: Text(
                        'December',
                        style: ptBodyLargeBold(context).copyWith(
                            fontSize: Sz.i.s20,
                            color: getColor(context).accentLinks),
                      ),
                    ),
                    Spacer(),
                    BuildIconButton(
                        icon: AppIcons.search,
                        onTap: () {
                          showFeatureUnderDevelopment(context);
                        })
                  ],
                ),
              ),
              const SpacingBox(h: 7),
              Padding(
                padding: EdgeInsets.all(Sz.i.s24).copyWith(top: 0),
                child: FrostedContainer(
                  boxShadow: const [],
                  radius: Sz.i.s20,
                  bgColor: getColor(context).white.withOpacity(0.15),
                  padding: EdgeInsets.symmetric(vertical: Sz.i.s24),
                  child: Column(
                    children: [
                      Text(
                        S.current.yourAvailableBalance,
                        style: ptBodyLargeThin(context).copyWith(
                            fontSize: Sz.i.s17,
                            height: 1.4118,
                            color: getColor(context).white),
                      ),
                      const SpacingBox(h: 8),
                      Text(
                        'AED 5 678',
                        style: pt32Poppins(context),
                      ),
                      const SpacingBox(h: 16),
                      Row(
                        children: [
                          const Spacer(flex: 2),
                          _buildItemYourAvailable(
                            context,
                            icon: AppIcons.arrowUpSm,
                            label: '+ 2 345',
                          ),
                          const Spacer(),
                          _buildItemYourAvailable(
                            context,
                            icon: AppIcons.arrowDownSm,
                            label: '- 1 234',
                          ),
                          const Spacer(flex: 2),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SpacingBox(h: 7),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(Sz.i.s24).copyWith(top: Sz.i.s8),
                    child: Text(
                      S.current.monthlyExpenses,
                      style: ptBodyLargeBold(context).copyWith(
                        fontSize: Sz.i.s20,
                      ),
                    ),
                  ),
                  const SpacingBox(h: 7),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final item = _listItemMonthlySpending[index];
                      return _buildItemMonthlySpendings(context,
                          bgColor: item.bgColor,
                          icon: item.icon,
                          value: item.value,
                          description: item.description);
                    },
                    itemCount: _listItemMonthlySpending.length,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemMonthlySpendings(BuildContext context,
      {required Color bgColor,
      required Widget icon,
      required String value,
      required String description}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sz.i.s24, vertical: Sz.i.s20)
          .copyWith(top: Sz.i.s4),
      child: Stack(
        children: [
          Container(
            height: Sz.i.s116,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Sz.i.s20),
              color: getColor(context).black.withOpacity(0.15),
            ),
          ),
          SizedBox(
            width: deviceWidth(context) * 0.512,
            child: FrostedContainer(
                padding: EdgeInsets.all(Sz.i.s16),
                radius: Sz.i.s20,
                boxShadow: const [],
                bgColor: bgColor,
                blur: 0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        icon,
                        const SpacingBox(h: 9),
                        Text(
                          value,
                          style: ptBodyLargeThin(context).copyWith(
                            fontSize: Sz.i.s17,
                            height: 1.4118,
                            color: getColor(context).white,
                          ),
                        ),
                        const SpacingBox(h: 4),
                        Text(
                          description,
                          style: ptBodyLargeThin(context).copyWith(
                              fontSize: Sz.i.s12,
                              color: getColor(context).white),
                        )
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.only(top: Sz.i.s4),
                      child: SvgPicture.asset(
                        AppIcons.arrowUpRight,
                        colorFilter: ColorFilter.mode(
                            getColor(context).white, BlendMode.srcIn),
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }

  Widget _buildItemYourAvailable(BuildContext context,
      {required String icon, required String label}) {
    return Expanded(
      flex: 7,
      child: FrostedContainer(
        bgColor: getColor(context).white,
        padding: EdgeInsets.symmetric(horizontal: Sz.i.s10),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                icon,
                width: Sz.i.s24,
                height: Sz.i.s24,
              ),
              const SpacingBox(w: 5),
              Text(
                label,
                style: ptBodyLargeThin(context)
                    .copyWith(fontSize: Sz.i.s16, height: 1.5),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon({required Color bgColor, required String icon}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sz.i.s10),
        color: bgColor,
      ),
      padding: EdgeInsets.all(Sz.i.s4),
      child: SvgPicture.asset(
        icon,
        width: Sz.i.s24,
        height: Sz.i.s24,
      ),
    );
  }
}

class ItemMonthlySpendings {
  final Widget icon;
  final String value;
  final String description;
  final Color bgColor;

  ItemMonthlySpendings(
      {required this.icon,
      required this.value,
      required this.description,
      required this.bgColor});
}
