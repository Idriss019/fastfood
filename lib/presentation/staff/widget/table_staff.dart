import 'package:data_table_2/data_table_2.dart';
import 'package:fastfood/data_class/staff_data.dart';
import 'package:fastfood/global_function.dart';
import 'package:fastfood/presentation/staff/bloc/staff_bloc.dart';
import 'package:fastfood/presentation/staff/widget/password_cell.dart';
// import 'package:fastfood/presentation/staff/widget/page.dart';
import 'package:fastfood/theme.dart';
import 'package:fastfood/widgetMetod.dart' hide customDataColumn;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dart_helper_method/string_helper.dart';

class TableStaffWidget extends StatefulWidget {
  const TableStaffWidget({super.key});

  @override
  State<TableStaffWidget> createState() => _TableStaffWidgetState();
}

class _TableStaffWidgetState extends State<TableStaffWidget> {
  late StaffBloc staffBloc;

  // final oldPasswordController = TextEditingController();
  // final retryOldPasswordController = TextEditingController();
  // final newPasswordController = TextEditingController();
  // bool isObscuredOld = true;
  // bool isObscuredNew = true;

  @override
  void initState() {
    super.initState();
    staffBloc = context.read<StaffBloc>();
    staffBloc.startListening();
  }

  @override
  void dispose() {
    staffBloc.stopListening();
    // oldPasswordController.dispose();
    // retryOldPasswordController.dispose();
    // newPasswordController.dispose();
    super.dispose();
  }

