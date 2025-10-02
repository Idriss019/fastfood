import 'package:fastfood/presentation/purchases/bloc/purchases_bloc.dart';
import 'package:fastfood/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_widgets/src/widgets/dropdown_list.dart';

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
    purchasesBloc.add(ProductInput(''));
    // purchasesBloc.add(UpdataState(pState: purchasesBloc.state.copyWith(
    //   filterList: purchasesBloc.state.storageListSQL
    //                         .map((toElement) => toElement.product)
    //                         .toList(),
    // )));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final purchasesBloc = context.watch<PurchasesBloc>();
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
                child: BlocBuilder<PurchasesBloc, PurchasesState>(
                  builder: (context, state) {
                    return Container(
                      margin: const EdgeInsets.only(right: 45.0),
                      /* Выпадающий список */
                      child: DropDownList(
                        onChangedTextField: (value) {
                          purchasesBloc.add(ProductInput(value));
                        },
                        onChangedDrop: (value) {
                          purchasesBloc.add(PressDropList(value));
                        },
                        filterList: state.filterList,
                        // formatInput: FilteringTextInputFormatter.allow(
                        //   RegExp(r'[^A-ZА-Я]'),
                        // ),
                        heightDropContainer: 40,
                        myColor: myColor.colorText,
                        controller: _productCont,
                        invertColor: widget.invertColor,
                        countColumn: 3,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 8),
      ],
    );
    // );
  }
}

// class DropDownList extends StatelessWidget {
//   final List<String> filterList;
//   final double heightDropContainer;
//   final TextEditingController _productCont;
//   final Function? onChangedTextField;
//   final Function? onChangedDrop;
//   final TextInputFormatter? formatInput;
//   final Color myColor;
//   // final PurchasesBloc purchasesBloc;
//   final ProductWidget widget;

//   const DropDownList({
//     super.key,
//     required TextEditingController productCont,
//     // required this.purchasesBloc,
//     required this.heightDropContainer,
//     required this.filterList,
//     required this.myColor,
//     required this.widget,
//     this.onChangedTextField,
//     this.onChangedDrop,
//     this.formatInput,
//   }) : _productCont = productCont;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           // margin: const EdgeInsets.only(right: 45.0),
//           // width: double.infinity,
//           // height: 200,
//           child: Center(
//             // child: BlocBuilder<PurchasesBloc, PurchasesState>(
//             //   builder: (context, state) {
//             child: TextField(
//               controller: _productCont,
//               onChanged: (value) {
//                 onChangedTextField?.call(value);
//                 // purchasesBloc.add(UpdataState(pState: state.copyWith(product: value)));
//                 // purchasesBloc.add(ProductInput(value));
//               },
//               cursorColor: widget.invertColor,
//               style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
//               decoration: InputDecoration(
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: widget.invertColor, width: 1.5),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: widget.invertColor, width: 1.5),
//                 ),
//               ),
//               inputFormatters: formatInput != null ? [?formatInput] : null,
//             ),
//             //  <TextInputFormatter>[
//             //   FilteringTextInputFormatter.allow(
//             //     RegExp(r'[^A-ZА-Я]'),
//             //   ), // С таким фильтром могут быть введены только строчные буквы
//             // ],
//             // ),
//             //   },
//             // ),
//           ),
//         ),
//         SizedBox(
//           height:
//               heightDropContainer *
//               (filterList.length > 3 ? 3 : filterList.length),
//           child: ListView.builder(
//             itemCount: filterList.length, // state.filterList.length,
//             itemBuilder: (BuildContext context, int index) {
//               return Container(
//                 // margin: const EdgeInsets.only(right: 45.0),
//                 // width: double.infinity,
//                 height: heightDropContainer, // state.heightContainer,
//                 decoration: BoxDecoration(
//                   border: Border.all(width: 0.5),
//                   borderRadius: BorderRadius.circular(7),
//                 ),
//                 child: TextButton(
//                   onPressed: () {
//                     onChangedDrop?.call(filterList[index]);
//                     // context.read<PurchasesBloc>().add(PressDropList(
//                     //     foundItem: state.filterList[index],
//                     //     list: blocStorage.state.storageList));

//                     // foundItem = filterList[index];
//                     // func();
//                     // heightTable = 0;
//                   },
//                   child: Text(
//                     filterList[index], // state.filterList[index],
//                     style: TextStyle(fontSize: 20, color: myColor),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }