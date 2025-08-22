// import 'package:fastfood/navBar.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:fastfood/global_function.dart';
import 'package:fastfood/navBar.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_numeric_keyboard/flutter_numeric_keyboard.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  TextEditingController sumController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Navbar(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
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
              ),
              Flexible(
                flex: 1,
                child: Container(
                  // width: 100,
                  decoration: BoxDecoration(color: Colors.blue),
                  child: Column(
                    children: [
                      Text('Меню', style: TextStyle(fontSize: 40)),
                      Expanded(
                        child: ListView(
                          children: [
                            SizedBox(
                              height: 90,
                              width: double.infinity,
                              child: TextButton(
                                onPressed: () {
                                  print('Кофе');
                                },
                                // style: TextButton.styleFrom(
                                //   fixedSize: const Size(300, 100),
                                // ),
                                child: Text(
                                  'Кофе',
                                  style: TextStyle(fontSize: 25),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 90,
                              width: double.infinity,
                              child: TextButton(
                                onPressed: () {
                                  print('Не Кофе');
                                },
                                // style: TextButton.styleFrom(
                                //   fixedSize: const Size(300, 100),
                                // ),
                                child: Text(
                                  'Не Кофе',
                                  style: TextStyle(fontSize: 25),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 90,
                              width: double.infinity,
                              child: TextButton(
                                onPressed: () {
                                  print('Смузи');
                                },
                                // style: TextButton.styleFrom(
                                //   fixedSize: const Size(300, 100),
                                // ),
                                child: Text(
                                  'Смузи',
                                  style: TextStyle(fontSize: 25),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 90,
                              width: double.infinity,
                              child: TextButton(
                                onPressed: () {
                                  print('Чай');
                                },
                                // style: TextButton.styleFrom(
                                //   fixedSize: const Size(300, 100),
                                // ),
                                child: Text(
                                  'Чай',
                                  style: TextStyle(fontSize: 25),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 90,
                              width: double.infinity,
                              child: TextButton(
                                onPressed: () {
                                  print('Фреши');
                                },
                                // style: TextButton.styleFrom(
                                //   fixedSize: const Size(300, 100),
                                // ),
                                child: Text(
                                  'Фреши',
                                  style: TextStyle(fontSize: 25),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 90,
                              width: double.infinity,
                              child: TextButton(
                                onPressed: () {
                                  print('Лимонады');
                                },
                                // style: TextButton.styleFrom(
                                //   fixedSize: const Size(300, 100),
                                // ),
                                child: Text(
                                  'Лимонады',
                                  style: TextStyle(fontSize: 25),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 90,
                              width: double.infinity,
                              child: TextButton(
                                onPressed: () {
                                  print('Мороженое');
                                },
                                // style: TextButton.styleFrom(
                                //   fixedSize: const Size(300, 100),
                                // ),
                                child: Text(
                                  'Мороженое',
                                  style: TextStyle(fontSize: 25),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 90,
                              width: double.infinity,
                              child: TextButton(
                                onPressed: () {
                                  print('Дисерты');
                                },
                                // style: TextButton.styleFrom(
                                //   fixedSize: const Size(300, 100),
                                // ),
                                child: Text(
                                  'Дисерты',
                                  style: TextStyle(fontSize: 25),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Expanded(
              //   child: SizedBox(
              //     // width: 600,
              //     child: Column(
              //       children: [
              //         Text('Итого', style: TextStyle(fontSize: 40)),
              //         // SizedBox(height: 200),
              //         Container(
              //           decoration: BoxDecoration(
              //             border: Border.all(color: Colors.blue),
              //             borderRadius: BorderRadius.all(Radius.circular(10)),
              //           ),
              //           child: Text(
              //             sumController.text,
              //             style: TextStyle(fontSize: 40),
              //           ),
              //         ),
              //         FlutterNumericKeyboard(
              //           dividerColor: Colors.black,
              //           width: double.infinity,
              //           height: 480,
              //           showResult: false,
              //           resultTextStyle: const TextStyle(
              //             color: Colors.black,
              //             fontSize: 20,
              //             fontWeight: FontWeight.bold,
              //           ),
              //           resultFunction: (value) {
              //             setState(() {
              //               sumController.text = value;
              //             });

              //             // print(value);
              //             // if (bloc.changePasswordToStart(value)) {
              //             //         context.go('/home');
              //             //       }
              //             // passwordController.text = value;
              //           },
              //           obscureResult: false,
              //           showDivider: true,
              //           rightIconBack: const Icon(
              //             Icons.backspace,
              //             color: Colors.blueGrey,
              //           ),
              //           showRightIcon: true,
              //           leftIconReset: const Icon(
              //             Icons.refresh,
              //             color: Colors.blueGrey,
              //           ),
              //           showLeftIcon: true,
              //           digitStyle: TextStyle(
              //             color: Theme.of(context).colorScheme.onSecondary,
              //             fontSize: 15,
              //             fontWeight: FontWeight.bold,
              //           ),
              //           backgroundColor: Theme.of(
              //             context,
              //           ).colorScheme.onPrimary,
              //           backgroundRadius: 20,
              //         ),
              //         SizedBox(
              //           height: 80,
              //           width: double.infinity,
              //           child: TextButton(
              //             onPressed: () {
              //               print('Принять');
              //             },
              //             // style: TextButton.styleFrom(
              //             //   fixedSize: const Size(300, 100),
              //             // ),
              //             child: Text(
              //               'Принять',
              //               style: TextStyle(fontSize: 25),
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

//return NavBarWidget(child: Text('Таблицы'));
