import 'package:flutter/material.dart';
import 'package:my_widgets/my_widgets.dart';

class MenuDirectoryPage extends StatefulWidget {
  final MenuItem rootItem;
  final String pathFile;

  const MenuDirectoryPage({super.key, required this.rootItem, required this.pathFile});

  @override
  State<MenuDirectoryPage> createState() => _MenuDirectoryPageState();
}

class _MenuDirectoryPageState extends State<MenuDirectoryPage> {
  @override
  Widget build(BuildContext context) {
    return DirectoryFiles(
      pathFile: widget.pathFile,
      menuItem: widget.rootItem,
      iconSize: 20.0,
      titleSize: 15,
      // stringHeight: 10,
    );
  }
}
