// import 'package:data_table_2/data_table_2.dart';
import 'package:fastfood/navBar.dart';
import 'package:fastfood/presentation/password/cubit/password_cubit.dart';
import 'package:fastfood/presentation/staff/widget/bottom_table.dart';
import 'package:fastfood/presentation/staff/widget/inputNewStaff.dart';
import 'package:fastfood/presentation/staff/widget/table_staff.dart';
import 'package:fastfood/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Staff extends StatefulWidget {
  const Staff({super.key});

  @override
  State<Staff> createState() => _StaffState();
}

class _StaffState extends State<Staff> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color invertColor = CustomTheme(context: context).colorBorder;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Navbar(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(),
                    Text(
                      'Список пользователей',
                      style: TextStyle(fontSize: 30),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: InputNewStaffDialogWidget(),
                    ),
                  ],
                ),
              ),
              Container(
                height: 270,
                margin: EdgeInsets.only(bottom: 8),
                color: Colors.cyan,
                child: TableStaffWidget(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Таблица полномочий ↓', style: TextStyle(fontSize: 30)),
                  BlocBuilder<PasswordCubit, PasswordState>(
                    builder: (context, state) {
                      return Text(
                        'Логин: ${state.login}',
                        style: TextStyle(fontSize: 30),
                      );
                    },
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10, top: 10),
                height: 280,
                width: double.infinity,
                // color: Colors.amber,
                decoration: BoxDecoration(
                  border: Border.all(color: invertColor, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: BottomTableWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



