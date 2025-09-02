import 'package:fastfood/global_function.dart';
import 'package:fastfood/names/purchases/bloc/purchases_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonInputWidget extends StatelessWidget {
  const ButtonInputWidget({
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
    // final bloc = context.watch<PurchasesCubit>();
    // final blocSt = context.read<StorageCubit>();
    // blocSt.loadFromSQL();
    return Padding(
      padding: const EdgeInsets.only(
        top: 15.0,
        right: 150,
        left: 150,
      ),
      child: Container(
        // decoration: BoxDecoration(
        //     border: Border.all(color: lineBorderColor)),
        height: heightRow - 12,
        width: withSizedBox + 100,
        child: BlocBuilder<PurchasesBloc, PurchasesState>(
            builder: (context, state) {
          return TextButton(
              style: ButtonStyle(
                shape: WidgetStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
                backgroundColor: myButtonColor,
              ),
              onPressed: () {
              },
              child: Text(
                'Добавить',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                  color: onPrimaryColor,
                ),
              ));
        }),
      ),
    );
  }
}
