import 'package:flutter/material.dart';
import 'package:my_widgets/my_widgets.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  MenuItem menu = MenuItem(''); // Корневой элемент меню
  final String filename = 'database/menu.json';

  Future<void> _loadMenu() async {
    MenuItem? loadedMenu = await DirectoryFilesUtils.loadMenuFromFile(filename);
    setState(() {
      menu =
          loadedMenu ??
          MenuItem(''); // Предполагается, что menu объявлена в State
      print('Load');
    });
  }

  @override
  void initState() {
    super.initState();
    _loadMenu();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Container(
        // width: 100, menu.children[index +1].name
        decoration: BoxDecoration(color: Colors.blue),
        child: Column(
          children: [
            Text('Меню', style: TextStyle(fontSize: 40)),
            Divider(height: 2, color: Colors.black),
            Expanded(
              child: ListView.builder(
                itemCount: menu.children.length,
                itemBuilder: (BuildContext context, int index) {
                  // print(menu.children[0].name);
                  return MenuItemWidget(
                    title: menu.children[0].name,
                    menu: menu.children[index],
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

  const MenuItemWidget({required this.title, required this.menu, super.key});

  @override
  MenuItemWidgetState createState() => MenuItemWidgetState();
}

class MenuItemWidgetState extends State<MenuItemWidget> {
  bool isExpanded = false;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 70,
          width: double.infinity,
          child: TextButton(
            onPressed: () {
              if (widget.menu.isDirectory) {
                setState(() {
                  isExpanded = !isExpanded; // переключение состояния
                });
              }
            },
            child: Text(
              widget.title,
              style: TextStyle(fontSize: 25),
            ),
          ),
        ),
        if (isExpanded)
          ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: widget.menu.children.length,
            itemBuilder: (BuildContext context, int index) {
              final childMenu = widget.menu.children[index];
              return MenuItemWidget(
                title: childMenu.name,
                menu: childMenu,
              );
            },
          ),
      ],
    );
  }
}