import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class QuantityWidget extends StatelessWidget {
  const QuantityWidget({
    super.key,
    required this.heightRow,
    required this.withSizedBox,
    required this.invertColor,
  });

  final double heightRow;
  final double withSizedBox;
  final Color invertColor;

  @override
  Widget build(BuildContext context) {
    // final bloc = context.read<PurchasesCubit>();
    return SizedBox(
      height: heightRow,
      child: Center(
          child: SizedBox(
        width: withSizedBox,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                right: 13,
              ),
              child: Container(
                decoration: BoxDecoration(
                    // border:
                    //     Border.all(color: Colors.black)
                    ),
                child: Text(
                  'Количество  .................................',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 80,
              // height: 200,
              child: Center(
                child:
                    // BlocBuilder<PurchasesCubit, PurchasesState>(
                    //     builder: (context, state) {
                    //   return
                    TextField(
                  onChanged: (value) {
                    // bloc.state.quantity = value;
                    // final newState = bloc.state;
                    // bloc.updateStateText(newState);
                  },
                  // state.copyWith(quantity: value),
                  // controller: TextEditingController.fromValue(
                  //   TextEditingValue(text: bloc.state.quantity),
                  // )..selection = TextSelection.collapsed(
                  //     offset: bloc.state.quantity.length),
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
                        borderSide: BorderSide(color: invertColor, width: 1.5)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: invertColor, width: 1.5)),
                  ),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(
                        r'\b[1-9][0-9]{0,4}')), // С таким фильтром могут быть введены только числа
                  ],
                ),
                // }),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
