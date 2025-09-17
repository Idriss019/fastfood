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
  final TextEditingController _purchasesSumCont = TextEditingController();
  final TextEditingController _priceSumCont = TextEditingController();
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
    final purchasesBlocWatch = context.watch<PurchasesBloc>();
    // Обновляем контроллер при изменении состояния
    final String purchasesSum = purchasesBlocWatch.state.purchasesSum;
    if (_purchasesSumCont.text != purchasesSum) {
      _purchasesSumCont.value = TextEditingValue(
        text: purchasesSum,
        selection: TextSelection.collapsed(offset: purchasesSum.length),
      );
    }
    final String priceSum = purchasesBlocWatch.state.priceSum;
    if (_priceSumCont.text != priceSum) {
      _priceSumCont.value = TextEditingValue(
        text: priceSum,
        selection: TextSelection.collapsed(offset: priceSum.length),
      );
    }
  }

  @override
  void dispose() {
    _purchasesSumCont.dispose();
    _priceSumCont.dispose();
    super.dispose();
  }

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
                        onChanged: (value) {
                          purchasesBloc.add(PurchasesSumInput(value));
                          if (state.quantity.isNotEmpty && value.isNotEmpty) {
                            double result =
                                double.parse(value) /
                                double.parse(state.quantity);
                            // print(result);
                            purchasesBloc.add(
                              PurchasesInput(result.toString()),
                            );
                          }

                          
                        },
                        controller: _purchasesSumCont,
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
                        enabled: false,
                        onChanged: (value) {
                          // purchasesBloc.add(PriceSumInput(value));
                        },
                        controller: _priceSumCont,
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
