import 'package:fastfood/navBar.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return NavBarWidget(child: Text('Заказы'));
  }

}

//return NavBarWidget(child: Text('Таблицы'));
