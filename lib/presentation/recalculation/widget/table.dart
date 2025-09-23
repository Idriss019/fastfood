import 'package:data_table_2/data_table_2.dart';
import 'package:fastfood/global_function.dart';
import 'package:fastfood/presentation/recalculation/bloc/recalculation_bloc.dart';
import 'package:fastfood/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({
    super.key,
    required this.lineBorderColor,
    required this.invertColor,
    required this.customColor,
  });

  final Color lineBorderColor;
  final Color invertColor;
  final CustomTheme customColor;

  @override
  Widget build(BuildContext context) {
    RecalculationBloc _bloc = context.read<RecalculationBloc>();
    return Padding(
      padding: const EdgeInsets.only(
        top: 18.0,
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
        child: BlocBuilder<RecalculationBloc, RecalculationState>(
          bloc: _bloc,
          builder: (context, state) {
            return DataTable2(
              // isVerticalScrollBarVisible: true,
              // isHorizontalScrollBarVisible: true,
              headingTextStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
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
              dataRowHeight: 40,
              columns: [
                customDataColumnFunc('Штрих-код', TextAlign.center, 18, 150,
                    () {
                  // _bloc.startListening(sort:'barcode');
                }),
                customDataColumnFunc(
                    'Название', TextAlign.center, null, null, () {
                      // _bloc.startListening(sort:'product');
                    }),
                customDataColumn('Цена в сом', TextAlign.center, 17, 140),
                customDataColumnFunc(
                    'Ост.', TextAlign.center, null, 140, () {
                      // _bloc.startListening(sort:'remainder');
                    }),
                customDataColumnFunc(
                    'Под.', TextAlign.center, null, 140, () {
                      // _bloc.startListening(sort:'found');
                    }),
                customDataColumn('Сбросить', TextAlign.center, 15, 100),
                // DataColumn2(
                //   label: Text(
                //     'Обнулить',
                //     style: TextStyle(
                //       fontSize: 15,
                //       overflow: TextOverflow.ellipsis,
                //     ),
                //   ),
                //   fixedWidth: 100,
                //   // size: ColumnSize.L,
                // ),
                // DataColumn2(
                //   label: Text('Id'),
                //   fixedWidth: 80,
                //   // size: ColumnSize.L,
                // ),
                // DataColumn2(
                //   label: Text(
                //     'Штрих-код',
                //     style: TextStyle(
                //       fontSize: 18,
                //       overflow: TextOverflow.ellipsis,
                //     ),
                //   ),
                //   fixedWidth: 150,
                // ),
                // DataColumn2(
                //   label: Center(
                //     child: Text(
                //       'Название',
                //       textAlign: TextAlign.center,
                //       style: TextStyle(),
                //     ),
                //   ),
                // ),
                // DataColumn2(
                //   label: Text('Ост.'),
                //   fixedWidth: 120,
                // ),
                // DataColumn2(
                //   label: Text(
                //     'Цена в сом',
                //     style: TextStyle(
                //       fontSize: 17,
                //       overflow: TextOverflow.ellipsis,
                //     ),
                //   ),
                //   fixedWidth: 120,
                //   numeric: true,
                // )
              ],
              rows: [],
              // _createRows(
              //   state.tableRecalculation,
              //   context,
              //   _bloc,
              //   customColor,
              // ),
            );
          },
        ),
      ),
    );
  }

  // /* Функция для создание строк */
  // List<DataRow> _createRows(
  //   List<StorageData> dataClass,
  //   context,
  //   RecalculationBloc recalculationBloc,
  //   CustomTheme colorText,
  // ) {
  //   // final bloc = context.read<PurchasesCubit>();
  //   List<DataRow> dataR = [];
  //   // int number = 0;

  //   for (StorageData i in dataClass) {
  //     List<DataCell> dataC = [
  //       /// Штрих код
  //       DataCell(
  //         textFieldCell(
  //           i.barcode ?? '',
  //           context,
  //           recalculationBloc,
  //           TextAlign.left,
  //           (title) {},
  //           colorText.colorText,
  //         ),
  //       ),

  //       /// Название
  //       DataCell(
  //         textFieldCell(
  //           i.product,
  //           context,
  //           recalculationBloc,
  //           TextAlign.left,
  //           (title) {},
  //           colorText.colorText,
  //         ),
  //       ),

  //       /// Цена в c
  //       DataCell(textCell(i.priceOfSom.toString(), TextAlign.center)),

  //       /// Остаток
  //       DataCell(
  //         textCell(
  //           // context,
  //           ((i.quantity ?? 0) - (i.found ?? 0)).toString(),
  //           TextAlign.center,
  //           // (title) async {},
  //           // DoubleTextInputFormatter(),
  //           // 1,
  //           // colorText.colorText,
  //         ),
  //       ),

  //       /// Подсчитано
  //       DataCell(
  //         textFieldCellWithReg(
  //           context,
  //           (i.found).toString(),
  //           TextAlign.center,
  //           (title) async {
  //             if (title.isNotEmpty) {
  //               recalculationBloc.add(
  //                 UpdateFound(i.copyWith(found: int.parse(title)), context),
  //               );
  //             }

  //             // recalculationBloc.changeMessage(context);

  //             // Navigator.pop(context);
  //           },
  //           DoubleTextInputFormatter(),
  //           1,
  //           colorText.colorText,
  //         ),
  //       ),

  //       /// Сбросить
  //       DataCell(
  //         deleteCell(context, 'Точнее обнулить -> ${i.product}', () async {
  //           recalculationBloc.add(ResetFound(i.product, i.barcode ?? ''));
  //         }),
  //       ),
  //     ];
  //     dataR.add(DataRow(cells: dataC));
  //   }
  //   return dataR.toList();
  // }
}
