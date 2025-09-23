import 'package:fastfood/global_function.dart';
import 'package:fastfood/presentation/purchases/widget/barcodeWidget.dart';
import 'package:fastfood/presentation/purchases/widget/buttonInputWidget.dart';
import 'package:fastfood/presentation/purchases/widget/buttonsBottomWidget.dart';
import 'package:fastfood/presentation/purchases/widget/purchase_price.dart';
import 'package:fastfood/presentation/purchases/widget/productWidget.dart';
import 'package:fastfood/presentation/purchases/widget/sum_purchases_price.dart';
import 'package:fastfood/presentation/purchases/widget/tableWidget.dart';
import 'package:fastfood/navBar.dart';
import 'package:fastfood/theme.dart';
import 'package:flutter/material.dart';

class Purchases extends StatelessWidget {
  const Purchases({super.key});
  final double heightRow = 70;
  final double withSizedBox = 600;

  @override
  Widget build(BuildContext context) {
    final myColor = CustomTheme(context: context);
    final CustomColorButton myButtonColor = CustomColorButton(
      myColor.colorButton,
      myColor.colorTheme,
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Navbar(
        child: Expanded(
          child: Container(
            margin: EdgeInsets.only(top: 15, left: 15, right: 15),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        /* Первая строка */
                        BarcodeWidget(
                          // visibilityError: visibilityError,
                          heightRow: heightRow,
                          withSizedBox: withSizedBox,
                          invertColor: myColor.colorBorder,
                        ),

                        /* Вторая строка */
                        ProductWidget(
                          heightRow: heightRow,
                          invertColor: myColor.colorBorder,
                        ),
                        // ),
                        // /*Третья строка */
                        // QuantityWidget(
                        //     heightRow: heightRow,
                        //     withSizedBox: withSizedBox,
                        //     invertColor: myColor.colorBorder),
                        /*Четвертая строка */
                        PurchasePrice(
                          heightRow: heightRow,
                          withSizedBox: withSizedBox,
                          invertColor: myColor.colorBorder,
                        ),
                        /*Сумма закупа и продажи */
                        SumPurchasePrice(
                          heightRow: heightRow,
                          withSizedBox: withSizedBox,
                          invertColor: myColor.colorBorder,
                        ),
                        /* Кнопка Внести */
                        ButtonInputWidget(
                          heightRow: heightRow,
                          withSizedBox: withSizedBox,
                          myButtonColor: myButtonColor,
                          onPrimaryColor: myColor.white,
                        ),
                        // /* Разделитель */
                        // Padding(
                        //   padding: EdgeInsets.only(top: 10, bottom: 10),
                        //   child: Column(
                        //     children: [
                        //       Padding(
                        //         padding: const EdgeInsets.only(top: 4),
                        //         child: Divider(
                        //           height: 2,
                        //           color: invertColor,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        /* Таблица корзины */
                        TableWidget(
                          lineBorderColor: myColor.colorBorder,
                          invertColor: myColor.colorBorder,
                        ),
                        /* Кнопка очистить */
                        ButtonsBottomWidget(
                          heightRow: heightRow,
                          myButtonColor: myButtonColor,
                          onPrimaryColor: myColor.white,
                        ),
                      ],
                    ),
                  ),
                ),
                // BottomBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
