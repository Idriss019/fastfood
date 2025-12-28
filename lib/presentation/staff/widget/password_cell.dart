import 'package:fastfood/data_class/staff_data.dart';
import 'package:fastfood/presentation/staff/bloc/staff_bloc.dart';
import 'package:fastfood/presentation/staff/widget/page.dart';
import 'package:fastfood/theme.dart';
import 'package:fastfood/widgetMetod.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordCellWidget extends StatefulWidget {
  final StaffData i;
  const PasswordCellWidget({
    required this.i,
    super.key});

  @override
  State<PasswordCellWidget> createState() => _PasswordCellWidgetState();
}

class _PasswordCellWidgetState extends State<PasswordCellWidget> {
  StaffData get i => widget.i;
  
  late StaffBloc bloc;

  final oldPasswordController = TextEditingController();
  final retryOldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  bool isObscuredOld = true;
  bool isObscuredNew = true;

  @override
  void initState() {
    super.initState();
    bloc = context.read<StaffBloc>();
    // bloc.startListening();
  }

  @override
  void dispose() {
    // bloc.stopListening();
    oldPasswordController.dispose();
    retryOldPasswordController.dispose();
    newPasswordController.dispose();
    super.dispose();
  }

  void clearInputControllers() {
    oldPasswordController.clear();
    retryOldPasswordController.clear();
    newPasswordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final colorText = CustomTheme(context: context).colorText;
    // final colorText = myColor.colorText();
    return textFieldCellWithReg3(
          '•' * i.password.length,
          context,
          bloc,
          TextAlign.center,
          () async {
            await showDialog(
              context: context,
              builder: (context) {
                return StatefulBuilder(
                  builder: (context, setState) {
                    return AlertDialog(
                      content: Text(
                        'Изменить пароль для ${i.login}',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 24),
                      ),
                      actions: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 300,
                              child: Row(
                                children: [
                                  Text(
                                    'Старый пароль :',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox.fromSize(size: Size(10, 0)),
                                  Expanded(
                                    child: TextField(
                                      obscureText: isObscuredOld,
                                      controller: oldPasswordController,
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter
                                            .digitsOnly,
                                      ], // С таким фильтром могут быть введены только числа
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            isObscuredOld
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              isObscuredOld = !isObscuredOld;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 300,
                              child: Row(
                                children: [
                                  Text(
                                    'Новый пароль :',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox.fromSize(size: Size(10, 0)),
                                  Expanded(
                                    child: TextField(
                                      obscureText: isObscuredNew,
                                      controller: newPasswordController,
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter
                                            .digitsOnly,
                                      ], // С таким фильтром могут быть введены только числа
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            isObscuredNew
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              isObscuredNew = !isObscuredNew;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 300,
                              child: Row(
                                children: [
                                  Text(
                                    'Повторить :',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox.fromSize(size: Size(10, 0)),
                                  Expanded(
                                    child: TextField(
                                      obscureText: isObscuredOld,
                                      controller: retryOldPasswordController,
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter
                                            .digitsOnly,
                                      ], // С таким фильтром могут быть введены только числа
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            isObscuredOld
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              isObscuredOld = !isObscuredOld;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                /* кнопка отмены */
                                TextButton(
                                  onPressed: () {
                                    clearInputControllers();
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Отмена',
                                    style: TextStyle(
                                      color: colorText,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                /*  кнопка принятия */
                                TextButton(
                                  onPressed: () async {
                                    bloc.add(
                                      UpdatePasswordEvent(
                                        staffData: i,
                                        oldPassword:
                                            oldPasswordController.text,
                                        retryOldPassword:
                                            retryOldPasswordController.text,
                                        newPassword:
                                            newPasswordController.text,
                                        context: context,
                                        func: () {
                                          clearInputControllers();
                                          Navigator.pop(context);
                                        },
                                      ),
                                    );
                                    // clearInputControllers();
                                    // Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Изменить',
                                    style: TextStyle(
                                      color: colorText,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
            );
            // (String title) {
            //   bloc.updateStaffData(
            //     i.copyWith(powers: StaffData.transformationPowersToMap(title)),
            //   );
            // Navigator.pop(context);
          },
          FilteringTextInputFormatter
              .digitsOnly, // С таким фильтром могут быть введены только числа
          1,
          colorText,
        );
  }
}
