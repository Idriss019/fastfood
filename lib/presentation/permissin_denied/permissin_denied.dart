import 'package:flutter/material.dart';
import 'package:fastfood/navBar.dart';

class PermissionDenied extends StatelessWidget {
  const PermissionDenied({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child:Navbar(
        child: Center(child: Text('В доступе отказано!', style: TextStyle(fontSize: 30),),),
      )
    );
  }
}