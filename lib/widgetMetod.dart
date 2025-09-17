import 'package:data_table_2/data_table_2.dart';
import 'package:fastfood/global_function.dart';
import 'package:fastfood/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:string_capitalize/string_capitalize.dart';
import 'dart:ui';
// import 'package:intl/intl.dart';
// import 'package:vitamin_opt_5/globalFunction.dart';
// import 'package:vitamin_opt_5/theme.dart';

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

SizedBox textCell(String title, TextAlign textAlign,
    {bool separator = false, double? textSize, int? maxLine}) {
  String funcSeparator(String number) {
    if (separator) {
      return digitSeparator(number);
    } else {
      return number;
    }
  }

  return SizedBox(
    width: double.infinity,
    child: Text(funcSeparator(title.capitalizeEach()),
        textAlign: textAlign,
        maxLines: maxLine,
        style: TextStyle(fontSize: textSize)),
  );
}

TextButton textFieldCell(String title, BuildContext context, bloc,
    TextAlign textAlign, Function func, colorText) {
  return TextButton(
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          title.capitalizeEach(),
          textAlign: textAlign,
          style: TextStyle(color: colorText),
        ),
      ),
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              final myColor = CustomTheme(context: context);
              return SingleChildScrollView(
                child: AlertDialog(
                    title: TextField(
                      onChanged: (value) => title = value,
                      controller: TextEditingController.fromValue(
                        TextEditingValue(text: title),
                      )..selection =
                          TextSelection.collapsed(offset: title.length),
                    ),
                    actions: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /*  кнопка принятия */
                            TextButton(
                              onPressed: () {
                                func(title);
                                // Navigator.pop(context);
                              },
                              child: Text(
                                'OK',
                                style: TextStyle(color: myColor.colorText),
                              ),
                            ),
                            /* кнопка отмены */
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text(
                                'Cancel',
                                style: TextStyle(color: myColor.colorText),
                              ),
                            ),
                          ])
                    ]),
              );
            });
      });
}

SizedBox messageCell(BuildContext context, String title, String message) {
  return SizedBox(
    width: double.infinity,
    child: TextButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              // final myColor = CustomTheme(context: context);
              return AlertDialog(title: Text(message), actions: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /*  кнопка принятия */
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'OK',
                          style: TextStyle(
                              color: CustomTheme(context: context).colorText),
                        ),
                      ),
                      // /* кнопка отмены */
                      // TextButton(
                      //   onPressed: () => Navigator.pop(context),
                      //   child: Text(
                      //     'Cancel',
                      //     style: TextStyle(color: myColor.colorText),
                      //   ),
                      // ),
                    ])
              ]);
            });
      },
      child: Text(
        title,
        style: TextStyle(color: CustomTheme(context: context).colorText),
      ),
    ),
  );
}

SizedBox deleteCell(BuildContext context, String title, Function func) {
  return SizedBox(
    width: double.infinity,
    child: IconButton(
      icon: Icon(Icons.delete),
      alignment: Alignment.center,
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              final myColor = CustomTheme(context: context);
              return AlertDialog(
                  title: Text(
                      'Уверены что хотите удалить - \n${title.capitalizeEach()} ?'),
                  actions: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /*  кнопка принятия */
                          TextButton(
                            onPressed: () {
                              func();
                              Navigator.pop(context);
                            },
                            child: Text(
                              'OK',
                              style: TextStyle(color: myColor.colorText),
                            ),
                          ),
                          /* кнопка отмены */
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              'Cancel',
                              style: TextStyle(color: myColor.colorText),
                            ),
                          ),
                        ])
                  ]);
            });
      },
    ),
  );
}

SizedBox funcCell(BuildContext context, String title, TextAlign textAlign,Function func,
    {double? textSize}) {
  return SizedBox(
    width: double.infinity,
    child: TextButton(
      onPressed: () {
        func();
      },
      child: Text(
        textAlign:textAlign,
        title,
        style: TextStyle(color: CustomTheme(context: context).colorText,
        fontSize: textSize),
      ),
    ),
  );
}

IconButton updateCell(BuildContext context, String title, Function func) {
  return IconButton(
    icon: Icon(Icons.create),
    onPressed: () {
      showDialog(
          context: context,
          builder: (context) {
            final myColor = CustomTheme(context: context);
            return AlertDialog(
                title: Text(
                    'Уверены что хотите изменить? - \n${title.capitalizeEach()} ?'),
                actions: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /*  кнопка принятия */
                        TextButton(
                          onPressed: () {
                            func();
                            Navigator.pop(context);
                          },
                          child: Text(
                            'OK',
                            style: TextStyle(color: myColor.colorText),
                          ),
                        ),
                        /* кнопка отмены */
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            'Cancel',
                            style: TextStyle(color: myColor.colorText),
                          ),
                        ),
                      ])
                ]);
          });
    },
  );
}

