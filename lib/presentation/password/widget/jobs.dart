import 'package:fastfood/presentation/password/cubit/password_cubit.dart';
import 'package:fastfood/presentation/password/widget/keyboard.dart';
import 'package:fastfood/navBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
// import 'package:flutter_numeric_keyboard/flutter_numeric_keyboard.dart';

class JobsData extends StatefulWidget {
  const JobsData({super.key});

  @override
  State<JobsData> createState() => _JobsDataState();
}

class _JobsDataState extends State<JobsData> {
  late PasswordCubit passwordBloc;

  // final passwordController = TextEditingController();
  // var _isObscured = true;

  @override
  void initState() {
    super.initState();
    passwordBloc = context.read<PasswordCubit>();
    // context.read<ThemeCubit>().loadTheme();
    // _isObscured = true;
  }

  @override
  void dispose() {
    super.dispose();
    // passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PasswordCubit>();

    return StreamBuilder<PasswordState>(
      initialData: bloc.state,
      stream: bloc.stream,
      builder: (context, snapshot) {
        final visibilityError = snapshot.requireData.errorPassword != ''
            ? true
            : false;
        return Flexible(
          flex: 2,
          child: Container(
            // color: Theme.of(context).colorScheme.pri,
            child: Center(
              child: Column(
                children: [
                  Expanded(child: SizedBox()),
                  // ClipRRect(
                  //   borderRadius: BorderRadius.all(Radius.circular(20)),
                  //   child: Image.asset(
                  //     "assets/img/start.jpg",
                  //     fit: BoxFit.fill,
                  //     width: 180,
                  //     height: 150,
                  //   ),
                  // ),
                  SizedBox(height: 15),
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
                  SizedBox(height: 15),
                  Center(
                    child: Text(
                      'Добро пожаловать!',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                        child: Text(
                          'Должность:',
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w600,
                            // color: Theme.of(context).colorScheme.onSecondary,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      SizedBox(width: 50),
                      BlocBuilder<PasswordCubit, PasswordState>(
                        builder: (context, state) {
                          return SizedBox(
                            height: 100,
                            child: Text(
                              state.power,
                              style: TextStyle(
                                fontSize: 35,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w500,
                                // color: Theme.of(context).colorScheme.onSecondary,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                        child: Text(
                          'Логин:',
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w600,
                            // color: Theme.of(context).colorScheme.onSecondary,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      SizedBox(width: 50),
                      BlocBuilder<PasswordCubit, PasswordState>(
                        builder: (context, state) {
                          return SizedBox(
                            height: 100,
                            child: Text(
                              state.login,
                              style: TextStyle(
                                fontSize: 35,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w500,
                                // color: Theme.of(context).colorScheme.onSecondary,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          );
                        },
                      ),
                      // SizedBox(
                      //   width: 270,
                      //   height: 100,
                      //   /* Строка для ввода пароля */
                      //   child: TextField(
                      //     cursorColor: Theme.of(
                      //       context,
                      //     ).colorScheme.onSecondary,
                      //     // autofocus: true,
                      //     style: TextStyle(
                      //       // fontFamily: 'Verdana',
                      //       // fontStyle: FontStyle.italic,
                      //       fontWeight: FontWeight.w600,
                      //       fontSize: 35,
                      //     ),
                      //     decoration: InputDecoration(
                      //       focusedBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(
                      //           color: Theme.of(
                      //             context,
                      //           ).colorScheme.onSecondary,
                      //           width: 1.5,
                      //         ),
                      //       ),
                      //       // border: OutlineInputBorder(
                      //       //     borderSide:
                      //       //         BorderSide(color: Colors.black, width: 1.5)),
                      //       // suffixIcon: IconButton(
                      //       //   onPressed: () {
                      //       //     setState(() {
                      //       //       _isObscured = !_isObscured;
                      //       //     });
                      //       //   },
                      //       //   icon: Icon(Icons.visibility),
                      //       // ),
                      //     ),
                      //     // onChanged: (value) {
                      //     //   if (bloc.changePasswordToStart(value)) {
                      //     //     context.go('/home');
                      //     //   }
                      //     // },
                      //     // controller: passwordController,
                      //     // obscureText: _isObscured,
                      //     inputFormatters: <TextInputFormatter>[
                      //       FilteringTextInputFormatter
                      //           .digitsOnly, // С таким фильтром могут быть введены только числа
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(height: 15),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     SizedBox(
                  //       height: 100,
                  //       child: Text(
                  //         'Введите пароль',
                  //         style: TextStyle(
                  //           fontSize: 35,
                  //           fontWeight: FontWeight.w600,
                  //           // color: Theme.of(context).colorScheme.onSecondary,
                  //           decoration: TextDecoration.none,
                  //         ),
                  //       ),
                  //     ),
                  //     SizedBox(width: 50),
                  //     SizedBox(
                  //       width: 270,
                  //       height: 100,
                  //       /* Строка для ввода пароля */
                  //       child: TextField(
                  //         cursorColor: Theme.of(
                  //           context,
                  //         ).colorScheme.onSecondary,
                  //         autofocus: true,
                  //         style: TextStyle(
                  //           // fontFamily: 'Verdana',
                  //           // fontStyle: FontStyle.italic,
                  //           fontWeight: FontWeight.w600,
                  //           fontSize: 35,
                  //         ),
                  //         decoration: InputDecoration(
                  //           focusedBorder: OutlineInputBorder(
                  //             borderSide: BorderSide(
                  //               color: Theme.of(
                  //                 context,
                  //               ).colorScheme.onSecondary,
                  //               width: 1.5,
                  //             ),
                  //           ),
                  //           // border: OutlineInputBorder(
                  //           //     borderSide:
                  //           //         BorderSide(color: Colors.black, width: 1.5)),
                  //           suffixIcon: IconButton(
                  //             onPressed: () {
                  //               setState(() {
                  //                 _isObscured = !_isObscured;
                  //               });
                  //             },
                  //             icon: Icon(Icons.visibility),
                  //           ),
                  //         ),
                  //         onChanged: (value) {},
                  //         // onChanged: (value) {
                  //         //   if (bloc.changePasswordToStart(value)) {
                  //         //     context.go('/home');
                  //         //     value = '';
                  //         //   }
                  //         // },
                  //         // keyboardType: TextInputType.numberWithOptions(),
                  //         controller: passwordController,
                  //         obscureText: _isObscured,
                  //         inputFormatters: <TextInputFormatter>[
                  //           FilteringTextInputFormatter
                  //               .digitsOnly, // С таким фильтром могут быть введены только числа
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),

                  // SizedBox(height: 5),
                  // FlutterNumericKeyboard(
                  //   width: 300,
                  //   height: 400,
                  //   showResult: false,
                  //   resultTextStyle: const TextStyle(
                  //     color: Colors.black,
                  //     fontSize: 20,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  //   resultFunction: (value) {
                  //     if (bloc.changePasswordToStart(value)) {
                  //       value = '';
                  //       context.go('/home');
                  //     }
                  //     passwordController.text = value;
                  //   },
                  //   obscureResult: false,
                  //   showDivider: true,
                  //   rightIconBack: const Icon(
                  //     Icons.backspace,
                  //     color: Colors.blueGrey,
                  //   ),
                  //   showRightIcon: true,
                  //   leftIconReset: const Icon(
                  //     Icons.refresh,
                  //     color: Colors.blueGrey,
                  //   ),
                  //   showLeftIcon: true,
                  //   digitStyle: TextStyle(
                  //     color: Theme.of(context).colorScheme.onSecondary,
                  //     fontSize: 15,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  //   backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  //   backgroundRadius: 20,
                  // ),
                  Expanded(child: SizedBox()),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// class WhitelistingTextInputFormatter {}
