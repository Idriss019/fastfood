import 'package:data_table_2/data_table_2.dart';
// import 'package:fastfood/data_class/staff_data.dart';
import 'package:fastfood/global_function.dart';
import 'package:fastfood/presentation/password/cubit/password_cubit.dart';
import 'package:fastfood/presentation/staff/bloc/staff_bloc.dart';
import 'package:fastfood/theme.dart';
import 'package:fastfood/widgetMetod.dart' hide customDataColumn;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomTableWidget extends StatefulWidget {
  const BottomTableWidget({super.key});

  @override
  State<BottomTableWidget> createState() => _BottomTableWidgetState();
}

class _BottomTableWidgetState extends State<BottomTableWidget> {
  late StaffBloc staffBloc;
  late PasswordCubit passwordCubit;

  // Set<int> selectedIndices = <int>{};

  @override
  void initState() {
    staffBloc = context.read<StaffBloc>();
    passwordCubit = context.read<PasswordCubit>();
    super.initState();
  }

  // // Список полномочий с разрешениями и описаниями
  // final List<Permission> _permissions = [
  //   Permission(
  //     name: 'Отмена заказа',
  //     allowed: false,
  //     page: 'Заказ',
  //     description: 'Позволяет отменять заказы клиентов',
  //   ),
  //   Permission(
  //     name: 'Изменение цен',
  //     allowed: true,
  //     page: 'Заказ',
  //     description: 'Дает возможность редактировать цены товаров',
  //   ),
  //   Permission(
  //     name: 'Закуп товара',
  //     allowed: false,
  //     page: 'Закуп',
  //     description: 'Разрешает создание и подтверждение заказов на закуп',
  //   ),
  //   Permission(
  //     name: 'Отмена заказа',
  //     allowed: false,
  //     page: 'Заказ',
  //     description: 'Позволяет отменять заказы клиентов',
  //   ),
  //   Permission(
  //     name: 'Изменение цен',
  //     allowed: true,
  //     page: 'Заказ',
  //     description: 'Дает возможность редактировать цены товаров',
  //   ),
  //   Permission(
  //     name: 'Закуп товара',
  //     allowed: false,
  //     page: 'Закуп',
  //     description: 'Разрешает создание и подтверждение заказов на закуп',
  //   ),

  //   // Можно добавить другие полномочия
  // ];

  @override
  Widget build(BuildContext context) {
    CustomTheme customTheme = CustomTheme(context: context);
    return BlocBuilder<StaffBloc, StaffState>(
      builder: (context, state) {
        return DataTable2(
          isVerticalScrollBarVisible: false,
          // checkboxHorizontalMargin: 51,
          // dividerThickness: 0,
          headingRowColor: WidgetStateProperty<Color?>.fromMap(
            <WidgetStatesConstraint, Color?>{
              WidgetState.error: Colors.red,
              WidgetState.hovered & WidgetState.focused: Colors.blueAccent,
              WidgetState.focused: Colors.blue,
              ~WidgetState.disabled: customTheme.colorButton,
            },
          ),
          columns: [
            customDataColumn(
              'Полномочия',
              TextAlign.center,
              null,
              250,
              colorText: customTheme.colorTextInButton,
            ),
            customDataColumn(
              'Разрешение',
              TextAlign.center,
              null,
              100,
              colorText: customTheme.colorTextInButton,
            ),
            customDataColumn(
              'Страница',
              TextAlign.center,
              null,
              140,
              colorText: customTheme.colorTextInButton,
            ),
            customDataColumn(
              'Полное описание',
              TextAlign.center,
              null,
              null,
              colorText: customTheme.colorTextInButton,
            ),
            // DataColumn(
            //   label: Text('Полномочия', style: TextStyle(color: invertColor)),
            // ),
            // DataColumn(
            //   label: Text('Разрешение', style: TextStyle(color: invertColor)),
            // ),
            // DataColumn(
            //   label: Text('Страница', style: TextStyle(color: invertColor)),
            // ),
            // DataColumn(
            //   label: Text('Полное описание', style: TextStyle(color: invertColor)),
            // ),
          ],
          rows: _createRows(
            state.powersMap,
            context,
            staffBloc,
            passwordCubit,
            customTheme,
          ),
          //[]

          // _permissions.map((perm) {
          //   return DataRow(
          //     cells: [
          //       DataCell(Text(perm.name)),
          //       DataCell(
          //         Checkbox(
          //           value: perm.allowed,
          //           onChanged: (bool? value) {
          //             setState(() {
          //               perm.allowed = value ?? false;
          //             });
          //           },
          //         ),
          //       ),
          //       DataCell(Text(perm.page)),
          //       DataCell(
          //         TextButton(
          //           onPressed: () {
          //             showDialog(
          //               context: context,
          //               builder: (context) => AlertDialog(
          //                 title: Text('Полное описание'),
          //                 content: Text(perm.description),
          //                 actions: [
          //                   TextButton(
          //                     onPressed: () => Navigator.pop(context),
          //                     child: Text('OK'),
          //                   ),
          //                 ],
          //               ),
          //             );
          //           },
          //           child: Text(perm.description, overflow: TextOverflow.ellipsis),
          //         ),
          //       ),
          //     ],
          //   );
          // }).toList(),
        );
      },
    );
  }

