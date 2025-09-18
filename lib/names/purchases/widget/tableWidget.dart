import 'package:data_table_2/data_table_2.dart';
import 'package:fastfood/data_class/purchases_data.dart';
import 'package:fastfood/global_function.dart';
import 'package:fastfood/names/purchases/bloc/purchases_bloc.dart';
import 'package:fastfood/widgetMetod.dart' hide customDataColumn;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:string_capitalize/string_capitalize.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({
    super.key,
    required this.lineBorderColor,
    required this.invertColor,
  });

  final Color lineBorderColor;
  final Color invertColor;

  @override
  Widget build(BuildContext context) {
    final Color invertColor = Theme.of(context).colorScheme.onSecondary;
    // final bloc = context.read<PurchasesCubit>();
    return Padding(
      padding: const EdgeInsets.only(
        top: 30.0,
        // left: 8.0,
        // right: 8.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          border: Border.all(color: lineBorderColor),
        ),
        // width: 1000,
        height: 400,
        child: BlocBuilder<PurchasesBloc, PurchasesState>(
          builder: (context, state) {
            return DataTable2(
              // isVerticalScrollBarVisible: true,
              // isHorizontalScrollBarVisible: true,
              headingTextStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
              dataTextStyle: TextStyle(
                color: invertColor,
                fontWeight: FontWeight.w500,
                // fontSize: 25,
              ),
              // border: TableBorder.all(
              //     // color: Colors.grey,
              //     // borderRadius: BorderRadius.only(
              //     //     bottomLeft: Radius.circular(20),
              //     //     bottomRight: Radius.circular(20))
              //     ),
              headingRowColor: WidgetStateProperty.all(Colors.blueGrey),
              headingRowHeight: 45,
              dataRowHeight: 40,
              columns: [
                // customDataColumn('Цена в с.', TextAlign.center, 15, 140),
                customDataColumn('№', TextAlign.center, null, 50),
                customDataColumn('Название', TextAlign.center, null, null),
                customDataColumn('Цена зак.', TextAlign.center, 15, 140),
                customDataColumn('Кол', TextAlign.center, 13, 110),
                customDataColumn('Измер.', TextAlign.center, 13, 90),
                customDataColumn('Сумма', TextAlign.center, 17, 140),
                customDataColumn('Удалить', TextAlign.center, 13, 100),
                // customDataColumn('Штрих-код', TextAlign.center, null, 160),
              ], // 7
              rows: _createRows(
                state.purchasesList,
                context,
                context.read<PurchasesBloc>(),
                invertColor,
              ),
            );
          },
        ),
      ),
    );
  }

  /* Функция для создание строк */
  List<DataRow> _createRows(
    List<PurchasesData> dataClass,
    context,
    bloc,
    colorText,
  ) {
    // final bloc = context.read<PurchasesCubit>();
    List<DataRow> dataR = [];
    // int number = 0;

    for (PurchasesData i in dataClass) {
      // double sum = i.priceOfSom! * i.quantity!.toDouble();
      // number++;
      List<DataCell> dataC = [
        /// Num
        DataCell(Text((dataClass.indexOf(i) + 1).toString())),

        /// Название
        DataCell(textCell(i.product, TextAlign.center)),

        /// Цена в закупки
        DataCell(
          textCell(
            i.priceOfPurchases.toString(),
            TextAlign.center,
            separator: true,
            maxLine: 1,
          ),
        ),
        // DataCell(
        //   textFieldCellWithReg(
        //     context,
        //     i.priceOfPurchases.toString(),
        //     TextAlign.center,
        //     (newPurchases) {
        //       double parsedPurchases;

        //       try {
        //         parsedPurchases = double.parse(newPurchases);
        //         bloc.add(
        //           UpdatePurchasesFromList(
        //             data: i,
        //             newData: i.copyWith(priceOfPurchases: parsedPurchases),
        //           ),
        //         );
        //         Navigator.pop(context);
        //       } catch (e) {
        //         print('Не корректное число!');
        //         // emit(state.copyWith(errorTitle: 'Некорректное числовое значение!'));
        //         return;
        //       }
        //     },
        //     // (title) {
        //     // bloc.updatePurchasesList(
        //     //     i, i.copyWith(priceOfPurchases: double.parse(title)));
        //     // Navigator.pop(context);
        //     // }
        //     DoubleTextInputFormatter(),
        //     1,
        //     colorText,
        //     separator: true,
        //   ),
        // ),

        /// Количество
        DataCell(
          textCell(
            i.quantity.toString(),
            TextAlign.center,
            separator: true,
            maxLine: 1,
          ),
        ),

        /// Измеритель
        DataCell(
          textCell(
            i.measuring ?? 'шт',
            TextAlign.center,
            separator: true,
            maxLine: 1,
          ),
        ),
        // DataCell(
        //   textFieldCellWithReg(
        //     context,
        //     i.quantity.toString(),
        //     TextAlign.center,
        //     (title) {
        //       // bloc.updatePurchasesList(i, i.copyWith(quantity: int.parse(title)));
        //       // Navigator.pop(context);
        //     },
        //     FilteringTextInputFormatter.allow(RegExp(r'\b[1-9][0-9]{0,4}')),
        //     1,
        //     colorText,
        //     separator: true,
        //   ),
        // ),

        /// Сумма
        DataCell(
          textCell(
            (i.priceOfPurchases! * i.quantity!.toDouble()).toString(),
            TextAlign.center,
            separator: true,
            maxLine: 1,
          ),
        ),

        /// Удалить
        DataCell(
          deleteCell(
            context,
            i.product,
            // () {},
            () => bloc.add(RemoveFromList(data: i)),
            // () => bloc.removePurchasesList(i)
          ),
        ),
        // /// Штрих-код
        // DataCell(textCell((i.barcode ?? ''), TextAlign.center)),
      ];
      dataR.add(DataRow(cells: dataC));
    }
    return dataR;
  }
}
