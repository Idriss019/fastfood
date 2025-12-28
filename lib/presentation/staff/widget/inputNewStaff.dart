import 'dart:ui';

import 'package:dart_helper_method/string_helper.dart';
import 'package:fastfood/data_class/staff_data.dart';
import 'package:fastfood/presentation/staff/bloc/staff_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fastfood/theme.dart';

class InputNewStaffDialogWidget extends StatefulWidget {
  const InputNewStaffDialogWidget({super.key});

  @override
  State<InputNewStaffDialogWidget> createState() => _StateInputNewStaffDialog();
}

class _StateInputNewStaffDialog extends State<InputNewStaffDialogWidget> {
  late StaffBloc staffBloc;
  final inputPotionController = TextEditingController();
  final inputLoginController = TextEditingController();
  final inputPasswordController = TextEditingController();
  final inputPowerController = TextEditingController();
  bool isObscured = true;

  @override
  void initState() {
    super.initState();
    staffBloc = context.read<StaffBloc>();
  }

  @override
  void dispose() {
    super.dispose();
    inputPotionController.dispose();
    inputLoginController.dispose();
    inputPasswordController.dispose();
    inputPowerController.dispose();
  }

  void clearInputControllers() {
    inputPotionController.clear();
    inputLoginController.clear();
    inputPasswordController.clear();
    inputPowerController.clear();
  }

  @override
  Widget build(BuildContext context) {
    Color invertColor = CustomTheme(context: context).colorBorder;
    return TextButton(
      onPressed: () async {
        return showDialog(
          context: context,
          builder: (context) {
            return StatefulBuilder(
              builder: (context, setState) {
                return AlertDialog(
                  content: Text(
                    'Добавить пользователя',
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
                                'Должность :',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox.fromSize(size: Size(10, 0)),
                              Expanded(
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  controller: inputPotionController,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          child: Row(
                            children: [
                              Text('Логин :', style: TextStyle(fontSize: 18)),
                              SizedBox.fromSize(size: Size(10, 0)),
                              Expanded(
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  controller: inputLoginController,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          child: Row(
                            children: [
                              Text('Пароль :', style: TextStyle(fontSize: 18)),
                              SizedBox.fromSize(size: Size(10, 0)),
                              Expanded(
                                child: TextField(
                                  obscureText: isObscured,
                                  controller: inputPasswordController,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly,
                                  ], // С таким фильтром могут быть введены только числа
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        isObscured
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          isObscured = !isObscured;
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
                                'Код полномочий :',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox.fromSize(size: Size(10, 0)),
                              Expanded(
                                child: TextField(
                                  controller: inputPowerController,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly,
                                  ], // С таким фильтром могут быть введены только числа
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  color: invertColor,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            /*  кнопка принятия */
                            TextButton(
                              onPressed: () async{
                                String login =
                                    inputLoginController.text.saveText();
                                String password =
                                    inputPasswordController.text.saveText();
                                
                                String message = staffBloc.changeInput(
                                  inputLoginController.text,
                                  inputPasswordController.text,
                                );
                                if (message == '0') {
                                  message = await staffBloc.identityCheck(
                                    login, password
                                  );
                                  if(message == '0'){
                                    staffBloc.add(
                                    InsertStaffEvent(
                                      staffData: StaffData(
                                        login: login,
                                        password: password,
                                        position: inputPotionController.text
                                            .saveText(),
                                        powers: StaffData.transformationPowersToMap(
                                          inputPowerController.text,
                                        ),
                                      ),
                                    ),
                                  );
                                  clearInputControllers();
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          message,
                                          style: TextStyle(fontSize: 18),
                                          textAlign: TextAlign.center,
                                        ),
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                    return;
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        message,
                                        style: TextStyle(fontSize: 18),
                                        textAlign: TextAlign.center,
                                      ),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                  return;
                                }
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Добавить',
                                style: TextStyle(
                                  color: invertColor,
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
      },
      child: Text('+', style: TextStyle(fontSize: 30, color: invertColor)),
    );
  }
}
