import 'package:data_table_2/data_table_2.dart';
import 'package:fastfood/global_function.dart';
import 'package:fastfood/names/payment/widget/keyboard.dart';
import 'package:fastfood/names/payment/widget/payment_screen.dart';
import 'package:fastfood/navBar.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Navbar(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            children: [
              PaymentScreen(),
              Keyboard(),
            ],
          ),
        ),
      ),
    );
  }
}