TextButton textFieldCellWithReg(
  BuildContext context,
  String title,
  // bloc,
  TextAlign textAlign,
  Function func,
  TextInputFormatter? formatInput,
  int? maxLine,
  Color colorText, {
  bool separator = false,
  double? textSize,
}) {
  String funcSeparator(String number) {
    if (separator) {
      return digitSeparator(number);
    } else {
      return number;
    }
  }

  return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          funcSeparator(title.capitalizeEach()),
          textAlign: textAlign,
          maxLines: maxLine ?? 1,
          style: TextStyle(color: colorText, fontSize: textSize),
        ),
      ),
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              final myColor = CustomTheme(context: context);
              return SingleChildScrollView(
                child: AlertDialog(
                    title: TextField(
                      onChanged: (value) => title = value,
                      controller: TextEditingController.fromValue(
                        TextEditingValue(text: title),
                      )..selection =
                          TextSelection.collapsed(offset: title.length),
                      inputFormatters:
                          formatInput != null ? [formatInput] : null,
                    ),
                    actions: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /*  кнопка принятия */
                            TextButton(
                              onPressed: () async {
                                await func(title);
                                //  Navigator.pop(context);
                              },
                              child: Text(
                                'OK',
                                style: TextStyle(color: myColor.colorText),
                              ),
                            ),
                            /* кнопка отмены */
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text(
                                'Cancel',
                                style: TextStyle(color: myColor.colorText),
                              ),
                            ),
                          ])
                    ]),
              );
            });
      });
}
TextButton textFieldDateCellWithReg(
  BuildContext context,
  final TextEditingController controller,
  String title,
  TextAlign textAlign,
  Function func,
  int? maxLine,
  Color colorText, {
  bool separator = false,
  double? textSize,
}) {
  String funcSeparator(String number) {
    if (separator) {
      return digitSeparator(number);
    } else {
      return number;
    }
  }

  return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          funcSeparator(title.capitalizeEach()),
          textAlign: textAlign,
          maxLines: maxLine ?? 1,
          style: TextStyle(color: colorText, fontSize: textSize),
        ),
      ),
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              final myColor = CustomTheme(context: context);
              return SingleChildScrollView(
                child: AlertDialog(
                    title: TextField(
                      onChanged: (value) => title = value,
                      controller: TextEditingController.fromValue(
                        TextEditingValue(text: title),
                      )..selection =
                          TextSelection.collapsed(offset: title.length),
                    ),
                    actions: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /*  кнопка принятия */
                            TextButton(
                              onPressed: () async {
                                await func(conversionToMilliseconds(title));
                                //  Navigator.pop(context);
                              },
                              child: Text(
                                'OK',
                                style: TextStyle(color: myColor.colorText),
                              ),
                            ),
                            /* кнопка отмены */
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text(
                                'Cancel',
                                style: TextStyle(color: myColor.colorText),
                              ),
                            ),
                          ])
                    ]),
              );
            });
      });
}

TextButton textFieldCellWithReg2(
  String title,
  BuildContext context,
  bloc,
  TextAlign textAlign,
  Function func,
  TextInputFormatter? formatInput,
  int? maxLine,
  Color colorText, {
  bool separator = false,
}) {
  String funcSeparator(String number) {
    if (separator) {
      return digitSeparator(number);
    } else {
      return number;
    }
  }

  return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          funcSeparator(title.capitalizeEach()),
          textAlign: textAlign,
          maxLines: maxLine ?? 1,
          style: TextStyle(color: colorText),
        ),
      ),
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              final myColor = CustomTheme(context: context);
              return SingleChildScrollView(
                child: AlertDialog(
                    title: TextField(
                      onChanged: (value) => title = value,
                      controller: TextEditingController.fromValue(
                        TextEditingValue(text: title),
                      )..selection =
                          TextSelection.collapsed(offset: title.length),
                      inputFormatters:
                          formatInput != null ? [formatInput] : null,
                    ),
                    actions: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /*  кнопка принятия */
                            TextButton(
                              onPressed: () async {
                                await func(title);
                              },
                              child: Text(
                                'OK',
                                style: TextStyle(color: myColor.colorText),
                              ),
                            ),
                            /* кнопка отмены */
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text(
                                'Cancel',
                                style: TextStyle(color: myColor.colorText),
                              ),
                            ),
                          ])
                    ]),
              );
            });
      });
}

