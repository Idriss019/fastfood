import 'package:data_table_2/data_table_2.dart';
import 'package:fastfood/global_function.dart';
import 'package:fastfood/presentation/creatingDishes/bloc/creating_dishes_bloc.dart';
import 'package:fastfood/presentation/creatingDishes/widget/menu_directory.dart';
import 'package:fastfood/navBar.dart';
import 'package:fastfood/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_widgets/my_widgets.dart';

class CreateDishesPage extends StatefulWidget {
  const CreateDishesPage({super.key});

  @override
  State<CreateDishesPage> createState() => _CreateDishesPageState();
}

class _CreateDishesPageState extends State<CreateDishesPage> {
  final TextEditingController _dishesCont = TextEditingController();
  final TextEditingController _priceCont = TextEditingController();
  final TextEditingController _ingredientCont = TextEditingController();
  final TextEditingController _quantityCont = TextEditingController();
  final TextEditingController _measuringCont = TextEditingController();
  late CreatingDishesBloc createDBloc;
  MenuItem menu = MenuItem(''); // Корневой элемент меню
  final String filename = 'database/menu.json';

  @override
  void initState() {
    super.initState();
    _loadMenu();
    createDBloc = context.read<CreatingDishesBloc>();
    createDBloc.add(UpdataStorageData());
  }

  @override
  void dispose() {
    _dishesCont.dispose();
    _priceCont.dispose();
    _ingredientCont.dispose();
    _quantityCont.dispose();
    _measuringCont.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final createDBloc = context.watch<CreatingDishesBloc>();
    // Обновляем контроллер при изменении состояния
    final String dishes = createDBloc.state.dishes;
    if (_dishesCont.text != dishes) {
      _dishesCont.value = TextEditingValue(
        text: dishes,
        selection: TextSelection.collapsed(offset: dishes.length),
      );
    }
    final String price = createDBloc.state.price;
    if (price != '' && _priceCont.text != price) {
      _priceCont.value = TextEditingValue(
        text: price,
        selection: TextSelection.collapsed(offset: price.length),
      );
    }
    final String ingredientTitle = createDBloc.state.ingredientTitle;
    if (_ingredientCont.text != ingredientTitle) {
      _ingredientCont.value = TextEditingValue(
        text: ingredientTitle,
        selection: TextSelection.collapsed(offset: ingredientTitle.length),
      );
    }
    final String quantity = createDBloc.state.quantity;
    if (_quantityCont.text != quantity) {
      _quantityCont.value = TextEditingValue(
        text: quantity,
        selection: TextSelection.collapsed(offset: quantity.length),
      );
    }
    final String measuring = createDBloc.state.measuring;
    if (measuring != '' && _measuringCont.text != measuring) {
      _measuringCont.value = TextEditingValue(
        text: measuring,
        selection: TextSelection.collapsed(offset: measuring.length),
      );
    }
  }

  Future<void> _loadMenu() async {
    MenuItem? loadedMenu = await DirectoryFilesUtils.loadMenuFromFile(filename);
    setState(() {
      menu =
          loadedMenu ??
          MenuItem(''); // Предполагается, что menu объявлена в State
    });
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  Text('Меню', style: TextStyle(fontSize: 30)),
                  TextButton(
                    onPressed: () async {
                      String? newName = await showDialog<String>(
                        context: context,
                        builder: (context) {
                          String tempName = '';
                          return AlertDialog(
                            title: Text('Добавить элемент'),
                            content: TextField(
                              autofocus: true,
                              decoration: InputDecoration(hintText: 'Название'),
                              onChanged: (val) => tempName = val,
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, null),
                                child: Text('Отмена'),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, tempName),
                                child: Text('ОК'),
                              ),
                            ],
                          );
                        },
                      );
                      if (newName != null && newName.isNotEmpty) {
                        setState(() {
                          menu.children.add(
                            MenuItem(newName, parentPath: menu.path),
                          );
                        });
                        // Автоматическое сохранение после добавления
                        DirectoryFilesUtils.saveMenuToFile(menu, filename);
                      }
                    },
                    child: Text(
                      '+',
                      style: TextStyle(fontSize: 30, color: invertColor),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10, top: 10),
                height: 154,
                width: double.infinity,
                // color: Colors.amber,
                decoration: BoxDecoration(
                  border: Border.all(color: invertColor, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: MenuDirectoryPage(
                  rootItem: menu,
                  pathFile: filename,
                  invertColor: invertColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 20),
                      // width: 300,
                      child: Center(
                        child: Text('Блюдо :', style: TextStyle(fontSize: 28)),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        child: TextField(
                          controller: _dishesCont,
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
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      width: 90,
                      child: TextField(
                        enabled: false,
                        decoration: InputDecoration(
                          labelText: 'себестоимость',
                          hintText: 'себестоимость',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.black, // Не работает!
                              width: 5,
                            ),
                          ),
                        ),
                        style: TextStyle(fontSize: 20),
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
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 20),
                      // width: 300,
                      child: Center(
                        child: Text('Путь :', style: TextStyle(fontSize: 25)),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        // padding: EdgeInsets.only(top: 20, bottom: 20),
                        margin: EdgeInsets.only(
                          // left: 10,
                          right: 10,
                          // top: 10,
                          // bottom: 10,
                        ),
                        // color: Colors.white,
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: invertColor),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child:
                            BlocBuilder<
                              CreatingDishesBloc,
                              CreatingDishesState
                            >(
                              builder: (context, state) {
                                return Text(
                                  state.pathMenu,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 25),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                );
                              },
                            ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      width: 60,
                      child: TextField(
                        controller: _priceCont,
                        // enabled: false,
                        decoration: InputDecoration(
                          labelText: 'Цена',
                          hintText: 'Цена',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.black, // Не работает!
                              width: 5,
                            ),
                          ),
                        ),
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: heightRow,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 0,
                    bottom: 10,
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 20),
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
                                  controller: _ingredientCont,
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
                        width: 60,
                        // height: 200,
                        child: Center(
                          child: BlocBuilder<CreatingDishesBloc, CreatingDishesState>(
                            builder: (context, state) {
                              return TextField(
                                controller: _quantityCont,
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
                          controller: _measuringCont,
                          width: 90,
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
