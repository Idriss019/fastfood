import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Center(
        child: Text(
          'Перерасчет',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 32,
          ),
        ),
      ),
    );
  }
}