  /* Функция для создание строк */
  List<DataRow> _createRows(
    Map<String, List<dynamic>> powersMap2,
    context,
    StaffBloc bloc,
    PasswordCubit pBloc,
    CustomTheme customTheme,
    //   {
    //   Set<int>? selected,
    // }
  ) {
    // selectedIndices:
    // selected.contains(value);
    // final bloc = context.read<PurchasesCubit>();
    List<DataRow> dataR = [];
    // int number = 0;
    // int index = 0;

    for (var MapEntry(:key, :value) in powersMap2.entries) {
      // int indexCopy = index;
      List<DataCell> dataC = [
        /// полномочия
        DataCell(textCell(key, TextAlign.left)),

        /// разрешения
        DataCell(
          Checkbox(
            value: value[0],
            activeColor: customTheme.colorTextInButton,
            onChanged: (bool? value1) {
              setState(() {
                // print('indexCopy: $indexCopy');
                value[0] = value1 ?? false;
                Map<String, List<dynamic>>? sPowers =
                    bloc.state.staffPowers.powers;
                sPowers![key]![0] = value[0];

                bloc.staffSQL.updateById(
                  bloc.state.staffPowers.copyWith(powers: sPowers),
                );
                pBloc.loadPasswordData();
                // pBloc.updateState(pBloc.state.copyWith(powers: sPowers));
                //  <----------------------
                // perm.allowed = value ?? false;
              });
            },
          ),
        ),

        /// страница
        DataCell(textCell(value[1], TextAlign.center)),

        /// описание
        DataCell(
          messageCell(context, value[2], value[2], textAlign: TextAlign.left),
        ),

        // DataCell(
        //   textFieldCell(i[1], context, bloc, TextAlign.center, (
        //     String title,
        //   ) {
        //     bloc.updateStaffData(i.copyWith(position: title.saveText()));
        //     Navigator.pop(context);
        //   }, colorText),
        // ),

        // /// Логин
        // DataCell(textCell(i.login, TextAlign.center)),

        // /// Пароль
        // DataCell(
        //   PasswordCellWidget(i:i)
        //   // passwordCell(i, context, bloc, colorText),
        // ),

        // /// Код полномочий
        // DataCell(
        //   textFieldCellWithReg2(
        //     StaffData.transformationPowersToString(i.powers),
        //     context,
        //     bloc,
        //     TextAlign.center,
        //     (String title) {
        //       bloc.updateStaffData(
        //         i.copyWith(powers: StaffData.transformationPowersToMap(title)),
        //       );
        //       Navigator.pop(context);
        //     },
        //     FilteringTextInputFormatter.allow(RegExp(r'[01]+')), // Только 0 и 1
        //     1,
        //     colorText,
        //   ),
        // ),

        // /// Удалить
        // DataCell(
        //   deleteCell(
        //     context,
        //     i.login,
        //     () {
        //       bloc.deleteStaffData(i);
        //     },
        //     // i.product,
        //     // () {},
        //     // () => bloc.add(RemoveFromList(data: i)),
        //     // () => bloc.removePurchasesList(i)
        //   ),
        // ),

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
      // index++;
      dataR.add(DataRow(cells: dataC));
    }

    return dataR;
  }
}

class Permission {
  final String name; // Название полномочия
  bool allowed; // Разрешение (может меняться)
  final String page; // Полное описание
  final String description; // Полное описание

  Permission({
    required this.name,
    this.allowed = false,
    required this.page,
    required this.description,
  });
}
