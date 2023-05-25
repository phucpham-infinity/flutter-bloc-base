// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'package:flutter/widgets.dart';

class CalendarPage extends StatelessWidget {
  final Widget Function(BuildContext context, DateTime day)? dowBuilder;
  final Widget Function(BuildContext context, DateTime day) dayBuilder;
  final List<DateTime> visibleDays;
  final Decoration? dowDecoration;
  final Decoration? rowDecoration;
  final TableBorder? tableBorder;
  final bool dowVisible;
  final List<int> weekendDays;

  const CalendarPage(
      {Key? key,
      required this.visibleDays,
      this.dowBuilder,
      required this.dayBuilder,
      this.dowDecoration,
      this.rowDecoration,
      this.tableBorder,
      this.dowVisible = true,
      this.weekendDays = const []})
      : assert(!dowVisible || dowBuilder != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      border: tableBorder,
      columnWidths: {
        0: FlexColumnWidth(_getDayWidth(7)),
        1: FlexColumnWidth(_getDayWidth(1)),
        2: FlexColumnWidth(_getDayWidth(2)),
        3: FlexColumnWidth(_getDayWidth(3)),
        4: FlexColumnWidth(_getDayWidth(4)),
        5: FlexColumnWidth(_getDayWidth(5)),
        6: FlexColumnWidth(_getDayWidth(6)),
      },
      children: [
        if (dowVisible) _buildDaysOfWeek(context),
        ..._buildCalendarDays(context),
      ],
    );
  }

  TableRow _buildDaysOfWeek(BuildContext context) {
    return TableRow(
      decoration: dowDecoration,
      children: List.generate(
        7,
        (index) => dowBuilder!(context, visibleDays[index]),
      ).toList(),
    );
  }

  List<TableRow> _buildCalendarDays(BuildContext context) {
    // final rowAmount = visibleDays.length ~/ 7;
    return List.generate(5, (index) => index * 7).map((index) {
      return TableRow(
        decoration: rowDecoration,
        children: List.generate(
          7,
          (id) => dayBuilder(context, visibleDays[index + id]),
          // growable: false,
        ),
      );
    }).toList();
  }

  double _getDayWidth(int index) {
    final _isWeekDay = weekendDays.contains(index);
    return _isWeekDay ? 1 : 1;
  }
}
