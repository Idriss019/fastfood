import 'package:data_table_2/data_table_2.dart';
import 'package:fastfood/global_function.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Container(
        // width: 100,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.amber),
        child: Column(
          children: [
            Flexible(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search), // border_color
                    ),
                    Text('Заказ', style: TextStyle(fontSize: 40)),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.qr_code_2_outlined),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 27,
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
                    // customDataColumn(
                    //   'Удалить',
                    //   TextAlign.center,
                    //   13,
                    //   50,
                    // ),
                    customDataColumn(
                      'Кол.',
                      TextAlign.center,
                      13,
                      80,
                    ),
                    customDataColumn(
                      'Продукт',
                      TextAlign.center,
                      null,
                      null,
                    ),
                    customDataColumn(
                      'масса мл/г',
                      TextAlign.center,
                      13,
                      80,
                    ),
                    customDataColumn(
                      'Цена',
                      TextAlign.center,
                      18,
                      100,
                    ),
                    customDataColumn(
                      'Сумма',
                      TextAlign.center,
                      18,
                      100,
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
            Flexible(
              flex: 2,
              child: SizedBox(
                // height: 100,
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Комментарий :',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Expanded(
                      // height: 70,
                      // width: 100,
                      child: TextField(),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 8,
              child: Container(
                color: Colors.greenAccent,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.green,
                        child: Column(
                          children: [
                            Expanded(
                              child: Row(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        size: 50,
                                        Icons.plus_one_outlined,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        size: 50,
                                        Icons
                                            .exposure_minus_1_outlined,
                                      ),
                                    ),
                                  ), // onetwothree_outlined  lock_outline remove_circle
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        size: 50,
                                        Icons.delete,
                                      ),
                                    ),
                                  ), // onetwothree_outlined  lock_outline remove_circle
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () {},
                                      child: SizedBox(
                                        // height: double.infinity,
                                        width: double.infinity,
                                        child: Text(
                                          '123',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 50,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // child: TextButton(
                              //   onPressed: () {},
                              //   child: SizedBox(
                              //     // height: double.infinity,
                              //     width: double.infinity,
                              //     child: Text(
                              //       '123',
                              //       textAlign: TextAlign.center,
                              //       style: TextStyle(fontSize: 50),
                              //     ),
                              //   ),
                              // ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.lightGreen,
                        child: Column(
                          children: [
                            Flexible(
                              flex: 1,
                              child: SizedBox(
                                height: double.infinity,
                                child: Text('Подытог'),
                              ),
                            ),
                            Flexible(
                              flex: 4,
                              child: SizedBox(
                                height: double.infinity,
                                child: Text(
                                  '1 200',
                                  style: TextStyle(fontSize: 50),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 3,
                              child: TextButton(
                                onPressed: () {},
                                child: SizedBox(
                                  // height: double.infinity,
                                  width: double.infinity,
                                  child: Text(
                                    'Принять',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 35),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}