import 'package:fastfood/presentation/recalculation/bloc/recalculation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Barcode extends StatelessWidget {
  const Barcode({
    super.key,
    required this.heightRow,
    required this.withSizedBox,
    required this.invertColor,
  });

  final double heightRow;
  final double withSizedBox;
  final Color invertColor;

//   @override
//   State<Barcode> createState() => _BarcodeState();
// }

// class _BarcodeState extends State<Barcode> {
//   final TextEditingController _barcodeCont = TextEditingController();

//   @override
//   void initState() {
//     super.initState();

//     // _barcodeCont.addListener(() {});
//     // _courseCont.addListener(() {});
//     // blocPurchases = context.read<PurchasesCubit>();
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     final blocOrder = context.watch<OrderBloc>();
//     // Обновляем контроллер при изменении состояния
//     final String barcode = blocOrder.state.barcode;
//     if (_barcodeCont.text != barcode) {
//       _barcodeCont.value = TextEditingValue(
//         text: barcode,
//         selection: TextSelection.collapsed(offset: barcode.length),
//       );
//     }
//   }

//   @override
//   void dispose() {
//     _barcodeCont.dispose();
//     super.dispose();
//   }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightRow - 15,
      child: Center(
        child: SizedBox(
          width: withSizedBox,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 22),
                child: Container(
                  decoration: BoxDecoration(
                      // border:
                      //     Border.all(color: Colors.black)
                      ),
                  child: Text(
                    'Штрих-код :',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              style: BorderStyle.solid,
                              width: 1,
                              color: invertColor))),
                  // width: 200,
                  // height: 200,
                  child: Center(
                    child: BlocBuilder<RecalculationBloc, RecalculationState>(
                        builder: (context, state) {
                      return Text(
                        state.barcode,
                        style: TextStyle(fontSize: 23),
                      );
                      // TextField(
                      //   // onChanged: (value) =>
                      //   // context.read<OrderBloc>().add(BarcodeInput(value)),
                      //   enabled: false,
                      //   cursorColor: widget.invertColor,
                      //   controller: _barcodeCont,
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.w600,
                      //     fontSize: 20,
                      //   ),
                      //   decoration: InputDecoration(
                      //     // suffixIcon: IconButton(
                      //     //     onPressed: () {
                      //     //       // context.read<OrderBloc>().add(SearchByBarcode(
                      //     //       //       context, state.storageList
                      //     //       //     ));
                      //     //     },
                      //     //     icon: Icon(Icons.search)),
                      //     enabledBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(
                      //             color: widget.invertColor, width: 1.5)),
                      //     focusedBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(
                      //             color: widget.invertColor, width: 1.5)),
                      //   ),
                      //   inputFormatters: <TextInputFormatter>[
                      //     FilteringTextInputFormatter
                      //         .digitsOnly, // С таким фильтром могут быть введены только числа
                      //   ],
                      // );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
