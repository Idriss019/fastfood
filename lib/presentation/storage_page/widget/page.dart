import 'package:data_table_2/data_table_2.dart';
import 'package:fastfood/global_function.dart';
import 'package:fastfood/navBar.dart';
import 'package:fastfood/presentation/storage_page/bloc/storage_bloc.dart';
import 'package:fastfood/presentation/storage_page/widget/table_method.dart';
import 'package:fastfood/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoragePage extends StatefulWidget {
  const StoragePage({super.key});

  @override
  State<StoragePage> createState() => StoragePageState();
}

class StoragePageState extends State<StoragePage> {
  late StorageBloc storageBloc;
  // int selectedIndices = -1;
  Map<int, bool> checkedRows = {};

  @override
  void initState() {
    super.initState();
    storageBloc = context.read<StorageBloc>();
    storageBloc.startListening();
  }

  @override
  void dispose() {
    storageBloc.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CustomTheme myColor = CustomTheme(context: context);

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
                      child: Text('Фильтр :', style: TextStyle(fontSize: 35)),
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
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  // padding: EdgeInsets.only(top: 10),
                  color: Colors.cyan,
                  child: BlocBuilder<StorageBloc, StorageState>(
                    builder: (context, state) {
                      return DataTable2(
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
                          //   'В блюде',
                          //   TextAlign.center,
                          //   18,
                          //   180,
                          //   maxLine: 2,
                          // ),
                          customDataColumn('В блюде', TextAlign.center, 15, 80),
                          customDataColumn(
                            'Штрих-код',
                            TextAlign.left,
                            18,
                            180,
                            maxLine: 2,
                          ),
                          customDataColumn(
                            'Название',
                            TextAlign.left,
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
                          customDataColumn('шт/г/мл', TextAlign.left, 13, 80),
                          customDataColumn(
                            'измерение ',
                            TextAlign.left,
                            13,
                            80,
                          ),
                          customDataColumn(
                            'себестоимость ',
                            TextAlign.left,
                            13,
                            80,
                          ),
                          customDataColumn(
                            'стоимость ',
                            TextAlign.left,
                            13,
                            80,
                          ),

                          // customDataColumn('Подсчет', TextAlign.center, 18, 100),
                          // customDataColumn('масса/объем', TextAlign.center, 13, 80),
                          // customDataColumn('Цена', TextAlign.center, 18, 100),
                          // customDataColumn('всего м/об ', TextAlign.center, 13, 80),
                          // customDataColumn('Количество', TextAlign.center, 18, 100),
                          customDataColumn('Удалить', TextAlign.center, 13, 45),
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
                        rows: createStorageRows(
                          state.storageList,
                          context,
                          storageBloc,
                          myColor,
                          // selectedIndices?? [-1],
                          // () => setState(() {}),
                          checkedRows,
                          // selectedIndices,
                        ), //listTable
                        //[],
                        // );
                      );
                    },
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
    );
  }
}
