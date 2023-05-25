import 'package:flutter/material.dart';
import 'package:pine_app/core/model/operations.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/icons/icons.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/feature/home/account_detail/widget/list_filter.dart';
import 'package:pine_app/feature/home/account_detail/widget/operations_bottom_sheet.dart';
import 'package:pine_app/feature/widget/button/icon_button.dart';
import 'package:pine_app/feature/widget/date_picker/app_date_picker.dart';
import 'package:pine_app/feature/widget/date_time/date_time.dart';
import 'package:pine_app/feature/widget/popup/show_date_picker.dart';
import 'package:pine_app/feature/widget/popup/show_sheet.dart';
import 'package:pine_app/feature/widget/scaffold/base_gradient_scaffold.dart';

import '../../../core/theme/size.dart';
import '../../../generated/l10n.dart';
import '../../widget/button/back_button.dart';
import '../../widget/button/round_button.dart';
import '../../widget/container/spacing_box.dart';

class HistoryAccountDetailScreen extends StatefulWidget {
  const HistoryAccountDetailScreen({super.key});

  @override
  State<HistoryAccountDetailScreen> createState() =>
      _HistoryAccountDetailScreenState();
}

class _HistoryAccountDetailScreenState
    extends State<HistoryAccountDetailScreen> {
  List<String> filters = [
    S.current.filter,
    S.current.refillsCount('0'),
    S.current.spendingCount('0')
  ];

  bool _hasData = true;

  bool isFilter() {
    return _refills.any((element) => element.status == true) ||
        _spending.any((element) => element.status == true);
  }

  String getSelected(
      int index, List<Operations> list, String Function(String) text) {
    if (list.any((element) => element.status == false)) {
      final List<int> indexes =
          list.where((op) => op.status).map((op) => list.indexOf(op)).toList();

      String listSelected = '';
      for (int i = 0; i < indexes.length; i++) {
        listSelected += (indexes[i] + 1).toString();
      }
      return text(listSelected);
    } else {
      return filters[index];
    }
  }

  void onRemoveFilter() {
    filters[0] = S.current.filter;

    setState(() {
      _spending = _spending
          .map((op) => Operations(name: op.name, status: true))
          .toList();
      _refills = _refills
          .map((op) => Operations(name: op.name, status: true))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    onRemoveFilter();
  }

  @override
  Widget build(BuildContext context) {
    return BaseGradientScaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: Sz.i.s8),
              child: Row(
                children: [
                  const BuildBackButton(),
                  Text(
                    'Company 12345',
                    style: ptBodyLargeThin(context).copyWith(
                        fontSize: Sz.i.s14, color: getColor(context).white),
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.fromLTRB(Sz.i.s24, Sz.i.s15, Sz.i.s16, Sz.i.s16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        S.current.operationsIn,
                        style: ptBodyLargeBold(context)
                            .copyWith(fontSize: Sz.i.s20),
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
                    ],
                  ),
                  BuildIconButton(
                      icon: AppIcons.search,
                      onTap: () {
                        onRemoveFilter();
                        _showOperations();
                      })
                ],
              ),
            ),
            Container(
              height: Sz.i.s52,
              padding: EdgeInsets.symmetric(vertical: Sz.i.s8),
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(left: Sz.i.s24),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => RoundButton(
                  textStyle:
                      ptBodyLargeThin(context).copyWith(fontSize: Sz.i.s14),
                  padding: EdgeInsets.symmetric(
                      horizontal: Sz.i.s12, vertical: Sz.i.s6),
                  borderRadius: Sz.i.s20,
                  text: index == 1
                      ? getSelected(index, _refills, (value) {
                          return S.current.refillsCount(value);
                        })
                      : index == 2
                          ? getSelected(index, _spending, (value) {
                              return S.current.spendingCount(value);
                            })
                          : index == 0 && !isFilter()
                              ? filters[index] = S.current.filterCount('2')
                              : filters[index],
                  selected: false,
                  isCloseButton: index == 0 && !isFilter(),
                  onRemove: index == 0 && !isFilter()
                      ? () {
                          onRemoveFilter();
                        }
                      : null,
                  onTap: () {},
                ),
                separatorBuilder: (context, index) => SpacingBox(w: Sz.i.s8),
                itemCount: filters.length,
              ),
            ),
            Expanded(
              child: !_hasData
                  ? _buildText(context,
                      text: S.current.thereWereNoSurgeriesDuringThisPeriod)
                  : const BuildListFilter(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildText(BuildContext context, {required String text}) {
    return Column(
      children: [
        SpacingBox(h: 181),
        Center(
          child: Text(
            text,
            style: ptBodyLargeThin(context).copyWith(
                fontSize: Sz.i.s17,
                height: 1.4118,
                color: getColor(context).white),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  List<Operations> _spending = [
    Operations(name: S.current.paymentOfFees, status: false),
    Operations(name: S.current.paymentForFines, status: false),
    Operations(name: S.current.paymentOfCounterparties, status: false),
    Operations(name: S.current.payrollPayments, status: false),
    Operations(name: S.current.taxesPayment, status: false),
  ];

  List<Operations> _refills = [
    Operations(name: S.current.translations, status: false),
    Operations(name: S.current.paymentOfContracts, status: false),
  ];

  void _showOperations() {
    showSheet(
      context,
      child: OperationsBottomSheet(
        listSpending: _spending,
        listRefills: _refills,
        onChangedListSpending: (index, status) {
          _spending[index].status = status;

          setState(() {});
        },
        onChangedListRefills: (index, status) {
          setState(() {
            _refills[index].status = status;
          });
        },
      ),
    );
  }
}
