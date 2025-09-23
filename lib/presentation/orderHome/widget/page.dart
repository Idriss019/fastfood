// import 'package:fastfood/navBar.dart';
// import 'package:data_table_2/data_table_2.dart';
// import 'package:fastfood/global_function.dart';
import 'package:fastfood/presentation/orderHome/widget/menu_screen.dart';
import 'package:fastfood/presentation/orderHome/widget/order_screen.dart';
import 'package:fastfood/navBar.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_numeric_keyboard/flutter_numeric_keyboard.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  TextEditingController sumController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Navbar(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OrderScreen(),
              MenuScreen(),
            ],
          ),
        ),
      ),
    );
  }
}


