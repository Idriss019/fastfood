import 'package:fastfood/presentation/recalculation/bloc/recalculation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:string_capitalize/string_capitalize.dart';


class Product extends StatelessWidget {
  const Product({
    super.key,
    required this.lineBorderColor,
    required this.heightRow,
    required this.invertColor,
  });

  final Color lineBorderColor;
  final double heightRow;
  final Color invertColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //     border: Border.all(color: lineBorderColor)),
      height: heightRow - 15,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 40),
            child: Container(
              // margin: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                  // border:
                  //     Border.all(color: Colors.black)
                  ),
              child: Text(
                'Название :',
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
              margin: const EdgeInsets.only(right: 8.0),
              // width: double.infinity,
              height: 200,
              child: Center(
                child: BlocBuilder<RecalculationBloc, RecalculationState>(
                    builder: (context, state) {
                  return Text(
                    state.product.capitalizeEach(),
                    style: TextStyle(fontSize: 25),
                  );
                }),
                // TextField(
                //   enabled: false,
                //   cursorColor: invertColor,
                //   style: TextStyle(
                //     fontWeight: FontWeight.w600,
                //     fontSize: 20,
                //   ),
                //   decoration: InputDecoration(
                //     enabledBorder: OutlineInputBorder(
                //         borderSide: BorderSide(color: invertColor, width: 1.5)),
                //     focusedBorder: OutlineInputBorder(
                //         borderSide: BorderSide(color: invertColor, width: 1.5)),
                //   ),
                //   inputFormatters: <TextInputFormatter>[
                //     FilteringTextInputFormatter
                //         .digitsOnly, // С таким фильтром могут быть введены только числа
                //   ],
                // ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
