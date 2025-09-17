import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

/// Конвертируем число в дату
String conversionToDate(int date) {
  DateTime dateFromInt = DateTime.fromMillisecondsSinceEpoch(date);
  String formattedDate = DateFormat('dd.MM.yy').format(dateFromInt);
  return formattedDate.toString();
}

DateTime dateFromString(String dateString) {
  final DateFormat formatter = DateFormat('dd.MM.yy');
  try {
    final DateTime date = formatter.parse(dateString);
    return date;
  } catch (e) {
    // Обработка ошибок, например, если формат неправильный
    print('Ошибка парсинга даты: $e');
    return DateTime.now(); // или выбросить исключение
  }
}

int conversionToMilliseconds(String dateString) {
  final DateTime date = dateFromString(dateString);
  return date.millisecondsSinceEpoch;
}

DataColumn2 customDataColumn(
    title, TextAlign textAlign, double? fontSize, double? width, {int?maxLine}) {
  return DataColumn2(
    label: SizedBox(
      width: double.infinity,
      child: Text(
        maxLines: maxLine,
        title,
        textAlign: textAlign,
        style: TextStyle(
          overflow: TextOverflow.ellipsis,
          fontSize: fontSize,
        ),
      ),
    ),
    fixedWidth: width,
    // columnWidth: CustomColumnWidth(40.0, 20.0),
    // fixedWidth: 120,
  );
}

DataColumn2 customDataColumnFunc(
    title, TextAlign textAlign, double? fontSize, double? width, func) {
  return DataColumn2(
    label: SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: func,
        child: Text(
          title,
          textAlign: textAlign,
          style: TextStyle(
            overflow: TextOverflow.ellipsis,
            fontSize: fontSize,
          ),
        ),
      ),
    ),
    fixedWidth: width,
    // columnWidth: CustomColumnWidth(40.0, 20.0),
    // fixedWidth: 120,
  );
}

/* Цвет главной кнопка нажатия */
class CustomColorButton extends WidgetStateColor {
  final Color buttonColor;
  final Color onPressColor;
  CustomColorButton(this.buttonColor, this.onPressColor)
      : super(_defaultColor) {
    // this.color = color;
  }

  static final int _defaultColor = 0x11111111;
  // Color get defaultColor => _defaultColor;
  Color get defaultColor => buttonColor;
  // Color defaultColor = color;
  Color get pressedColor => onPressColor;

  @override
  Color resolve(Set<WidgetState> states) {
    if (states.contains(WidgetState.pressed)) {
      return pressedColor;
    }
    return defaultColor;
  }
}

class DoubleTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) return newValue;
    if (RegExp(r'^([1-9][0-9]*)(\.)?([0-9]){0,2}$').hasMatch(newValue.text)) {
      return newValue;
    } else if (RegExp(r'^([0.]){0,2}([0-9]){0,2}$').hasMatch(newValue.text)) {
      if (RegExp(r'^[0](([^0]|[.][0-9][^0]*)?)$').hasMatch(newValue.text)) {
        return newValue;
      }
    }
    return oldValue;
  }
}