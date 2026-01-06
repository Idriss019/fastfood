import 'package:data_table_2/data_table_2.dart';
import 'package:fastfood/data_class/storage_data.dart';
import 'package:fastfood/global_function.dart';
import 'package:fastfood/presentation/storage_page/bloc/storage_bloc.dart';
// import 'package:fastfood/presentation/storage_page/widget/page.dart';
import 'package:fastfood/theme.dart';
import 'package:fastfood/widgetMetod.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:string_capitalize/string_capitalize.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

/* Задачи
1. измерение можно ввести только г мл кол 
2. удаление исправить ошибку с возвратом 
3. фильтрация
*/

/* Функция для создание строк */
List<DataRow2> createStorageRows(
  List<StorageData> dataClass,
  BuildContext context,
  StorageBloc bloc,
  CustomTheme myColor,
  // List<int> selectedIndices,
  // VoidCallback onSetChanged,
  Map<int, bool> checkedRows,
  // int selectedIndices,
) {
  // int selectedIndices = context.read<StoragePageState>().selectedIndices;
  // final bloc = context.read<PurchasesCubit>();
  List<DataRow2> dataR = [];
  // int index = 0;
  // bool value0 = false;

  for (StorageData i in dataClass) {
    // print('i.powers:: ${i.powers}');
    // index += 1;

    // double sum = i.priceOfSom! * i.quantity!.toDouble();
    // number++;
    List<DataCell> dataC = [
      /// в блюде
      DataCell(
        Checkbox(
          value: i.inDishes,
          // value: value0,
          activeColor: myColor.colorTextInButton,
          onChanged: (bool? value1) {
            bloc.storageSQL.updateById(i.copyWith(inDishes: value1));
            // checkedRows[i.id] = value1 ?? false;
            // onSetChanged(); // 🔥 перерисовка
            // onSetChanged();
            // value0 = value1 ?? false;
            // print('*');
            // print(value1);
            // setState(() {
            //   // print('indexCopy: $indexCopy');
            //   // value[0] = value1 ?? false;
            //   // Map<String, List<dynamic>>? sPowers =
            //   //     bloc.state.staffPowers.powers;
            //   // sPowers![key]![0] = value[0];

            //   // bloc.staffSQL.updateById(
            //   //   bloc.state.staffPowers.copyWith(powers: sPowers),
            //   // );
            //   // pBloc.loadPasswordData();
            //   // pBloc.updateState(pBloc.state.copyWith(powers: sPowers));
            //   //  <----------------------
            //   // perm.allowed = value ?? false;
            // });
          },
        ),
      ),

      /// штрих-код
      // DataCell(textCell(i.barcode ?? '', TextAlign.left)),
      DataCell(
        textFieldCellWithReg2(
          i.barcode ?? '',
          context,
          bloc,
          TextAlign.left,
          (String title) {
            bloc.storageSQL.updateById(i.copyWith(barcode: title));
            Navigator.pop(context);
          },
          FilteringTextInputFormatter
              .digitsOnly, // С таким фильтром могут быть введены только числа
          1,
          myColor.colorText,
        ),
      ),

      /// название
      DataCell(
        // StatefulBuilder(
        //   builder: (context, setState) {
        // return
        textButtonCell(context, i.product, () {
          // setState(() {});

          // print(
          //   'Выбрана строка: ${i.product}\nid = ${i.id}  selectedIndices = ${bloc.state.selectedIndices}',
          // );
          // bloc.state.copyWith(selectedIndices: i.id);
          bloc.add(UpdateState(bloc.state.copyWith(selectedIndices: i.id)));
          // print(
          //   'Выбрана строка: ${i.product}\nid = ${i.id}  selectedIndices = $selectedIndices',
          // );
          // onSetChanged();
        }, textAlign: TextAlign.left),
        onLongPress: () {
          showDialogOk(context, i.product, () {});
        },
        //   },
        // ),
      ),

      /// кол
      // DataCell(textCell(i.quantity.toString(), TextAlign.left)),
      DataCell(
        textFieldCellWithReg2(
          i.quantity.toString(),
          context,
          bloc,
          TextAlign.left,
          (String title) {
            bloc.storageSQL.updateById(i.copyWith(quantity: int.parse(title)));
            Navigator.pop(context);
          },
          FilteringTextInputFormatter.allow(
            RegExp(r'^(0|[1-9]\d*)$'),
            // можно вводить только цифры если введён ноль в начале, то после него ничего быть не должно
          ),
          //RegExp(r'^[1-9][0-9]*$'),
          // регулярное выражение где можно записать первое число от 1 до 0 далее любые цифры
          1,
          myColor.colorText,
          separator: true,
        ),
      ),

      /// измерение
      DataCell(
        messageCell2(context, i.measuring, (title) {
          bloc.storageSQL.updateById(i.copyWith(measuring: title));
        }, textAlign: TextAlign.left),
      ),

      /// себестоимость
      // DataCell(textCell(i.costPrice.toString(), TextAlign.left)),
      DataCell(
        textFieldCellWithReg2(
          i.costPrice.toString(),
          context,
          bloc,
          TextAlign.left,
          (String title) {
            bloc.storageSQL.updateById(
              i.copyWith(costPrice: double.parse(title)),
            );
            Navigator.pop(context);
          },
          DoubleTextInputFormatter2(), // регулярное выражение где можно записать первое число от 1 до 0 далее любые цифры
          1,
          myColor.colorText,
          separator: true,
        ),
      ),

      /// стоимость
      // DataCell(textCell(i.price.toString(), TextAlign.left)),
      DataCell(
        textFieldCellWithReg2(
          i.price.toString(),
          context,
          bloc,
          TextAlign.left,
          (String title) {
            bloc.storageSQL.updateById(i.copyWith(price: double.parse(title)));
            Navigator.pop(context);
          },
          DoubleTextInputFormatter2(), // регулярное выражение где можно записать первое число от 1 до 0 далее любые цифры
          1,
          myColor.colorText,
          separator: true,
        ),
      ),

      // /// Num
      // DataCell(Text((dataClass.indexOf(i) + 1).toString())),
      // /// Должность
      // DataCell(
      //   textFieldCell(i.position, context, bloc, TextAlign.center, (
      //     String title,
      //   ) {
      //     bloc.updateStaffData(i.copyWith(position: title.saveText()));
      //     Navigator.pop(context);
      //   }, myColor.colorText),
      // ),

      // /// Логин
      // DataCell(
      //   textButtonCell(context, i.login, () {
      //     // print(
      //     //   'Выбрана строка: ${i.position}, ${i.login}\nid = ${i.id}  selectedIndices = $selectedIndices',
      //     // );
      //     // selectedIndices = index;
      //     selectedIndices = i.id;
      //     setState(() {
      //       bloc.add(UpdateState(bloc.state.copyWith(powersMap: i.powers, staffPowers: i)));
      //     });
      //     // setState(() {
      //     //   print(
      //     //     'Выбрана строка: ${i.position}, ${i.login}\nid = ${i.id}selectedIndices = $selectedIndices',
      //     //   );
      //     //   // selectedIndices = index;
      //     //   selectedIndices = i.id;
      //     //   bloc.add(UpdateState(bloc.state.copyWith(colorRow: 0xFF172C63)));
      //     // });
      //   }),
      // ),

      // /// Пароль
      // DataCell(
      //   PasswordCellWidget(i: i),
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
      //     myColor.colorText,
      //   ),
      // ),

      /// Удалить
      DataCell(
        deleteCell2(
          context,
          i.product,
          () {
            if (i.quantity == 0) {
              bloc.deleteStorageById(i);
              Navigator.pop(context);
            } else {
              showDialogOk(
                context,
                'С начала необходимо обнулить количество!',
                () {
                  Navigator.pop(context);
                },
              );
              // Navigator.pop(context);
            }
          },
          // i.product,
          // () {},
          // () => bloc.add(RemoveFromList(data: i)),
          // () => bloc.removePurchasesList(i)
        ),
      ),
      //***************** */

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
    // DataRow2 dataRow = DataRow2(cells: dataC);
    // dataR.add(
    //   DataRow2(
    //     cells: dataC,
    //     selected: selectedIndices == index,
    //     onSelectChanged: (selected) {
    //       setState(() {
    //         selectedIndices = selected == true ? index : null;
    //       });
    //       index+=1;
    //     },
    //   ),
    // );
    // Добавляем строку и контролируем выбор
    dataR.add(
      DataRow2(
        cells: dataC,

        // selected: selectedIndices == index, // устанавливаем выделение
        // onSelectChanged: (selected) {
        //   setState(() {
        //     selectedIndices = selected == true
        //         ? index
        //         : null; // изменяем индекс выбранной строки
        //   });

        //   // Вызываем дополнительную функцию при нажатии
        //   if (selected == true) {
        //     // Ваша дополнительная логика
        //     _onRowSelected(i);
        //   }
        //   index += 1;
        // },
        color: bloc.state.selectedIndices == i.id
            ? WidgetStateProperty.all(Colors.yellow)
            : null,
        //bloc.state.colorRow != 0? WidgetStateProperty.all(Color(bloc.state.colorRow)): null, //WidgetStateProperty.all(Colors.yellow), //selectedIndices == index? WidgetStateProperty.all(Colors.yellow): null, // меняем цвет строки на желтый
      ),
    );
  }
  return dataR;
}

SizedBox deleteCell2(BuildContext context, String title, Function func) {
  return SizedBox(
    width: double.infinity,
    child: IconButton(
      icon: Icon(Icons.delete),
      alignment: Alignment.center,
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            final myColor = CustomTheme(context: context);
            return AlertDialog(
              title: Text(
                'Уверены что хотите удалить - \n${title.capitalizeEach()} ?',
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /*  кнопка принятия */
                    TextButton(
                      onPressed: () {
                        func();
                        // Navigator.pop(context);
                      },
                      child: Text(
                        'OK',
                        style: TextStyle(color: myColor.colorText),
                      ),
                    ),
                    /* кнопка отмены */
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: myColor.colorText),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    ),
  );
}

SizedBox messageCell2(
  BuildContext context,
  String title,
  Function func, {

  // String message,
  TextAlign? textAlign,
}) {
  return SizedBox(
    width: double.infinity,
    child: TextButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            // final myColor = CustomTheme(context: context);
            return AlertDialog(
              title: Text(
                'На что изменить метод исчисления <${title.toUpperCase()}> ?',
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /*  кнопка принятия */
                    TextButton(
                      onPressed: () {
                        func('шт');
                        Navigator.pop(context);
                      },
                      child: Text(
                        'ШТ',
                        style: TextStyle(
                          color: CustomTheme(context: context).colorText,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        func('г');
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Г',
                        style: TextStyle(
                          color: CustomTheme(context: context).colorText,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        func('мл');
                        Navigator.pop(context);
                      },
                      child: Text(
                        'МЛ',
                        style: TextStyle(
                          color: CustomTheme(context: context).colorText,
                        ),
                      ),
                    ),
                    // /* кнопка отмены */
                    // TextButton(
                    //   onPressed: () => Navigator.pop(context),
                    //   child: Text(
                    //     'Cancel',
                    //     style: TextStyle(color: myColor.colorText),
                    //   ),
                    // ),
                  ],
                ),
                SizedBox.fromSize(size: Size(10, 20)),
                Center(
                  child: SizedBox.fromSize(
                    size: Size(140, 40),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Отмена',
                        style: TextStyle(
                          fontSize: 24,
                          color: CustomTheme(context: context).colorText,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: SizedBox(
        width: double.infinity,
        child: Text(
          title.capitalizeEach(),
          textAlign: textAlign,
          style: TextStyle(color: CustomTheme(context: context).colorText),
        ),
      ),
    ),
  );
}
