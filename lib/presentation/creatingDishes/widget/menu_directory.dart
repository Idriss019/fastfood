import 'package:fastfood/presentation/creatingDishes/bloc/creating_dishes_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_widgets/my_widgets.dart';

class MenuDirectoryPage extends StatefulWidget {
  final MenuItem rootItem;
  final String pathFile;
  final Color? invertColor;

  const MenuDirectoryPage({
    super.key,
    required this.rootItem,
    required this.pathFile,
    this.invertColor,
  });

  @override
  State<MenuDirectoryPage> createState() => _MenuDirectoryPageState();
}

class _MenuDirectoryPageState extends State<MenuDirectoryPage> {
  late CreatingDishesBloc createDBloc;

  @override
  void initState() {
    super.initState();
    createDBloc = context.read<CreatingDishesBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatingDishesBloc, CreatingDishesState>(
      builder: (context, state) {
        return DirectoryFiles(
          invertColor: widget.invertColor ?? Colors.black,
          pathFile: widget.pathFile,
          menuItem: widget.rootItem,
          iconSize: 20.0,
          titleSize: 15,
          pressOnFile: (MenuItem menu) {
            // print(menu.name);
            // createDBloc.add(
            //   UpdataState(
            //     pState: state.copyWith(
            //       dishes: menu.name,
            //       pathMenu: menu.path.join('/'),
            //     ),
            //   ),
            // );
            createDBloc.add(DishesInput(menu.name, menu.path.join('/')));
          },
          // stringHeight: 10,
        );
      },
    );
  }
}
