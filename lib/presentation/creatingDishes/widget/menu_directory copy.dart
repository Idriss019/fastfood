import 'package:flutter/material.dart';

class MenuDirectoryPage extends StatefulWidget {
  // final Map<String, dynamic> data;
  // final String title;
  // final Function func;

  const MenuDirectoryPage({
    super.key,
    // required this.data,
    // this.title = 'Меню',
    // required this.func,
  });

  @override
  State<MenuDirectoryPage> createState() => _MenuDirectoryPageState();
}

class _MenuDirectoryPageState extends State<MenuDirectoryPage> {
  // Текущий путь навигации
  final List<String> _currentPath = [];

  // Текущий данные
  dynamic _currentData;

  // Метод для навигации вглубь структуры
  void navigateTo(String key) {
    setState(() {
      _currentPath.add(key);
      print('_currentPath : $_currentPath');

      // Получаем данные для текущего уровня 2  МЕТОД
      Map<String, dynamic> temp = menu;
      for (String path in _currentPath) {
        if (temp[path] is Map) {
          temp = temp[path];
          _currentData = temp;
        } else if (temp[path] is Set) {
          _currentData = temp[path];
        }
      }
    });
  }

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
        "grey": {},

        // "red": {"qwer", "asdf"},
      },
    },
  };

  // Для хранения состояния раскрытия каждого ключа
  final Map<String, bool> _expanded = {};

  @override
  void initState() {
    super.initState();
    _currentData = menu;
  }

  @override
  Widget build(BuildContext context) {
    // final keys = widget.data.keys.toList();

    return Scaffold(
      // appBar: AppBar(title: Text(widget.title)),
      body: ListView(children: _buildTilesStart(menu, () {})),
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
                    // func: widget.func,
                    // data: entryValue is Map<String, dynamic> ? entryValue : {},
                    // title: entry.key,
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

  List<Widget> _buildTilesStart(Map<String, dynamic> data, Function func) {
    return data.entries.map((entry) {
      final key = entry.key;
      final value = entry.value;
      // func(key);
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
          children: _buildTiles(value, () {}),
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

  List<Widget> _buildTiles(Map<String, dynamic> data, Function func) {
    return data.entries.map((entry) {
      final key = entry.key;
      final value = entry.value;
      // func(key);
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
          children: _buildTiles(value, () {}),
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
