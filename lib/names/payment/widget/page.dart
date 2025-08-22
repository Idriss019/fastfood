import 'package:data_table_2/data_table_2.dart';
import 'package:fastfood/global_function.dart';
import 'package:fastfood/navBar.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Navbar(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            children: [
              Flexible(
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
              ),
              Flexible(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.deepPurple),
                  child: Column(
                    children: [
                      SizedBox(
                        child: Text(
                          'Клиент предоставил',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              child: Column(
                                children: [
                                  SizedBox(
                                    child: Text(
                                      'Нал',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  SizedBox(
                                    child: Text(
                                      '2 000',
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              child: Column(
                                children: [
                                  SizedBox(
                                    child: Text(
                                      'Карта',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  SizedBox(
                                    child: Text(
                                      '3 000',
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Divider(height: 2, color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Divider(height: 2, color: Colors.black),
                      ),
                      SizedBox(
                        child: Text('Всего', style: TextStyle(fontSize: 25)),
                      ),
                      SizedBox(
                        child: Text('5 000', style: TextStyle(fontSize: 40)),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                SizedBox(
                                  child: Text(
                                    'Итог',
                                    style: TextStyle(fontSize: 25),
                                  ),
                                ),
                                SizedBox(
                                  child: Text(
                                    '4 500',
                                    style: TextStyle(fontSize: 40),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                SizedBox(
                                  child: Text(
                                    'Скидка %',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                SizedBox(
                                  child: Text(
                                    '0',
                                    style: TextStyle(fontSize: 40),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Expanded(child: SizedBox()),
                      SizedBox(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        '1',
                                        style: TextStyle(fontSize: 40),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        '2',
                                        style: TextStyle(fontSize: 40),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        '3',
                                        style: TextStyle(fontSize: 40),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        '4',
                                        style: TextStyle(fontSize: 40),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        '5',
                                        style: TextStyle(fontSize: 40),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        '6',
                                        style: TextStyle(fontSize: 40),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        '7',
                                        style: TextStyle(fontSize: 40),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        '8',
                                        style: TextStyle(fontSize: 40),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        '9',
                                        style: TextStyle(fontSize: 40),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        '00',
                                        style: TextStyle(fontSize: 40),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        '0',
                                        style: TextStyle(fontSize: 40),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        '000',
                                        style: TextStyle(fontSize: 40),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        size: 40,
                                        Icons.refresh,
                                        // color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        size: 40,
                                        Icons.backspace,
                                        // color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {},
                          child: Text('Чек', style: TextStyle(fontSize: 40)),
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
    );
  }
}
