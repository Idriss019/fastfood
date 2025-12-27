import 'package:data_table_2/data_table_2.dart';
import 'package:fastfood/global_function.dart';
import 'package:fastfood/navBar.dart';
import 'package:fastfood/presentation/staff/widget/inputNewStaffDialog.dart';
import 'package:fastfood/theme.dart';
import 'package:flutter/material.dart';

class Staff extends StatefulWidget {
  const Staff({super.key});

  @override
  State<Staff> createState() => _StaffState();
}

class _StaffState extends State<Staff> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color invertColor = CustomTheme(context: context).colorBorder;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Navbar(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(),
                    Text(
                      'Список пользователей',
                      style: TextStyle(fontSize: 30),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: InputNewStaffDialog(),
                    ),
                  ],
                ),
              ),
              Container(
                height: 270,
                margin: EdgeInsets.only(bottom: 8),
                color: Colors.cyan,
                child: DataTable2(
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
                    customDataColumn(
                      'Пароль',
                      TextAlign.center,
                      18,
                      180,
                      maxLine: 2,
                    ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Таблица полномочий ↓', style: TextStyle(fontSize: 30)),
                  Text('Логин: Администратор', style: TextStyle(fontSize: 30)),
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10, top: 10),
                height: 280,
                width: double.infinity,
                // color: Colors.amber,
                decoration: BoxDecoration(
                  border: Border.all(color: invertColor, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: PermissionsTableWidget(),
              ),
            ],
          ),
        ),
      ),
    );
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

class PermissionsTableWidget extends StatefulWidget {
  const PermissionsTableWidget({super.key});

  @override
  State<PermissionsTableWidget> createState() => _PermissionsTableWidgetState();
}

class _PermissionsTableWidgetState extends State<PermissionsTableWidget> {
  // Список полномочий с разрешениями и описаниями
  final List<Permission> _permissions = [
    Permission(
      name: 'Отмена заказа',
      allowed: false,
      page: 'Заказ',
      description: 'Позволяет отменять заказы клиентов',
    ),
    Permission(
      name: 'Изменение цен',
      allowed: true,
      page: 'Заказ',
      description: 'Дает возможность редактировать цены товаров',
    ),
    Permission(
      name: 'Закуп товара',
      allowed: false,
      page: 'Закуп',
      description: 'Разрешает создание и подтверждение заказов на закуп',
    ),
    Permission(
      name: 'Отмена заказа',
      allowed: false,
      page: 'Заказ',
      description: 'Позволяет отменять заказы клиентов',
    ),
    Permission(
      name: 'Изменение цен',
      allowed: true,
      page: 'Заказ',
      description: 'Дает возможность редактировать цены товаров',
    ),
    Permission(
      name: 'Закуп товара',
      allowed: false,
      page: 'Закуп',
      description: 'Разрешает создание и подтверждение заказов на закуп',
    ),

    // Можно добавить другие полномочия
  ];

  @override
  Widget build(BuildContext context) {
    Color invertColor = CustomTheme(context: context).white;
    return DataTable2(
      isVerticalScrollBarVisible: false,
      // checkboxHorizontalMargin: 51,
      // dividerThickness: 0,
      headingRowColor:
          WidgetStateProperty<Color?>.fromMap(<WidgetStatesConstraint, Color?>{
            WidgetState.error: Colors.red,
            WidgetState.hovered & WidgetState.focused: Colors.blueAccent,
            WidgetState.focused: Colors.blue,
            ~WidgetState.disabled: CustomTheme(context: context).colorText,
          }),
      columns: [
        DataColumn(
          label: Text('Полномочия', style: TextStyle(color: invertColor)),
        ),
        DataColumn(
          label: Text('Разрешение', style: TextStyle(color: invertColor)),
        ),
        DataColumn(
          label: Text('Страница', style: TextStyle(color: invertColor)),
        ),
        DataColumn(
          label: Text('Полное описание', style: TextStyle(color: invertColor)),
        ),
      ],
      rows: _permissions.map((perm) {
        return DataRow(
          cells: [
            DataCell(Text(perm.name)),
            DataCell(
              Checkbox(
                value: perm.allowed,
                onChanged: (bool? value) {
                  setState(() {
                    perm.allowed = value ?? false;
                  });
                },
              ),
            ),
            DataCell(Text(perm.page)),
            DataCell(
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Полное описание'),
                      content: Text(perm.description),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                child: Text(perm.description, overflow: TextOverflow.ellipsis),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
