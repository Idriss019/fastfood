// import 'dart:math';

import 'package:fastfood/names/purchases/bloc/purchases_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BarcodeWidget extends StatefulWidget {
  const BarcodeWidget({
    super.key,
    // required this.visibilityError,
    required this.heightRow,
    required this.withSizedBox,
    required this.invertColor,
  });

  // final bool visibilityError;
  final double heightRow;
  final double withSizedBox;
  final Color invertColor;

  @override
  State<BarcodeWidget> createState() => _BarcodeWidgetState();
}

class _BarcodeWidgetState extends State<BarcodeWidget> {
  final TextEditingController _barcodeCont = TextEditingController();
  final TextEditingController _quantityCont = TextEditingController();
  final TextEditingController _measuringCont = TextEditingController();
  late PurchasesBloc purchasesBloc;

  @override
  void initState() {
    super.initState();
    purchasesBloc = context.read<PurchasesBloc>();
    // _barcodeCont.addListener(() {});
    // _courseCont.addListener(() {});
    // blocPurchases = context.read<PurchasesCubit>();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final purchasesBloc = context.watch<PurchasesBloc>();
    // Обновляем контроллер при изменении состояния
    final String barcode = purchasesBloc.state.barcode;
    if (_barcodeCont.text != barcode) {
      _barcodeCont.value = TextEditingValue(
        text: barcode,
        selection: TextSelection.collapsed(offset: barcode.length),
      );
    }
    final String quantity = purchasesBloc.state.quantity;
    if (_quantityCont.text != quantity) {
      _quantityCont.value = TextEditingValue(
        text: quantity,
        selection: TextSelection.collapsed(offset: quantity.length),
      );
    }
    final String measuring = purchasesBloc.state.measuring;
    if (_measuringCont.text == '') {
      _measuringCont.value = TextEditingValue(
        text: 'шт',
        selection: TextSelection.collapsed(offset: measuring.length),
      );
    }
    if (_measuringCont.text != measuring) {
      _measuringCont.value = TextEditingValue(
        text: measuring,
        selection: TextSelection.collapsed(offset: measuring.length),
      );
    }
  }

  @override
  void dispose() {
    _barcodeCont.dispose();
    _quantityCont.dispose();
    _measuringCont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final bool visibilityError = false;
    return Column(
      children: [
        // Visibility(
        //   visible: visibilityError,
        //   child: Column(children: [SizedBox(height: 15)]),
        // ),
        SizedBox(
          height: widget.heightRow,
          child: Padding(
            padding: const EdgeInsets.only(left: 45, right: 45),
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
                      'Штрих-код',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    // width: 200,
                    // height: 200,
                    child: Center(
                      child: BlocBuilder<PurchasesBloc, PurchasesState>(
                        builder: (context, state) {
                          //        if (state.errorTitle.isNotEmpty) {
                          //   showDialogOk(context, state.errorTitle);
                          // }
                          // if (state.searchByBarcode) {}
                          return TextField(
                            onChanged: (value) {
                              purchasesBloc.add(BarcodeInput(value));
                            },
                            cursorColor: widget.invertColor,
                            controller: _barcodeCont,
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
                    child: BlocBuilder<PurchasesBloc, PurchasesState>(
                      builder: (context, state) {
                        return TextField(
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              purchasesBloc.add(QuantityInput(value));

                              if (state.purchases.isNotEmpty &&
                                  double.parse(value) > 0) {
                                double result =
                                    double.parse(value) *
                                    double.parse(state.purchases);

                                purchasesBloc.add(
                                  PurchasesSumInput(result.toString()),
                                );
                              }
                              if (state.purchasesSum.isNotEmpty &&
                                  double.parse(value) > 0) {
                                double result =
                                    double.parse(state.purchasesSum) /
                                    double.parse(value);

                                purchasesBloc.add(
                                  PurchasesInput(result.toString()),
                                );
                              }
                            }
                          },

                          controller: _quantityCont,
                          cursorColor: widget.invertColor,
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
                              RegExp(r'\b[1-9][0-9]{0,4}'), //^a(?=b)
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
                  padding: const EdgeInsets.only(left: 10.0),
                  child: DropdownMenu<String>(
                    textStyle: TextStyle(fontSize: 20),
                    initialSelection: 'шт',
                    enableFilter: true,
                    enableSearch: false,
                    controller: _measuringCont,
                    onSelected: (value) {
                      purchasesBloc.add(MeasuringInput(value ?? ''));
                    },
                    dropdownMenuEntries: const [
                      DropdownMenuEntry(value: 'шт', label: 'шт'),
                      DropdownMenuEntry(value: 'г', label: 'г'),
                      DropdownMenuEntry(value: 'мл', label: 'мл'),
                      DropdownMenuEntry(value: 'кг', label: 'кг'),
                      DropdownMenuEntry(value: 'л', label: 'л'),
                    ],
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(
                        RegExp(r'^a(?=b)'), // Ни какие значения не принимаются
                      ),
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
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        // граница при фокусе
                        borderSide: BorderSide(color: Colors.white, width: 4.0),
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // BlocListener<PurchasesBloc, PurchasesState>(
        //   // listenWhen: (previous, current) => previous.errorTitle != current.errorTitle,
        //   listener: (context, state) {
        //     if (state.errorTitle.isNotEmpty) {
        //       showDialogOk(context, state.errorTitle);
        //     }
        //   },
        // )
      ],
    );
  }
}
