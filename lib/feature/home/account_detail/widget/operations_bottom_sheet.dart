import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pine_app/core/model/operations.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/icons/icons.dart';
import 'package:pine_app/core/theme/size.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/feature/widget/column/column_builder.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';
import 'package:pine_app/generated/l10n.dart';

class OperationsBottomSheet extends StatefulWidget {
  final List<Operations> listSpending;
  final List<Operations> listRefills;
  final Function(int, bool) onChangedListSpending;
  final Function(int, bool) onChangedListRefills;

  const OperationsBottomSheet(
      {super.key,
      required this.listRefills,
      required this.listSpending,
      required this.onChangedListRefills,
      required this.onChangedListSpending});

  @override
  State<OperationsBottomSheet> createState() => _OperationsBottomSheetState();
}

class _OperationsBottomSheetState extends State<OperationsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SpacingBox(h: 40),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
          child: Text(
            S.current.operations,
            style: ptBodyLargeBold(context)
                .copyWith(fontSize: Sz.i.s28, color: getColor(context).black),
          ),
        ),
        const SpacingBox(h: 16),
        _buildItem(context,
            title: S.current.spending,
            operations: widget.listSpending,
            onChanged: widget.onChangedListSpending),
        _buildItem(context,
            title: S.current.refills,
            operations: widget.listRefills,
            onChanged: widget.onChangedListRefills),
        const SpacingBox(h: 40),
      ],
    );
  }

  Widget _buildItem(
    BuildContext context, {
    required String title,
    required List<Operations> operations,
    required Function(int index, bool status) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: Sz.i.s24),
          child: Text(
            title,
            style: ptBodyLargeThin(context).copyWith(
                fontSize: Sz.i.s14,
                height: 1.7143,
                color: getColor(context).textActive.withOpacity(0.6)),
          ),
        ),
        ColumnBuilder(
          data: operations,
          separatorItem: const SpacingBox(h: 0),
          itemBuilder: (index) => InkWell(
            onTap: () {
              setState(() {
                operations[index].status = !operations[index].status;
                onChanged(index, operations[index].status);
              });
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Sz.i.s24, vertical: Sz.i.s16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      operations[index].name,
                      style: ptBodyLargeThin(context).copyWith(
                          fontSize: Sz.i.s17,
                          height: 1.4118,
                          color: const Color(0xff1E1C28)),
                    ),
                  ),
                  if (operations[index].status)
                    SvgPicture.asset(
                      AppIcons.checkboxOn,
                      width: Sz.i.s24,
                      height: Sz.i.s24,
                    )
                  else
                    SvgPicture.asset(
                      AppIcons.checkboxOff,
                      width: Sz.i.s24,
                      height: Sz.i.s24,
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
