import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/icons/icons.dart';
import 'package:pine_app/core/theme/size.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/feature/widget/calendar/src/customization/calendar_style.dart';
import 'package:pine_app/feature/widget/calendar/src/customization/days_of_week_style.dart';
import 'package:pine_app/feature/widget/calendar/src/customization/header_style.dart';
import 'package:pine_app/feature/widget/calendar/src/shared/utils.dart';
import 'package:pine_app/feature/widget/calendar/src/table_calendar.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';
import 'package:pine_app/generated/l10n.dart';

class AppDatePicker extends StatefulWidget {
  final DateTime? initValue;
  final void Function(DateTime) onSelect;
  final DateTime? startDate;
  final DateTime? endDate;
  final bool allowTimeSelect;
  const AppDatePicker(
      {Key? key,
      required this.onSelect,
      this.initValue,
      this.startDate,
      this.endDate,
      this.allowTimeSelect = false})
      : super(key: key);

  @override
  State<AppDatePicker> createState() => _AppDatePickerState();
}

class _AppDatePickerState extends State<AppDatePicker> {
  late DateTime _dateTime;

  @override
  void initState() {
    _dateTime = widget.initValue ?? DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final firstDate = widget.startDate?.isAfter(DateTime.now()) == true
        ? widget.startDate!
        : DateTime.now();
    final lastDate =
        widget.endDate ?? DateTime.now().add(const Duration(days: 365));
    final focusDate = _dateTime.isAfter(firstDate)
        ? _dateTime.isAfter(lastDate)
            ? lastDate
            : _dateTime
        : firstDate;

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Sz.i.s13),
            color: getColor(context).white),
        width: deviceWidth(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Sz.i.s16)
                  .copyWith(top: Sz.i.s16),
              child: TableCalendar(
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: pt17SFProText(context).copyWith(
                    fontSize: Sz.i.s13,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff3c3c434d),
                  ),
                  weekendStyle: pt17SFProText(context).copyWith(
                    fontSize: Sz.i.s13,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff3c3c434d),
                  ),
                ),
                daysOfWeekHeight: Sz.i.s18,
                currentDay: widget.startDate,
                firstDay: firstDate,
                lastDay: lastDate,
                focusedDay: focusDate,
                onDaySelected: (date, date2) {
                  setState(() {
                    _dateTime = date;
                    widget.onSelect(_dateTime);
                    print(_dateTime);
                  });
                },
                selectedDayPredicate: (day) => isSameDay(day, _dateTime),
                availableCalendarFormats: {CalendarFormat.month: 'Month'},
                headerStyle: HeaderStyle(
                  leftChevronIcon: SvgPicture.asset(
                    AppIcons.chevronBackward,
                    colorFilter: ColorFilter.mode(
                      getColor(context).primaryLightActive,
                      BlendMode.srcIn,
                    ),
                    width: Sz.i.s10,
                    height: Sz.i.s18,
                  ),
                  rightChevronIcon: SvgPicture.asset(
                    AppIcons.chevronForward,
                    width: Sz.i.s10,
                    height: Sz.i.s18,
                    colorFilter: ColorFilter.mode(
                      getColor(context).primaryLightActive,
                      BlendMode.srcIn,
                    ),
                  ),
                  leftChevronMargin: EdgeInsets.zero,
                  leftChevronPadding: EdgeInsets.zero,
                  rightChevronMargin: EdgeInsets.zero,
                  rightChevronPadding: EdgeInsets.zero,
                  titleTextStyle: pt17SFProText(context).copyWith(
                      color: getColor(context).black,
                      fontWeight: FontWeight.w600),
                ),
                rowHeight: Sz.i.s45,
                calendarStyle: CalendarStyle(
                  cellMargin: EdgeInsets.zero,
                  weekendTextStyle: pt17SFProText(context).copyWith(
                      fontSize: Sz.i.s20, color: getColor(context).black),
                  defaultTextStyle: pt17SFProText(context).copyWith(
                      fontSize: Sz.i.s20, color: getColor(context).black),
                  selectedTextStyle: pt17SFProText(context).copyWith(
                    fontSize: Sz.i.s20,
                    fontWeight: FontWeight.w600,
                  ),
                  todayTextStyle:
                      pt17SFProText(context).copyWith(fontSize: Sz.i.s20),
                  selectedDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        getColor(context).primaryLightActive.withOpacity(0.5),
                  ),
                  todayDecoration: BoxDecoration(
                    color: getColor(context).primaryLightActive,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            const SpacingBox(
              h: 11,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(Sz.i.s16, 0, Sz.i.s16, Sz.i.s16),
              child: Row(
                children: [
                  Text(
                    S.current.time,
                    style: pt17SFProText(context).copyWith(
                        color: getColor(context).black,
                        fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      if (!widget.allowTimeSelect) return;
                      showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(_dateTime),
                      ).then((value) {
                        setState(() {
                          _dateTime = DateTime(
                            _dateTime.year,
                            _dateTime.month,
                            _dateTime.day,
                            value?.hour ?? _dateTime.hour,
                            value?.minute ?? _dateTime.minute,
                          );
                          print(_dateTime);
                          widget.onSelect(_dateTime);
                        });
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: Sz.i.s12, vertical: Sz.i.s6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Sz.i.s8),
                        color: getColor(context).tertiary.withOpacity(0.12),
                      ),
                      child: Center(
                        child: Text(
                          DateFormat('h:mm a').format(_dateTime),
                          style: pt17SFProText(context).copyWith(
                              fontWeight: FontWeight.w400,
                              color: getColor(context).black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