  // void clearInputControllers() {
  //   oldPasswordController.clear();
  //   retryOldPasswordController.clear();
  //   newPasswordController.clear();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StaffBloc, StaffState>(
      builder: (context, state) {
        return DataTable2(
          // scrollController:
          //     yourScrollController, ~d#CpHm97~EF  KhkqAd%RTqo9
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
              'Должность',
              TextAlign.center,
              18,
              180,
              maxLine: 2,
            ),
            customDataColumn('Логин', TextAlign.center, null, null),
            customDataColumn('Пароль', TextAlign.center, 18, 180, maxLine: 2),
            customDataColumn(
              'Код полномочий',
              TextAlign.center,
              16,
              180,
              maxLine: 2,
            ),
            customDataColumn('Удалить', TextAlign.center, 13, 50),
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
            // customDataColumn('шт/г/мл', TextAlign.center, 13, 80),
            // customDataColumn('измерение ', TextAlign.center, 13, 80),
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
          rows: _createRows(
            state.staffDataList,
            context,
            staffBloc,
            CustomTheme(context: context).colorText,
          ),
        ); //listTable
        //[]);
        // );
      },
    );

    // _createRows(
    //     // state.purchasesListSQL,
    //     // _bloc.switchableList.listPosition(),
    //     // _bloc.state.listPosition(),

    //     swichList.listPosition(),
    //     context,
    //     _bloc,
    //     invertColor),
  }

  /* Функция для создание строк */
  List<DataRow> _createRows(
    List<StaffData> dataClass,
    context,
    StaffBloc bloc,
    colorText,
  ) {
    // final bloc = context.read<PurchasesCubit>();
    List<DataRow> dataR = [];
    // int number = 0;

    for (StaffData i in dataClass) {
      // double sum = i.priceOfSom! * i.quantity!.toDouble();
      // number++;
      List<DataCell> dataC = [
        // /// Num
        // DataCell(Text((dataClass.indexOf(i) + 1).toString())),
        /// Должность
        DataCell(
          textFieldCell(i.position, context, bloc, TextAlign.center, (
            String title,
          ) {
            bloc.updateStaffData(i.copyWith(position: title.saveText()));
            Navigator.pop(context);
          }, colorText),
        ),

        /// Логин
        DataCell(textCell(i.login, TextAlign.center)),

        /// Пароль
        DataCell(
          PasswordCellWidget(i:i)
          // passwordCell(i, context, bloc, colorText),
        ),

        /// Код полномочий
        DataCell(
          textFieldCellWithReg2(
            StaffData.transformationPowersToString(i.powers),
            context,
            bloc,
            TextAlign.center,
            (String title) {
              bloc.updateStaffData(
                i.copyWith(powers: StaffData.transformationPowersToMap(title)),
              );
              Navigator.pop(context);
            },
            FilteringTextInputFormatter.allow(RegExp(r'[01]+')), // Только 0 и 1
            1,
            colorText,
          ),
        ),

        /// Удалить
        DataCell(
          deleteCell(
            context,
            i.login,
            () {
              bloc.deleteStaffData(i);
            },
            // i.product,
            // () {},
            // () => bloc.add(RemoveFromList(data: i)),
            // () => bloc.removePurchasesList(i)
          ),
        ),

        //   /// Название
        //   DataCell(textCell(i.product, TextAlign.center)),

        //   /// Цена в закупки
        //   DataCell(
        //     textCell(
        //       i.priceOfPurchases.toString(),
        //       TextAlign.center,
        //       separator: true,
        //       maxLine: 1,
        //     ),
        //   ),
        //   // DataCell(
        //   //   textFieldCellWithReg(
        //   //     context,
        //   //     i.priceOfPurchases.toString(),
        //   //     TextAlign.center,
        //   //     (newPurchases) {
        //   //       double parsedPurchases;

        //   //       try {
        //   //         parsedPurchases = double.parse(newPurchases);
        //   //         bloc.add(
        //   //           UpdatePurchasesFromList(
        //   //             data: i,
        //   //             newData: i.copyWith(priceOfPurchases: parsedPurchases),
        //   //           ),
        //   //         );
        //   //         Navigator.pop(context);
        //   //       } catch (e) {
        //   //         print('Не корректное число!');
        //   //         // emit(state.copyWith(errorTitle: 'Некорректное числовое значение!'));
        //   //         return;
        //   //       }
        //   //     },
        //   //     // (title) {
        //   //     // bloc.updatePurchasesList(
        //   //     //     i, i.copyWith(priceOfPurchases: double.parse(title)));
        //   //     // Navigator.pop(context);
        //   //     // }
        //   //     DoubleTextInputFormatter(),
        //   //     1,
        //   //     colorText,
        //   //     separator: true,
        //   //   ),
        //   // ),

        //   /// Количество
        //   DataCell(
        //     textFieldCellWithReg(
        //       context,
        //       i.quantity.toString(),
        //       TextAlign.center,
        //       (title) {
        //         bloc.add(
        //           UpdatePurchasesList(
        //             index: dataClass.indexOf(i),
        //             newData: i.copyWith(quantity: int.parse(title)),
        //           ),
        //         );
        //         bloc.add(UpdateTotal());
        //         // bloc.updateTotal();
        //       },
        //       FilteringTextInputFormatter.allow(RegExp(r'\b[1-9][0-9]{0,4}')),
        //       1,
        //       colorText,
        //     ),
        //   ),

        //   /// Измеритель
        //   DataCell(
        //     textCell(
        //       i.measuring ?? 'шт',
        //       TextAlign.center,
        //       separator: true,
        //       maxLine: 1,
        //     ),
        //   ),
        //   // DataCell(
        //   //   textFieldCellWithReg(
        //   //     context,
        //   //     i.quantity.toString(),
        //   //     TextAlign.center,
        //   //     (title) {
        //   //       // bloc.updatePurchasesList(i, i.copyWith(quantity: int.parse(title)));
        //   //       // Navigator.pop(context);
        //   //     },
        //   //     FilteringTextInputFormatter.allow(RegExp(r'\b[1-9][0-9]{0,4}')),
        //   //     1,
        //   //     colorText,
        //   //     separator: true,
        //   //   ),
        //   // ),

        //   /// Сумма
        //   DataCell(
        //     textCell(
        //       (i.priceOfPurchases! * i.quantity!.toDouble()).toString(),
        //       TextAlign.center,
        //       separator: true,
        //       maxLine: 1,
        //     ),
        //   ),

        //   /// Удалить
        //   DataCell(
        //     deleteCell(
        //       context,
        //       i.product,
        //       // () {},
        //       () => bloc.add(RemoveFromList(data: i)),
        //       // () => bloc.removePurchasesList(i)
        //     ),
        //   ),
        //   // /// Штрих-код
        //   // DataCell(textCell((i.barcode ?? ''), TextAlign.center)),
      ];
      dataR.add(DataRow(cells: dataC));
    }
    return dataR;
  }

  // TextButton passwordCell(StaffData i, context, StaffBloc bloc, colorText) {
  //   return textFieldCellWithReg3(
  //         '•' * i.password.length,
  //         context,
  //         bloc,
  //         TextAlign.center,
  //         () async {
  //           await showDialog(
  //             context: context,
  //             builder: (context) {
  //               return StatefulBuilder(
  //                 builder: (context, setState) {
  //                   return AlertDialog(
  //                     content: Text(
  //                       'Изменить пароль для ${i.login}',
  //                       textAlign: TextAlign.center,
  //                       style: TextStyle(fontSize: 24),
  //                     ),
  //                     actions: [
  //                       Column(
  //                         mainAxisSize: MainAxisSize.min,
  //                         children: [
  //                           SizedBox(
  //                             width: 300,
  //                             child: Row(
  //                               children: [
  //                                 Text(
  //                                   'Старый пароль :',
  //                                   style: TextStyle(fontSize: 18),
  //                                 ),
  //                                 SizedBox.fromSize(size: Size(10, 0)),
  //                                 Expanded(
  //                                   child: TextField(
  //                                     obscureText: isObscuredOld,
  //                                     controller: oldPasswordController,
  //                                     textAlign: TextAlign.center,
  //                                     keyboardType: TextInputType.number,
  //                                     inputFormatters: <TextInputFormatter>[
  //                                       FilteringTextInputFormatter
  //                                           .digitsOnly,
  //                                     ], // С таким фильтром могут быть введены только числа
  //                                     decoration: InputDecoration(
  //                                       suffixIcon: IconButton(
  //                                         icon: Icon(
  //                                           isObscuredOld
  //                                               ? Icons.visibility_off
  //                                               : Icons.visibility,
  //                                         ),
  //                                         onPressed: () {
  //                                           setState(() {
  //                                             isObscuredOld = !isObscuredOld;
  //                                           });
  //                                         },
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                           SizedBox(
  //                             width: 300,
  //                             child: Row(
  //                               children: [
  //                                 Text(
  //                                   'Новый пароль :',
  //                                   style: TextStyle(fontSize: 18),
  //                                 ),
  //                                 SizedBox.fromSize(size: Size(10, 0)),
  //                                 Expanded(
  //                                   child: TextField(
  //                                     obscureText: isObscuredNew,
  //                                     controller: newPasswordController,
  //                                     textAlign: TextAlign.center,
  //                                     keyboardType: TextInputType.number,
  //                                     inputFormatters: <TextInputFormatter>[
  //                                       FilteringTextInputFormatter
  //                                           .digitsOnly,
  //                                     ], // С таким фильтром могут быть введены только числа
  //                                     decoration: InputDecoration(
  //                                       suffixIcon: IconButton(
  //                                         icon: Icon(
  //                                           isObscuredNew
  //                                               ? Icons.visibility_off
  //                                               : Icons.visibility,
  //                                         ),
  //                                         onPressed: () {
  //                                           setState(() {
  //                                             isObscuredNew = !isObscuredNew;
  //                                           });
  //                                         },
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                           SizedBox(
  //                             width: 300,
  //                             child: Row(
  //                               children: [
  //                                 Text(
  //                                   'Повторить :',
  //                                   style: TextStyle(fontSize: 18),
  //                                 ),
  //                                 SizedBox.fromSize(size: Size(10, 0)),
  //                                 Expanded(
  //                                   child: TextField(
  //                                     obscureText: isObscuredOld,
  //                                     controller: retryOldPasswordController,
  //                                     textAlign: TextAlign.center,
  //                                     keyboardType: TextInputType.number,
  //                                     inputFormatters: <TextInputFormatter>[
  //                                       FilteringTextInputFormatter
  //                                           .digitsOnly,
  //                                     ], // С таким фильтром могут быть введены только числа
  //                                     decoration: InputDecoration(
  //                                       suffixIcon: IconButton(
  //                                         icon: Icon(
  //                                           isObscuredOld
  //                                               ? Icons.visibility_off
  //                                               : Icons.visibility,
  //                                         ),
  //                                         onPressed: () {
  //                                           setState(() {
  //                                             isObscuredOld = !isObscuredOld;
  //                                           });
  //                                         },
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                           SizedBox(height: 20),
  //                           Row(
  //                             mainAxisAlignment:
  //                                 MainAxisAlignment.spaceBetween,
  //                             children: [
  //                               /* кнопка отмены */
  //                               TextButton(
  //                                 onPressed: () {
  //                                   clearInputControllers();
  //                                   Navigator.pop(context);
  //                                 },
  //                                 child: Text(
  //                                   'Отмена',
  //                                   style: TextStyle(
  //                                     color: colorText,
  //                                     fontSize: 20,
  //                                   ),
  //                                 ),
  //                               ),
  //                               /*  кнопка принятия */
  //                               TextButton(
  //                                 onPressed: () async {
  //                                   staffBloc.add(
  //                                     UpdatePasswordEvent(
  //                                       staffData: i,
  //                                       oldPassword:
  //                                           oldPasswordController.text,
  //                                       retryOldPassword:
  //                                           retryOldPasswordController.text,
  //                                       newPassword:
  //                                           newPasswordController.text,
  //                                       context: context,
  //                                       func: () {
  //                                         clearInputControllers();
  //                                         Navigator.pop(context);
  //                                       },
  //                                     ),
  //                                   );
  //                                   // clearInputControllers();
  //                                   // Navigator.pop(context);
  //                                 },
  //                                 child: Text(
  //                                   'Изменить',
  //                                   style: TextStyle(
  //                                     color: colorText,
  //                                     fontSize: 20,
  //                                   ),
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                         ],
  //                       ),
  //                     ],
  //                   );
  //                 },
  //               );
  //             },
  //           );
  //           // (String title) {
  //           //   bloc.updateStaffData(
  //           //     i.copyWith(powers: StaffData.transformationPowersToMap(title)),
  //           //   );
  //           // Navigator.pop(context);
  //         },
  //         FilteringTextInputFormatter
  //             .digitsOnly, // С таким фильтром могут быть введены только числа
  //         1,
  //         colorText,
  //       );
  // }
}
