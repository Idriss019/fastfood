import 'package:data_table_2/data_table_2.dart';
import 'package:fastfood/global_function.dart';
import 'package:fastfood/navBar.dart';
import 'package:flutter/material.dart';

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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Navbar(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              Center(child: Text('Меню', style: TextStyle(fontSize: 30))),
              Container(
                height: 200,
                color: Colors.amber,
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
