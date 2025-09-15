import 'package:data_table_2/data_table_2.dart';
import 'package:fastfood/global_function.dart';
import 'package:fastfood/names/creatingDishes/bloc/creating_dishes_bloc.dart';
import 'package:fastfood/navBar.dart';
import 'package:fastfood/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateDishesPage extends StatefulWidget {
  CreateDishesPage({super.key});

  @override
  State<CreateDishesPage> createState() => _CreateDishesPageState();
}

class _CreateDishesPageState extends State<CreateDishesPage> {
  // Ваша структура меню
  final Map<String, dynamic> menu = {
    "fresh": {"Apple", "Orange"},
    "tea": {
      "cloud": {"black", "green"},
      "hot": {"black", "green"},
    },
    "icecream": {
      "cold": {
        "grey": {"qwer", "asdf"},

        "red": {"qwer", "asdf"},
      },
      "hot": {
        "grey": {"qwer", "asdf"},

        "red": {"qwer", "asdf"},
      },
    },
  };
  // Текущий путь навигации
  final List<String> _currentPath = [];
  // Текущий данные
  dynamic _currentData;

  @override
  void initState() {
    super.initState();
    _currentData = menu;
  }

  @override
  Widget build(BuildContext context) {
    double heightRow = 60;
    Color invertColor = CustomTheme(context: context).colorBorder;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Navbar(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              Center(child: Text('Меню', style: TextStyle(fontSize: 30))),
              Container(
                margin: EdgeInsets.only(bottom: 10, top: 10),
                height: 180,
                width: double.infinity,
                // color: Colors.amber,
                decoration: BoxDecoration(
                  border: Border.all(color: invertColor, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: MenuDirectoryPage(data: menu, title: 'Меню'),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 300,
                      child: Center(
                        child: Text('Блюдо :', style: TextStyle(fontSize: 40)),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        child: TextField(
                          autofocus: true,
                          decoration: InputDecoration(
                            hintText: 'Найти или создать',
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
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 300,
                      child: Center(
                        child: Text('Путь :', style: TextStyle(fontSize: 25)),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        // padding: EdgeInsets.only(top: 20, bottom: 20),
                        margin: EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 10,
                          bottom: 10,
                        ),
                        // color: Colors.white,
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Text(
                          "Яблоки/фреш/со льдем",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 25),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 10.0),
              //   child: Row(
              //     // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: [
              //       SizedBox(
              //         width: 300,
              //         child: Center(
              //           child: Text('Ингредиент :', style: TextStyle(fontSize: 30)),
              //         ),
              //       ),
              //       Expanded(
              //         child: SizedBox(
              //           child: TextField(
              //             autofocus: true,
              //             decoration: InputDecoration(
              //               hintText: 'Найти',
              //               border: OutlineInputBorder(
              //                 borderRadius: BorderRadius.circular(10),
              //                 borderSide: BorderSide(
              //                   color: Colors.black, // Не работает!
              //                   width: 5,
              //                 ),
              //               ),
              //             ),
              //             style: TextStyle(fontSize: 25),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: heightRow,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 45,
                    right: 0,
                    bottom: 10,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 53),
                        child: Container(
                          decoration: BoxDecoration(
                            // border:
                            //     Border.all(color: Colors.black)
                          ),
                          child: Text(
                            'Ингредиент :',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          // width: 200,
                          // height: 200,
                          child: Center(
                            child: BlocBuilder<CreatingDishesBloc, CreatingDishesState>(
                              builder: (context, state) {
                                //        if (state.errorTitle.isNotEmpty) {
                                //   showDialogOk(context, state.errorTitle);
                                // }
                                // if (state.searchByBarcode) {}
                                return TextField(
                                  onChanged: (value) {},
                                  cursorColor: invertColor,
                                  // controller: TextEditingController.fromValue(
                                  //   TextEditingValue(text: state.barcode),
                                  // )..selection = TextSelection.collapsed(
                                  //     offset: state.barcode.length),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: invertColor,
                                        width: 1.5,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: invertColor,
                                        width: 1.5,
                                      ),
                                    ),
                                  ),
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter
                                        .digitsOnly, // С таким фильтром могут быть введены только числа
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0, right: 13),
                        child: Container(
                          decoration: BoxDecoration(
                            // border:
                            //     Border.all(color: Colors.black)
                          ),
                          child: Text(
                            'Количество',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 160,
                        // height: 200,
                        child: Center(
                          child: BlocBuilder<CreatingDishesBloc, CreatingDishesState>(
                            builder: (context, state) {
                              return TextField(
                                onChanged: (value) {},

                                // controller: TextEditingController.fromValue(
                                //   TextEditingValue(text: state.quantity),
                                // )..selection = TextSelection.collapsed(
                                //     offset: state.quantity.length),
                                cursorColor: invertColor,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                                decoration: InputDecoration(
                                  // suffixIcon: IconButton(
                                  //     onPressed: () {},
                                  //     icon: Icon(Icons.search)),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: invertColor,
                                      width: 1.5,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: invertColor,
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                    RegExp(r'\b[1-9][0-9]{0,4}'),
                                  ), // С таким фильтром могут быть введены только числа
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      // Container(
                      //   padding: const EdgeInsets.only(left: 10.0),
                      //   child: DropdownMenu<String>(
                      //     initialSelection: 'шт',
                      //     enableFilter: true,
                      //     enableSearch: false,
                      //     dropdownMenuEntries: const [
                      //       DropdownMenuEntry(value: 'шт', label: 'шт'),
                      //       DropdownMenuEntry(value: 'г', label: 'г'),
                      //       DropdownMenuEntry(value: 'мл', label: 'мл'),
                      //       DropdownMenuEntry(value: 'кг', label: 'кг'),
                      //       DropdownMenuEntry(value: 'л', label: 'л'),
                      //     ],
                      //     inputDecorationTheme: InputDecorationTheme(
                      //       border: InputBorder(borderSide: BorderSide.none)
                      //       // outlineBorder: BorderSide(width: 2, color: Colors.white),
                      //       // border: Border.all(color: Colors.white, width: 2)
                      //     ),
                      //   ),
                      // ),
                      Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: DropdownMenu<String>(
                          textStyle: TextStyle(fontSize: 17),
                          initialSelection: 'шт',
                          enableFilter: true,
                          enableSearch: false,
                          dropdownMenuEntries: const [
                            DropdownMenuEntry(value: 'шт', label: 'шт'),
                            DropdownMenuEntry(value: 'г', label: 'г'),
                            DropdownMenuEntry(value: 'мл', label: 'мл'),
                            DropdownMenuEntry(value: 'кг', label: 'кг'),
                            DropdownMenuEntry(value: 'л', label: 'л'),
                          ],
                          inputDecorationTheme: const InputDecorationTheme(
                            // border: OutlineInputBorder(
                            //   borderSide: BorderSide(
                            //     color: Colors.blue, // цвет границы
                            //     width: 3.0, // толщина границы
                            //   ),
                            //   borderRadius: BorderRadius.all(
                            //     Radius.circular(8),
                            //   ), // скругление углов (по желанию)
                            // ),
                            enabledBorder: OutlineInputBorder(
                              // граница в обычном состоянии
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              // граница при фокусе
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 4.0,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(color: invertColor, width: 2.5),
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            '+',
                            style: TextStyle(fontSize: 25, color: invertColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(bottom: 8),
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
                      customDataColumn('Удалить', TextAlign.center, 13, 50),
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
              Container(
                padding: EdgeInsets.only(bottom: 8),
                // height: 70,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                          border: Border.all(color: invertColor, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.delete, size: 40),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                          border: Border.all(color: invertColor, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.create, size: 40),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: invertColor, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Создать',
                            style: TextStyle(fontSize: 40, color: invertColor),
                          ),
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
    );
  }
}

class MenuDirectoryPage extends StatefulWidget {
  final Map<String, dynamic> data;
  final String title;

  const MenuDirectoryPage({super.key, required this.data, this.title = 'Меню'});

  @override
  State<MenuDirectoryPage> createState() => _MenuDirectoryPageState();
}

class _MenuDirectoryPageState extends State<MenuDirectoryPage> {
  // Для хранения состояния раскрытия каждого ключа
  final Map<String, bool> _expanded = {};

  @override
  Widget build(BuildContext context) {
    final keys = widget.data.keys.toList();

    return Scaffold(
      // appBar: AppBar(title: Text(widget.title)),
      body: ListView(children: _buildTilesStart(widget.data)),
    );
  }

  ExpansionTile ifMap(String key, Map<String, dynamic> value) {
    print('Mapp');
    return ExpansionTile(
      key: PageStorageKey<dynamic>(key),
      title: Text(key),
      leading: Icon(Icons.folder, color: Colors.amber),
      children: value.entries.map((entry) {
        final entryValue = entry.value;
        return ListTile(
          leading: Icon(
            entryValue is Map ? Icons.folder : Icons.insert_drive_file,
            color: entryValue is Map ? Colors.amber : Colors.grey,
          ),
          title: Text(entry.key),
          trailing: entryValue is Map || entryValue is Set
              ? Icon(Icons.chevron_right)
              : null,
          onTap: () {
            if (entryValue is Map<String, dynamic> ||
                entryValue is Set<String>) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MenuDirectoryPage(
                    data: entryValue is Map<String, dynamic> ? entryValue : {},
                    title: entry.key,
                  ),
                ),
              );
            } else {
              // Можно показать диалог или ничего не делать
            }
          },
        );
      }).toList(),
    );
  }

  ExpansionTile ifSet(String key, Set<String> value, BuildContext context) {
    print('Sett');
    return ExpansionTile(
      key: PageStorageKey<String>(key),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(key),
          IconButton(
            onPressed: () {
              print('press');
            },
            icon: Icon(Icons.folder),
          ),
          IconButton(
            onPressed: () {
              print('dell');
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      leading: Icon(Icons.folder, color: Colors.amber),
      children: value.map((item) {
        return ListTile(
          leading: Icon(Icons.insert_drive_file, color: Colors.grey),
          title: Text(item),
          onTap: () {
            // Можно показать диалог или обработать выбор
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Вы выбрали'),
                content: Text(item),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('OK'),
                  ),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }

  List<Widget> _buildTilesStart(Map<String, dynamic> data) {
    return data.entries.map((entry) {
      final key = entry.key;
      final value = entry.value;

      if (value is Map<String, dynamic>) {
        print('Start Map');
        // Если значение - Map, создаём ExpansionTile с рекурсивным вызовом
        return ExpansionTile(
          key: PageStorageKey<String>(key),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(key),
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text('+', style: TextStyle(fontSize: 30)),
                  ),
                  IconButton(
                    onPressed: () {
                      print('rename');
                    },
                    icon: Icon(Icons.create),
                  ),
                  IconButton(
                    onPressed: () {
                      print('dell');
                    },
                    icon: Icon(Icons.delete),
                  ),
                ],
              ),
            ],
          ),
          leading: Icon(Icons.folder, color: Colors.amber),
          children: _buildTiles(value),
        );
      } else if (value is Set<String>) {
        print('Start Set');
        // Если значение - Set, показываем ExpansionTile с листами
        return ExpansionTile(
          key: PageStorageKey<String>(key),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(key),
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text('+', style: TextStyle(fontSize: 30)),
                  ),
                  IconButton(
                    onPressed: () {
                      print('rename');
                    },
                    icon: Icon(Icons.create),
                  ),
                  IconButton(
                    onPressed: () {
                      print('dell');
                    },
                    icon: Icon(Icons.delete),
                  ),
                ],
              ),
            ],
          ),
          leading: Icon(Icons.folder, color: Colors.amber),
          children: value.map((item) {
            return ListTile(
              leading: Icon(Icons.insert_drive_file, color: Colors.grey),
              title: Text(item),
              onTap: () {
                // Здесь можно обработать выбор файла/элемента
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Вы выбрали'),
                    content: Text(item),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
              },
            );
          }).toList(),
        );
      } else {
        // Если значение не Map и не Set — просто показываем элемент
        return ListTile(title: Text(key));
      }
    }).toList();
  }

  List<Widget> _buildTiles(Map<String, dynamic> data) {
    return data.entries.map((entry) {
      final key = entry.key;
      final value = entry.value;

      if (value is Map<String, dynamic>) {
        print('Map $key');
        // Если значение - Map, создаём ExpansionTile с рекурсивным вызовом
        return ExpansionTile(
          key: PageStorageKey<String>(key),
          controlAffinity: ListTileControlAffinity.leading,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.folder, color: Colors.amber),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(key),
                  ),
                ],
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text('+', style: TextStyle(fontSize: 30)),
                  ),
                  IconButton(
                    onPressed: () {
                      print('rename');
                    },
                    icon: Icon(Icons.create),
                  ),
                  IconButton(
                    onPressed: () {
                      print('dell');
                    },
                    icon: Icon(Icons.delete),
                  ),
                ],
              ),
            ],
          ),
          leading: Icon(Icons.chevron_right),
          children: _buildTiles(value),
        );
      } else if (value is Set<String>) {
        print('Set $value');
        // Если значение - Set, показываем ExpansionTile с листами
        return ExpansionTile(
          key: PageStorageKey<String>(key),
          controlAffinity: ListTileControlAffinity.leading,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.folder, color: Colors.amber),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(key),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      print('rename');
                    },
                    icon: Icon(Icons.create),
                  ),
                  IconButton(
                    onPressed: () {
                      print('dell');
                    },
                    icon: Icon(Icons.delete),
                  ),
                ],
              ),
            ],
          ),
          // leading: Icon(Icons.chevron_right),
          children: value.map((item) {
            return ListTile(
              leading: Icon(Icons.insert_drive_file, color: Colors.grey),
              title: Text(item),
              onTap: () {
                // Здесь можно обработать выбор файла/элемента
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Вы выбрали'),
                    content: Text(item),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
              },
            );
          }).toList(),
        );
      } else {
        // Если значение не Map и не Set — просто показываем элемент
        return ListTile(title: Text(key));
      }
    }).toList();
  }
}