/* Разделитель разрядов */
String digitSeparator(String number, {String separator = ' '}) {
  String result = '';
  String filterNumber = '';
  String remains = '';
  bool point = false;
  for (String i in number.split('')) {
    if (point == false && i != '.') {
      filterNumber += i;
    } else {
      point = true;
      remains += i;
    }
  }
  String reversNumber = filterNumber.split('').reversed.join('');

  int counter = -1;
  for (String i in reversNumber.split('')) {
    counter += 1;
    if (counter > 0 && counter % 3 == 0) {
      result += separator;
    }
    result += i;
  }
  return result.split('').reversed.join('') + remains;
}

/* Кастомное диалоговое окно */
class CustomAlert extends StatelessWidget {
  final String? message;
  final onPress;

  const CustomAlert({super.key, this.message, this.onPress});

  @override
  Widget build(BuildContext context) {
    final myColor = CustomTheme(context: context);
    return
        // PopScope(
        //   onPopInvokedWithResult: (bool didPop, Object? result) async => false,
        //   // child: BackdropFilter(
        //   //   filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        //   child:
        Padding(
      padding: const EdgeInsets.only(top: 48.0),
      child: AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        contentPadding: EdgeInsets.only(left: 40, right: 40, top: 20),
        actionsPadding: EdgeInsets.only(top: 15, bottom: 30),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          ElevatedButton(
            style: ButtonStyle(
              elevation: WidgetStateProperty.all(4),
              padding: WidgetStateProperty.all(
                  EdgeInsets.only(right: 30, left: 30, top: 10, bottom: 10)),
              backgroundColor: WidgetStateProperty.all(Colors.white),
              textStyle: WidgetStateProperty.all(
                const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            onPressed: onPress,
            child: Text(
              "да",
              style: TextStyle(
                  fontSize: 12,
                  letterSpacing: 7,
                  wordSpacing: 5,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
        content: Text(message!,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.black)),
      ),
    );
    // ),
    // );
  }
}

// class CustomAlert extends StatelessWidget {
//   final String? message;
//   final onPress;

//   CustomAlert({this.message, this.onPress});

//   @override
//   Widget build(BuildContext context) {
//     return PopScope(
//       onPopInvokedWithResult: (bool didPop, Object? result) async => false,
//       child: BackdropFilter(
//         filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
//         child: Padding(
//           padding: const EdgeInsets.only(top: 48.0),
//           child: AlertDialog(
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(20.0))),
//             contentPadding: EdgeInsets.only(left: 40, right: 40, top: 20),
//             actionsPadding: EdgeInsets.only(top: 15, bottom: 30),
//             actionsAlignment: MainAxisAlignment.center,
//             actions: [
//               ElevatedButton(
//                 style: ButtonStyle(
//                   elevation: WidgetStateProperty.all(4),
//                   padding: WidgetStateProperty.all(EdgeInsets.only(
//                       right: 30, left: 30, top: 10, bottom: 10)),
//                   backgroundColor: WidgetStateProperty.all(Colors.white),
//                   textStyle: WidgetStateProperty.all(
//                     const TextStyle(
//                         fontSize: 10,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white),
//                   ),
//                 ),
//                 onPressed: onPress,
//                 child: Text(
//                   "да",
//                   style: TextStyle(
//                       fontSize: 12,
//                       letterSpacing: 7,
//                       wordSpacing: 5,
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ],
//             content: Text(message!,
//                 style: TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 16,
//                     color: Colors.black)),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ThousandsSeparatorInputFormatter extends TextInputFormatter {
//   // Setup a formatter that supports both commas for thousands and decimals
//   final formatter = NumberFormat("#,##0.##");

//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     if (newValue.text.isEmpty) {
//       return newValue;
//     }
//     // Remove commas to check the new input and for parsing
//     final newText = newValue.text.replaceAll(',', '');
//     // Try parsing the input as a double
//     final num? newTextAsNum = num.tryParse(newText);

//     if (newTextAsNum == null) {
//       return oldValue; // Return old value if new value is not a number
//     }

//     // Split the input into whole number and decimal parts
//     final parts = newText.split('.');
//     if (parts.length > 1) {
//       // If there's a decimal part, format accordingly
//       final integerPart = int.tryParse(parts[0]) ?? 0;
//       final decimalPart = parts[1];
//       // Handle edge case where decimal part is present but empty (user just typed the dot)
//       final formattedText = '${formatter.format(integerPart)}.$decimalPart';
//       return TextEditingValue(
//         text: formattedText,
//         selection: updateCursorPosition(formattedText),
//       );
//     } else {
//       // No decimal part, format the whole number
//       final newFormattedText = formatter.format(newTextAsNum);
//       return TextEditingValue(
//         text: newFormattedText, //.replaceAll(',', ' '),
//         selection: updateCursorPosition(newFormattedText),
//       );
//     }
//   }

//   TextSelection updateCursorPosition(String text) {
//     return TextSelection.collapsed(offset: text.length);
//   }
// }
