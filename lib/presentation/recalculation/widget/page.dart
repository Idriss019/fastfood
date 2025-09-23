import 'package:fastfood/global_function.dart';
import 'package:fastfood/presentation/purchases/widget/tableWidget.dart';
import 'package:fastfood/presentation/recalculation/widget/barcode.dart';
import 'package:fastfood/presentation/recalculation/widget/cancelButton.dart';
import 'package:fastfood/presentation/recalculation/widget/header.dart';
import 'package:fastfood/presentation/recalculation/widget/product.dart';
import 'package:fastfood/presentation/recalculation/widget/resetButton.dart';
import 'package:fastfood/presentation/recalculation/widget/search.dart';
import 'package:fastfood/presentation/recalculation/widget/title.dart';
import 'package:fastfood/navBar.dart';
import 'package:fastfood/theme.dart';
import 'package:flutter/material.dart';

class Recalculation extends StatelessWidget {
  const Recalculation({super.key});

  @override
  Widget build(BuildContext context) {
    // final myColor = CustomTheme(context: context);
    const double heightRow = 75;
    final double withSizedBox = 600;
    Color onPrimaryColor = Theme.of(context).colorScheme.onPrimary;
    const Color lineBorderColor = Colors.white;
    Color invertColor = Theme.of(context).colorScheme.onSecondary;
    const Color pressedColor = Colors.green;

    CustomColorButton myButtonColor = CustomColorButton(
      invertColor,
      pressedColor,
    );
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Navbar(
        child: Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 25, right: 25),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(child: Column(children: [
                      /* Заглавие */
                      Header(),
                      // Search2(lineBorderColor: lineBorderColor, heightRow: heightRow, invertColor: invertColor),
                      /* Поиск по */
                      Search(heightRow: heightRow, invertColor: invertColor),
                      /* Штрих код */
                      Barcode(
                          heightRow: heightRow,
                          withSizedBox: withSizedBox,
                          invertColor: invertColor),
                      /* Название */
                      Product(lineBorderColor: lineBorderColor, heightRow: heightRow, invertColor: invertColor),
                      /* Текстовые данные */
                      TitleWidget(heightRow: heightRow),
                      /* Кнопка Отменить */
                      CancelButton(heightRow: heightRow, withSizedBox: withSizedBox, myButtonColor: myButtonColor, onPrimaryColor: onPrimaryColor),
                      /* Таблица */
                      TableWidget(lineBorderColor: lineBorderColor, invertColor: invertColor,),
                      /* Кнопка Сбросить */
                      ResetButton(heightRow: heightRow, withSizedBox: withSizedBox, myButtonColor: myButtonColor, onPrimaryColor: onPrimaryColor),
                    ],
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
