/* import 'package:azul_football/helpers/constants.dart';
import 'package:flutter/cupertino.dart'; */
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
//import 'package:ligadimayoroficial/values/app_colors.dart';

// ignore: must_be_immutable
class CardCalendarMain extends StatefulWidget {
  final Function onChangeDate;
  final selectedDate;

  CardCalendarMain({required this.onChangeDate, required this.selectedDate});

  @override
  State<CardCalendarMain> createState() => _CardCalendarMainState();
}

class _CardCalendarMainState extends State<CardCalendarMain> {
  List<DateTime> _listDates = [
    //for (int i = 3; i > -4; i--) DateTime.now().subtract(Duration(days: i)),
    DateTime.now().subtract(Duration(days: 3)),
    DateTime.now().subtract(Duration(days: 2)),
    DateTime.now().subtract(Duration(days: 1)),
    DateTime.now().subtract(Duration(days: 0)),
    DateTime.now().subtract(Duration(days: -1)),
    DateTime.now().subtract(Duration(days: -2)),
    DateTime.now().subtract(Duration(days: -3)),
  ];

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  var _selectedDate = DateTime.now().subtract(Duration(days: 0));

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mSize = MediaQuery.of(context);
    String languageCode = Localizations.localeOf(context).languageCode;
/* String dateTime = DateFormat( "dd.MM.yy HH:mm", languageCode).format(this.date); */
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            width: mSize.size.width,
            margin: EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
              color: Colors.transparent, //theme.backgroundColor,
              border: Border.all(color: theme.hintColor.withOpacity(0.15)),
            ),
          ),
        ),
        Container(
          width: mSize.size.width,
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 0; i < _listDates.length; i++)
                _CardDate(
                  date: _listDates[i],
                  isSelected:
                      DateFormat("EE", languageCode).format(_listDates[i]) ==
                          DateFormat("EE", languageCode)
                              .format(widget.selectedDate ?? _selectedDate),

                  /* kFormatDateName(_listDates[i]) ==
                      kFormatDateName(selectedDate ?? _selectedDate), */
                  onTap: () {
                    widget.onChangeDate(_listDates[i]);
                  },
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CardDate extends StatelessWidget {
  final date;
  final onTap;
  final bool isSelected;

  _CardDate({
    this.date,
    this.onTap,
    this.isSelected = false,
  });

/* child: AnimatedContainer(
                  duration: Duration(milliseconds: 2000),
                  curve: Curves.easeOutQuad,
                  width: _width,
                  height: _height,
                  decoration:
                      BoxDecoration(color: _color, borderRadius: _borderRadius),
                ), */

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOutQuad,
        padding: isSelected
            ? EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0)
            : EdgeInsets.all(5.0),
        decoration: isSelected
            ? BoxDecoration(
                color: /* botomMenuColors['menu'] */ Colors.red,
                borderRadius: BorderRadius.circular(10),
              )
            : /* null, */
            BoxDecoration(
                color: /* botomMenuColors['menu'] */ Colors.transparent,
                borderRadius: BorderRadius.circular(0),
              ),
        child: Column(
          children: [
            Text(
              "${int.parse(DateFormat("dd").format(date))}",
              /* '${kFormatDateNumber(date)}', */
              style: isSelected
                  ? theme.textTheme.bodyText1?.copyWith(color: Colors.white)
                  : theme.textTheme.bodyText1?.copyWith(
                      color: Colors.red /* botomMenuColors['menu'] */),
            ),
            Text(
              "${DateFormat("EE").format(date)}",
              //'${kFormatDateName(date)}',
              style: isSelected
                  ? theme.textTheme.bodyText1?.copyWith(color: Colors.white)
                  : theme.textTheme.bodyText1?.copyWith(
                      color: Colors.red /* botomMenuColors['menu'] */),
            ),
          ],
        ),
      ),
    );
  }
}

class CardWidgetCalendar extends StatefulWidget {
  /* CardWidgetCalendar({Key? key}) : super(key: key); */

  @override
  State<CardWidgetCalendar> createState() => _CardWidgetCalendarState();
}

class _CardWidgetCalendarState extends State<CardWidgetCalendar> {
  var _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return CardCalendarMain(
      selectedDate: _selectedDate,
      onChangeDate: (date) {
        setState(() {
          _selectedDate = date;
        });
      },
    );
  }
}
