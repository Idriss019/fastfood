import 'package:fastfood/navBar.dart';
import 'package:flutter/material.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return NavBarWidget(child: Text('Оплата'));
  }
}