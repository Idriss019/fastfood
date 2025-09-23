import 'package:fastfood/global_function.dart';
import 'package:fastfood/presentation/purchases/bloc/purchases_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PurchasePrice extends StatefulWidget {
  const PurchasePrice({
    super.key,
    required this.heightRow,
    required this.withSizedBox,
    required this.invertColor,
  });

  final double heightRow;
  final double withSizedBox;
  final Color invertColor;

  @override
  State<PurchasePrice> createState() => _PriceOfPurchasesState();
}

class _PriceOfPurchasesState extends State<PurchasePrice> {
  final TextEditingController _purchasesCont = TextEditingController();
  final TextEditingController _priceCont = TextEditingController();
  late PurchasesBloc purchasesBloc;

  @override
  void initState() {
    super.initState();
    purchasesBloc = context.read<PurchasesBloc>();
    // _purchasesCont.addListener(() {});
    // _courseCont.addListener(() {});
    // blocPurchases = context.read<PurchasesCubit>();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final purchasesBlocWatch = context.watch<PurchasesBloc>();
    // Обновляем контроллер при изменении состояния
    final String purchases = purchasesBlocWatch.state.purchases;
    if (_purchasesCont.text != purchases) {
      _purchasesCont.value = TextEditingValue(
        text: purchases,
        selection: TextSelection.collapsed(offset: purchases.length),
      );
    }
    final String price = purchasesBlocWatch.state.price;
    if (_priceCont.text != price) {
      _priceCont.value = TextEditingValue(
        text: price,
        selection: TextSelection.collapsed(offset: price.length),
      );
    }
  }

  @override
  void dispose() {
    _purchasesCont.dispose();
    _priceCont.dispose();
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
              padding: const EdgeInsets.only(right: 32),
              child: Container(
                // margin: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  // border:
                  //     Border.all(color: Colors.black)
                ),
                child: Text(
                  'Цена закупа',
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
                          purchasesBloc.add(PurchasesInput(value));
                          // if (state.quantity.isNotEmpty && value.isNotEmpty) {
                          //   double result =
                          //       double.parse(value) *
                          //       double.parse(state.quantity);
                          //   // print(result);
                          //   // purchasesBloc.add(
                          //   //   PurchasesSumInput(result.toString()),);
                          //   purchasesBloc.add(UpdateLine(pState: state.copyWith(purchases: value, purchasesSum: result.toString())));
                          // }else{
                          //   purchasesBloc.add(UpdateLine(pState: state.copyWith(purchases: value)));
                          // }
                        },
                        controller: _purchasesCont,
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
                          DoubleTextInputFormatter()
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
                  'Цена продажи',
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
                        onChanged: (value) {
                          purchasesBloc.add(PriceInput(value.toString()));
                          // if (state.quantity.isNotEmpty && value.isNotEmpty && double.parse(value) > 0) {
                            
                          //   // purchasesBloc.add(PriceInput(value.toString()));
                          //   // if (double.parse(value) > 0) {
                          //     double result =
                          //         double.parse(value) *
                          //         double.parse(state.quantity);
                          //     purchasesBloc.add(UpdateLine(pState: state.copyWith(price: value, priceSum: result.toString())));
                          //     // purchasesBloc.add(
                          //     //   PriceSumInput(result.toString()),);
                          //   // }
                          // }else{
                          //   purchasesBloc.add(UpdateLine(pState: state.copyWith(price: value)));
                          // }
                        },
                        controller: _priceCont,
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
                        inputFormatters: 
                        <TextInputFormatter>[
                          DoubleTextInputFormatter()
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
