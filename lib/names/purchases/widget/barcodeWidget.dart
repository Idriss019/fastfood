import 'dart:math';

import 'package:fastfood/names/purchases/bloc/purchases_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BarcodeWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final bool visibilityError = false;
    return Column(
      children: [
        Visibility(
          visible: visibilityError,
          child: Column(children: [SizedBox(height: 15)]),
        ),
        SizedBox(
          height: heightRow,
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
                  width: 160,
                  // height: 200,
                  child: Center(
                    child: BlocBuilder<PurchasesBloc, PurchasesState>(
                      builder: (context, state) {
                        return TextField(
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
                  padding: const EdgeInsets.only(left: 10.0),
                  child: DropdownMenu<String>(
                    textStyle: TextStyle(fontSize: 20),
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
