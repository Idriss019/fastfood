import 'package:fastfood/names/purchases/bloc/purchases_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SumPurchasePrice extends StatefulWidget {
  const SumPurchasePrice({
    super.key,
    required this.heightRow,
    required this.withSizedBox,
    required this.invertColor,
  });

  final double heightRow;
  final double withSizedBox;
  final Color invertColor;

  @override
  State<SumPurchasePrice> createState() => _PriceOfSomWidgetState();
}

class _PriceOfSomWidgetState extends State<SumPurchasePrice> {
  TextEditingController somController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // final bloc = context.watch<PurchasesCubit>();
    return Padding(
      padding: const EdgeInsets.only(left: 45, right: 45),
      child: SizedBox(
        height: widget.heightRow,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 14),
              child: Container(
                // margin: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  // border:
                  //     Border.all(color: Colors.black)
                ),
                child: Text(
                  'Сумма закупа',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
                ),
              ),
            ),
            Expanded(
              child: Container(
                // margin: const EdgeInsets.only(right: 8.0),
                // width: double.infinity,
                // height: 200,
                child: Center(
                  child: BlocBuilder<PurchasesBloc, PurchasesState>(
                    builder: (context, state) {
                      return TextField(
                        onChanged: (value) {},
                        // controller: TextEditingController.fromValue(
                        //   TextEditingValue(text: state.purchases),
                        // )..selection = TextSelection.collapsed(
                        //     offset: state.purchases.length),
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
                          // DoubleTextInputFormatter()
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 10),
              child: Container(
                // margin: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  // border:
                  //     Border.all(color: Colors.black)
                ),
                child: Text(
                  'Сумма продажи',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Center(
                  child: BlocBuilder<PurchasesBloc, PurchasesState>(
                    builder: (context, state) {
                      return TextField(
                        onChanged: (value) {},
                        // controller: somController,
                        // controller: TextEditingController.fromValue(
                        //   TextEditingValue(text: state.price),
                        // )..selection =
                        //     TextSelection.collapsed(offset: state.price.length),
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
                          // DoubleTextInputFormatter()
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
    );
  }
}
