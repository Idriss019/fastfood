import 'package:data_table_2/data_table_2.dart';
import 'package:fastfood/theme.dart';
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
  String title,
  TextAlign textAlign,
  double? fontSize,
  double? width, {
  int? maxLine,
  Color? colorText,
}) {
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
          color: colorText,
        ),
      ),
    ),
    fixedWidth: width,
    // columnWidth: CustomColumnWidth(40.0, 20.0),
    // fixedWidth: 120,
  );
}

DataColumn2 customDataColumnFunc(
  title,
  TextAlign textAlign,
  double? fontSize,
  double? width,
  func,
) {
  return DataColumn2(
    label: SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: func,
        child: Text(
          title,
          textAlign: textAlign,
          style: TextStyle(overflow: TextOverflow.ellipsis, fontSize: fontSize),
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

class DoubleTextInputFormatter2 extends TextInputFormatter {
  /* в начале ноль то за ней можно только точку иначе можно все числа. в итоге если введена точка то за ней можно только два числа  0.12, 5.12*/
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;

    // разрешаем очистку поля
    if (text.isEmpty) return newValue;

    final regExp = RegExp(
      r'^(0(\.[0-9]{0,2})?|[1-9][0-9]*(\.[0-9]{0,2})?)$',
    );

    // если соответствует — принимаем
    if (regExp.hasMatch(text)) {
      return newValue;
    }

    // ❌ если не соответствует — удаляем последний введённый символ
    return oldValue;
  }
}

void showDialogOk(BuildContext context, String message, Function func) {
  final myColor = CustomTheme(context: context);
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            // print('----');
            func();
            // print('***');
            Navigator.pop(context);
          },
          child: Text('да', style: TextStyle(color: myColor.colorText)),
        ),
      ],
    ),
  );
}

Future<void> showDialogYesNo(
  BuildContext context,
  String message,
  Function func,
) async {
  final myColor = CustomTheme(context: context);
  await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: Text(message),
      actions: [
        // Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        //   /*  кнопка принятия */
        //   TextButton(
        //     onPressed: () async {
        //       // await func(title);
        //     },
        //     child: Text(
        //       'OK',
        //       style: TextStyle(color: myColor.colorText),
        //     ),
        //   ),
        //   /* кнопка отмены */
        //   TextButton(
        //     onPressed: () => Navigator.pop(context),
        //     child: Text(
        //       'Cancel',
        //       style: TextStyle(color: myColor.colorText),
        //     ),
        //   ),
        // ])
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                func();
                Navigator.pop(context);
              },
              child: Text('да', style: TextStyle(color: myColor.colorText)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('нет', style: TextStyle(color: myColor.colorText)),
            ),
          ],
        ),
      ],
    ),
  );
}

// Преобразование цвета в int вручную, используя компоненты ARGB
int convertColorToIntManually1(Color color) {
  return ((color.a * 255).toInt() << 24) |
      ((color.r * 255).toInt() << 16) |
      ((color.g * 255).toInt() << 8) |
      (color.b * 255).toInt();
}
