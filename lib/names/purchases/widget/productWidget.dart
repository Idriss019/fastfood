import 'package:fastfood/names/purchases/bloc/purchases_bloc.dart';
import 'package:fastfood/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({
    super.key,
    required this.heightRow,
    required this.invertColor,
  });

  final double heightRow;
  final Color invertColor;

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  late PurchasesBloc purchasesBloc;
  final TextEditingController _productCont = TextEditingController();
  // double searchHeight = 0;
  // double heightBorder = 30;
  // List foundList = [];

  // DropDownList dropList = DropDownList(heightContainer: 40);
  @override
  void initState() {
    super.initState();
    purchasesBloc = context.read<PurchasesBloc>();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // final purchasesBloc = context.watch<PurchasesBloc>();
    // Обновляем контроллер при изменении состояния
    final String product = purchasesBloc.state.product;
    if (_productCont.text != product) {
      _productCont.value = TextEditingValue(
        text: product,
        selection: TextSelection.collapsed(offset: product.length),
      );
    }
  }

  @override
  void dispose() {
    _productCont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final blocStorage = context.watch<StorageCubit>();
    final myColor = CustomTheme(context: context);
    // List storageList = blocStorage.state.storageList
    //     .map((toElement) => toElement.product)
    //     .toList();
    // DropDownList dropList = DropDownList(heightContainer: 30);
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 8),
          // height: heightRow,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 45.0, right: 71),
                child: Container(
                  // margin: const EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                    // border:
                    //     Border.all(color: Colors.black)
                  ),
                  child: Text(
                    'Название',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 45.0),
                  // width: double.infinity,
                  // height: 200,
                  child: Center(
                    child: BlocBuilder<PurchasesBloc, PurchasesState>(
                      builder: (context, state) {
                        return TextField(
                          controller: _productCont,
                          onChanged: (value) {
                            purchasesBloc.add(ProductInput(value));
                          },
                          cursorColor: widget.invertColor,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: widget.invertColor,
                                width: 1.5,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: widget.invertColor,
                                width: 1.5,
                              ),
                            ),
                          ),
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                              RegExp(r'[^A-ZА-Я]'),
                            ), // С таким фильтром могут быть введены только строчные буквы
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        /* Выпадающий список */
        // BlocBuilder<PurchasesBloc, PurchasesState>(builder: (context, state) {
        //   // print('nnnn');  final bloc = context.watch<StorageCubit>();
        //   // print(state.heightTable);
        //   return SizedBox(
        //     height: state.heightTable, //state.heightTable, // 40, // state.heightTable,
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         Padding(
        //           padding: const EdgeInsets.only(left: 45.0, right: 40),
        //           child: SizedBox(
        //             width: 125,
        //           ),
        //         ),
        //         Expanded(
        //             child: ListView.builder(
        //                 itemCount: state.filterList.length,
        //                 itemBuilder: (BuildContext context, int index) {
        //                   return Container(
        //                     margin: const EdgeInsets.only(right: 45.0),
        //                     width: double.infinity,
        //                     height: state.heightContainer,
        //                     decoration: BoxDecoration(
        //                         border: Border.all(width: 0.5),
        //                         borderRadius: BorderRadius.circular(7)),
        //                     child: TextButton(
        //                       onPressed: () {
        //                         context.read<PurchasesBloc>().add(PressDropList(
        //                             foundItem: state.filterList[index],
        //                             list: blocStorage.state.storageList));
        //                         // foundItem = filterList[index];
        //                         // func();
        //                         // heightTable = 0;
        //                       },
        //                       child: Text(
        //                         state.filterList[index],
        //                         style: TextStyle(
        //                             fontSize: 20, color: myColor.colorText),
        //                       ),
        //                     ),
        //                   );
        //                 })
        //             )
        //       ],
        //     ),
        //   );
        // }),
        SizedBox(height: 8),
      ],
    );
    // );
  }
}
