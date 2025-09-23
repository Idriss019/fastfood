import 'package:data_table_2/data_table_2.dart';
import 'package:fastfood/global_function.dart';
import 'package:fastfood/navBar.dart';
import 'package:flutter/material.dart';

class CleanForStorage extends StatelessWidget {
  const CleanForStorage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Navbar(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 18.0, right: 18.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Text('Очистка для хранения', style: TextStyle(fontSize: 40)),
                    // OrderScreen(),
                    // MenuScreen(),
                    SizedBox(
                      width: 300,
                      child: Text('Фильтр :', style: TextStyle(fontSize: 40)),
                    ),
                    Expanded(
                      child: SizedBox(
                        child: TextField(
                          autofocus: true,
                          decoration: InputDecoration(
                            hintText: 'Штрих-код или название товара',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.black, // Не работает!
                                width: 5,
                              ),
                            ),
                          ),
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ),
                    // Container(
                    //   height: 68,
                    //   margin: EdgeInsets.only(left: 10.0),
                    //   decoration: BoxDecoration(
                    //     border: Border.all(width: 2, color: Colors.white),
                    //     borderRadius: BorderRadius.circular(10),
                    //   ),
                    //   // height: double.infinity,
                    //   child: TextButton(
                    //     onPressed: () {},
                    //     child: Text(
                    //       'Подтвердить',
                    //       style: TextStyle(fontSize: 30),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  // padding: EdgeInsets.only(top: 10),
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
                    headingRowColor: WidgetStateProperty.all(Colors.blueGrey),
                    dataRowHeight: 40,
                    columns: [
                      customDataColumn(
                        'Штрих-код',
                        TextAlign.center,
                        18,
                        180,
                        maxLine: 2,
                      ),
                      customDataColumn(
                        'Название',
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
                      customDataColumn('шт/г/мл', TextAlign.center, 13, 80),
                      customDataColumn('измерение ', TextAlign.center, 13, 80),
                      // customDataColumn('Количество', TextAlign.center, 18, 100),

                      // customDataColumn('Удалить', TextAlign.center, 13, 50),
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
              Text('Только то что не в ходит в блюдо'),
            ],
          ),
        ),
      ),
    );
  }
}
