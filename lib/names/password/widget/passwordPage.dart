import 'package:fastfood/names/password/widget/jobs.dart';
import 'package:fastfood/names/password/widget/keyboard.dart';
import 'package:fastfood/navBar.dart';
import 'package:flutter/material.dart';

class PasswordPage extends StatelessWidget {
  const PasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            children: [
              JobsData(),
              KeyboardPassword(),
            ],
          ),
      ),
    ),
    );
    
  }
}