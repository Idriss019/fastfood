import 'package:data_table_2/data_table_2.dart';
import 'package:fastfood/global_function.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.amber),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  Text('Оплата', style: TextStyle(fontSize: 40)),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.visibility, size: 30),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.cyan,
                child: DataTable2(
                  // scrollController:
                  //     yourScrollController,
                  columnSpacing: 5,
                  horizontalMargin: 10,
                  headingTextStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                  dataTextStyle: TextStyle(
                    // color: invertColor,
                    fontWeight: FontWeight.w500,
                    // fontSize: 25,
                  ),
                  // border: TableBorder.all(
                  //     // color: Colors.grey,
                  //     // borderRadius: BorderRadius.only(
                  //     //     bottomLeft: Radius.circular(20),
                  //     //     bottomRight: Radius.circular(20))
                  //     ),
                  headingRowColor: WidgetStateProperty.all(
                    Colors.blueGrey,
                  ),
                  dataRowHeight: 40,
                  columns: [
                    customDataColumn(
                      'Номер заказа',
                      TextAlign.center,
                      13,
                      80,
                      maxLine: 2,
                    ),
                    customDataColumn(
                      'Товары',
                      TextAlign.center,
                      null,
                      null,
                    ),
                    // customDataColumn(
                    //   'масса мл/г',
                    //   TextAlign.center,
                    //   13,
                    //   80,
                    // ),
                    // customDataColumn(
                    //   'Цена',
                    //   TextAlign.center,
                    //   18,
                    //   100,
                    // ),
                    customDataColumn(
                      'Подытог',
                      TextAlign.center,
                      18,
                      100,
                    ),
                    customDataColumn(
                      'Удалить',
                      TextAlign.center,
                      13,
                      50,
                    ),
                    // customDataColumn('Кол', TextAlign.center, 15, 90),
                    // customDataColumn(
                    //   'Цена в с',
                    //   TextAlign.center,
                    //   18,
                    //   100,
                    // ),
                    // customDataColumn(
                    //   'Сумма в с.',
                    //   TextAlign.center,
                    //   18,
                    //   150,
                    // ),
                  ],
                  rows: //listTable
                      [],
                  // ),
                  // _createRows(
                  //     // state.purchasesListSQL,
                  //     // _bloc.switchableList.listPosition(),
                  //     // _bloc.state.listPosition(),
    
                  //     swichList.listPosition(),
                  //     context,
                  //     _bloc,
                  //     invertColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}