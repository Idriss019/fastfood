import 'package:fastfood/DB/database.dart';
import 'package:fastfood/DB/table/staffDB.dart';
import 'package:fastfood/data_class/staff_data.dart';
import 'package:fastfood/presentation/password/widget/jobs.dart';
import 'package:fastfood/presentation/password/widget/keyboard.dart';
// import 'package:fastfood/navBar.dart';
import 'package:flutter/material.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({super.key});
  
  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  final passwordController = TextEditingController();
//   @override
// void initState() {
//   super.initState();
//   initialize();
// }

// void initialize() async {
//   final staffSQL = StaffSQL(database: AppDatabase());
//   // staffSQL.insertRoot();
//   List<StaffData> staffList = await staffSQL.getAllStaff();
//   print('---');
//   print(staffList[0].powers);
// }
  
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