import 'package:fastfood/global_function.dart';
import 'package:fastfood/presentation/recalculation/bloc/recalculation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({
    super.key,
    required this.heightRow,
    required this.withSizedBox,
    required this.myButtonColor,
    required this.onPrimaryColor,
  });

  final double heightRow;
  final double withSizedBox;
  final CustomColorButton myButtonColor;
  final Color onPrimaryColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10.0,
        right: 150,
        left: 150,
      ),
      child: Container(
        // decoration: BoxDecoration(
        //     border: Border.all(color: lineBorderColor)),
        height: heightRow - 12,
        width: withSizedBox + 100,
        child: TextButton(
            style: ButtonStyle(
              shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10))),
              backgroundColor: myButtonColor,
            ),
            onPressed: () {
              context.read<RecalculationBloc>().add(CancelButtonEvent());
            },
            child: Text(
              'Отменить',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 25,
                color: onPrimaryColor,
              ),
            )),
      ),
    );
  }
}