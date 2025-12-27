import 'package:flutter/material.dart';
import 'package:my_widgets/my_widgets.dart';
import 'package:string_capitalize/string_capitalize.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => MenuScreenState();
}

class MenuScreenState extends State<MenuScreen> {
  MenuItem menu = MenuItem(''); // Корневой элемент меню
  MenuItem startMenu = MenuItem(''); // Корневой элемент меню
  final String filename = 'database/menu.json';

  // стек для хранения истории навигации
  List<MenuItem> menuHistory = [];

  Future<void> _loadMenu() async {
    MenuItem? loadedMenu = await DirectoryFilesUtils.loadMenuFromFile(filename);
    setState(() {
      startMenu =
          loadedMenu ??
          MenuItem(''); // Предполагается, что menu объявлена в State
      menu = startMenu;
      print('Load');
    });
  }

  void refreshMenu() {
    setState(() {
      // _loadMenu();
    });
  }

  void navigateTo(MenuItem newMenu) {
    // Добавляем текущий уровень в историю перед переходом
    menuHistory.add(menu);
    setState(() {
      menu = newMenu;
    });
  }

  void goBack() {
    if (menuHistory.isNotEmpty) {
      setState(() {
        menu = menuHistory.removeLast();
      });
    }
  }

  void goToHome() {
    if (menuHistory.isNotEmpty) {
      setState(() {
        menu = startMenu;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadMenu();
  }

  @override
  Widget build(BuildContext context) {
    // print('menu.name : ${menu.children.length}');
    // final indexNumber = 0;
    // // data.children.map((entry) {
    // String nameMenu = '';
    // MenuItem valueItem = MenuItem('');
    return Flexible(
      flex: 1,
      child: Container(
        // width: 100, menu.children[index +1].name
        decoration: BoxDecoration(color: Colors.blue),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 40,
                  child: IconButton(
                    onPressed: () {
                      goToHome();
                    },
                    icon: Icon(Icons.home),
                  ),
                ),
                Text('Меню', style: TextStyle(fontSize: 40)),
                SizedBox(
                  width: 40,
                  child: IconButton(
                    onPressed: () {
                      goBack();
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                ),
              ],
            ),
            Divider(height: 2, color: Colors.black),
            // Expanded(
            //   child: ListView(
            //     children: menu.children.map((item) {
            //       return MenuItemWidget(title: item.name, menu: item);
            //     }).toList(),
            //   ),
            // ),
            // Expanded(
            //   child: ListView(
            //     children:   menu.children.map((item) {
            //       return MenuItemWidget(
            //         title: item.name,
            //         menu: item,
            //         isSelected: item == selectedMenu, // передача статуса
            //         onItemSelected: () => selectMenuItem(item),
            //       );
            //     }).toList(),
            //   ),
            Expanded(
              child: ListView.builder(
                itemCount: menu.children.length,
                itemBuilder: (BuildContext context, int index) {
                  // print(menu.children[0].name);
                  return MenuItemWidget(
                    title: menu.children[index].name,
                    menu: menu.children[index],
                    // indexMenu: index,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class MenuItemWidget extends StatelessWidget {
//   final String title;
//   final MenuItem menu;
//   const MenuItemWidget({required this.title, required this.menu, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 70,
//       width: double.infinity,
//       child: TextButton(
//         onPressed: () {
//           if (menu.isDirectory) {
//             print('object');
//             Expanded(
//               child: ListView.builder(
//                 itemCount: menu.children.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   // print(menu.children[0].name);
//                   return MenuItemWidget(
//                     title: menu.children[0].name,
//                     menu: menu.children[index],
//                   );
//                 },
//               ),
//             );
//           }
//         },
//         // style: TextButton.styleFrom(
//         //   fixedSize: const Size(300, 100),
//         // ),
//         child: Text(title, style: TextStyle(fontSize: 25)),
//       ),
//     );
//   }
// }
class MenuItemWidget extends StatefulWidget {
  final String title;
  final MenuItem menu;
  // final int indexMenu;

  MenuItemWidget({
    required String title,
    required this.menu,
    // required this.indexMenu,
    super.key,
  }):title = title.capitalize();

  @override
  MenuItemWidgetState createState() => MenuItemWidgetState();
}

class MenuItemWidgetState extends State<MenuItemWidget> {
  // @override
  // void didUpdateWidget(covariant MenuItemWidget oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   if (oldWidget.isReset != widget.isReset && widget.isReset) {
  //     // Когда флаг сброса меняется на true, скрываем дочерние
  //     setState(() {
  //       isExpanded = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if(widget.menu.isDirectory)
        SizedBox(
          height: 70,
          width: double.infinity,
          child: TextButton(
                onPressed: () {
                  final parentState = context.findAncestorStateOfType<MenuScreenState>();
                  if (widget.menu.children.isNotEmpty) {
                    parentState?.navigateTo(widget.menu);
                  }
                },
                child: Text(widget.title, style: TextStyle(fontSize: 25)),
              )
        )else Container(
          color: Colors.grey,
          height: 100,
          width: double.infinity,
          child: TextButton(
                onPressed: () {
                  final parentState = context.findAncestorStateOfType<MenuScreenState>();
                  if (widget.menu.children.isNotEmpty) {
                    parentState?.navigateTo(widget.menu);
                  }
                },
                child: Text(widget.title, style: TextStyle(fontSize: 25)),
              ) // пустой виджет, если условие не выполнено
        )
        //   TextButton(
        //     onPressed: () {
        //       final parentState = context
        //           .findAncestorStateOfType<MenuScreenState>();
        //       if (widget.menu.children.isNotEmpty) {
        //         // Переход на выбранное подменю
        //         parentState?.navigateTo(widget.menu);
        //       }
        //     },
        //     child: Text(widget.title, style: TextStyle(fontSize: 25)),
        //   ),
        // ),
        // if (isExpanded && !widget.isReset)
        //   ListView.builder(
        //     shrinkWrap: true,
        //     physics: ClampingScrollPhysics(),
        //     itemCount: widget.menu.children.length,
        //     itemBuilder: (BuildContext context, int index) {
        //       // resetWidget = false;
        //       final childMenu = widget.menu.children[index];
        //       return MenuItemWidget(
        //         isReset: widget.isReset,
        //         title: childMenu.name,
        //         menu: childMenu,
        //         isSelected:
        //             widget.menu.isDirectory &&
        //             (childMenu == widget.menu.children[index]),
        //         onItemSelected: widget.onItemSelected,
        //       );
        //     },
        //   ),
      ],
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Column(
  //     children: [
  //       SizedBox(
  //         height: 70,
  //         width: double.infinity,
  //         child: TextButton(
  //           onPressed: () {
  //             if (widget.menu.isDirectory) {
  //               // при нажатии скрывать/показывать
  //               setState(() {
  //                 isExpanded = !isExpanded;
  //               });
  //             } else {
  //               // при выборе файла - закрывать всё и запускать что надо
  //               widget.onItemSelected();
  //               // Можно дополнительно "запустить" или обновить состояние
  //             }
  //           },
  //           child: Text(widget.title, style: TextStyle(fontSize: 25)),
  //         ),
  //       ),
  //       if (isExpanded)
  //         ListView.builder(
  //           shrinkWrap: true,
  //           physics: ClampingScrollPhysics(),
  //           itemCount: widget.menu.children.length,
  //           itemBuilder: (BuildContext context, int index) {
  //             final childMenu = widget.menu.children[index];
  //             return MenuItemWidget(
  //               title: childMenu.name,
  //               menu: childMenu,
  //               isSelected:
  //                   widget.menu.isDirectory &&
  //                   (childMenu == widget.menu.children[index]),
  //               onItemSelected: widget.onItemSelected,
  //             );
  //           },
  //         ),
  //     ],
  //   );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Column(
  //     children: [
  //       SizedBox(
  //         height: 70,
  //         width: double.infinity,
  //         child: TextButton(
  //           onPressed: () {
  //             if (widget.menu.isDirectory) {
  //               setState(() {
  //                 isExpanded = !isExpanded; // переключение состояния
  //               });
  //             }
  //             if (widget.menu.isDirectory == false) {
  //               // isExpanded = !isExpanded;
  //               print('Press False!');
  //               // setState(() {
  //               //   isExpanded = !isExpanded; // переключение состояния
  //               // });
  //             }
  //           },
  //           child: Text(widget.title, style: TextStyle(fontSize: 25)),
  //         ),
  //       ),
  //       if (isExpanded)
  //         ListView.builder(
  //           shrinkWrap: true,
  //           physics: ClampingScrollPhysics(),
  //           itemCount: widget.menu.children.length,
  //           itemBuilder: (BuildContext context, int index) {
  //             final childMenu = widget.menu.children[index];
  //             return MenuItemWidget(title: childMenu.name, menu: childMenu);
  //           },
  //         ),
  //       // if (isExpanded == false)
  //       // ListView.builder(
  //       //   shrinkWrap: true,
  //       //   physics: ClampingScrollPhysics(),
  //       //   itemCount: widget.menu.children.length,
  //       //   itemBuilder: (BuildContext context, int index) {
  //       //     final childMenu = widget.menu.children[index];
  //       //     return MenuItemWidget(title: childMenu.name, menu: childMenu);
  //       //   },
  //       // ),
  //     ],
  //   );
  // }
}
