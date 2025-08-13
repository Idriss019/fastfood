import 'package:fastfood/bloc/password/password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


class PasswordPage extends StatefulWidget {
  const PasswordPage({super.key});

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  final passwordController = TextEditingController();
  var _isObscured = true;

  @override
  void initState() {
    super.initState();
    // context.read<ThemeCubit>().loadTheme();
    _isObscured = true;
  }

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PasswordCubit>();

    return StreamBuilder<PasswordState>(
        initialData: bloc.state,
        stream: bloc.stream,
        builder: (context, snapshot) {
          final visibilityError =
              snapshot.requireData.errorPassword != '' ? true : false;
          return Scaffold(
            body: Container(
              // color: Theme.of(context).colorScheme.pri,
              child: Center(
                child: Column(
                  children: [
                    Expanded(child: SizedBox()),
                    ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Image.asset(
                          "assets/img/start.jpg",
                          fit: BoxFit.fill,
                          width: 180,
                          height: 150,
                        )),
                    Text(
                      'Введите пароль',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w600,
                        // color: Theme.of(context).colorScheme.onSecondary,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Visibility(
                      visible: visibilityError,
                      child: Text(
                        snapshot.requireData.errorPassword,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          // color: Theme.of(context).colorScheme.onSecondary,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: 400,
                      height: 200,
                      /* Строка для ввода пароля */
                      child: TextField(
                        cursorColor: Theme.of(context).colorScheme.onSecondary,
                        autofocus: true,
                        style: TextStyle(
                          // fontFamily: 'Verdana',
                          // fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600,
                          fontSize: 35,
                        ),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                  width: 1.5)),
                          // border: OutlineInputBorder(
                          //     borderSide:
                          //         BorderSide(color: Colors.black, width: 1.5)),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isObscured = !_isObscured;
                                });
                              },
                              icon: Icon(Icons.visibility)),
                        ),
                        onChanged: (value) {
                          if (bloc.changePasswordToStart(value)) {
                            context.go('/home');
                          }
                        },
                        // controller: passwordController,
                        obscureText: _isObscured,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter
                              .digitsOnly, // С таким фильтром могут быть введены только числа
                        ],
                      ),
                    ),
                    Expanded(child: SizedBox()),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

// class WhitelistingTextInputFormatter {}
