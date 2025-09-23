import 'package:fastfood/data_class/purchases_data.dart';
import 'package:fastfood/global_function.dart';
import 'package:fastfood/presentation/purchases/bloc/purchases_bloc.dart';
import 'package:fastfood/widgetMetod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonsBottomWidget extends StatefulWidget {
  const ButtonsBottomWidget({
    super.key,
    required this.heightRow,
    required this.myButtonColor,
    required this.onPrimaryColor,
  });

  final double heightRow;
  final CustomColorButton myButtonColor;
  final Color onPrimaryColor;

  @override
  State<ButtonsBottomWidget> createState() => _ButtonsBottomWidgetState();
}

class _ButtonsBottomWidgetState extends State<ButtonsBottomWidget> {
  // late PurchasesBloc _bloc;
  @override
  void initState() {
    super.initState();
    // _bloc = context.read<PurchasesBloc>();
    // _bloc.startListeningStorage();
  }

  @override
  void dispose() {
    // _bloc.cancelStorageListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final blocPurchases = context.watch<PurchasesBloc>();
    // final blocStorage = context.read<StorageCubit>();
    // final myColor = CustomTheme(context: context);
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        right: 8.0,
        left: 8.0,
        bottom: 8,
      ),
      child: Container(
        width: double.infinity,
        // color: Colors.amber,
        height: widget.heightRow,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.only(left: 50.0, right: 50),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  child: TextButton(
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      backgroundColor: widget.myButtonColor,
                    ),
                    onPressed: () {
                      context.read<PurchasesBloc>().add(RemoveList());
                    },
                    child: Text(
                      'Очистить',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                        color: widget.onPrimaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.only(left: 50.0, right: 50),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  child: TextButton(
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      backgroundColor: widget.myButtonColor,
                    ),
                    onPressed: () {
                      context.read<PurchasesBloc>().add(InputList());
                    },
                    child: Text(
                      'Внести',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                        color: widget.onPrimaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            /* Итого */
            Flexible(
              flex: 9,
              child: Padding(
                padding: const EdgeInsets.only(top: 2),
                child: SizedBox(
                  // width: 400,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Итого', // ₽
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 38,
                        ),
                      ),
                      Text(
                        '=',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        // width: 225,
                        child: BlocBuilder<PurchasesBloc, PurchasesState>(
                          builder: (context, state) {
                            // double sum = 0;
                            // for (var i in state.salesList) {
                            //   sum += i.sumOfRubles;
                            //   print('sum == $sum');
                            // }

                            // if (state.purchasesList.isNotEmpty) {
                            //   double totalSum = 0;
                            //   for (var i in state.purchasesList) {
                            //     totalSum += (i.quantity! * i.priceOfPurchases!);
                            //   }
                            //   context.read<PurchasesBloc>().add(TotalInput(totalSum.to));
                            //   // state.purchasesList.reduce(
                            //   //   (total, element) => total =
                            //   //       (element.quantity! *
                            //   //       element.priceOfPurchases!),
                            //   // );
                            //   // double totalRub = state.purchasesList
                            //   //     .map((PurchasesData item) => item.)
                            //   //     .reduce((a, b) => a * b);
                            //   // PurchasesBloc.updateStateText(state.copyWith(
                            //   //     totalOfRubles: totalRub.toString()));
                            // }
                            return Text(
                              digitSeparator(state.total),
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 30,
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        // width: 225,
                        child: Text(
                          '₽',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 35,
                          ),
                        ),
                      ),
                    ],
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
