import 'package:fastfood/presentation/password/cubit/password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class KeyboardPassword extends StatefulWidget {
  // final TextEditingController inputController;
  const KeyboardPassword({super.key});

  @override
  State<KeyboardPassword> createState() => _KeyboardPasswordState();
}

class _KeyboardPasswordState extends State<KeyboardPassword> {
  // TextEditingController get inputController => widget.inputController;
  // late TextEditingController inputController;
  // final passwordController = TextEditingController();
  late PasswordCubit passwordBloc;
  var _isObscured = true;

  @override
  void initState() {
    super.initState();
    passwordBloc = context.read<PasswordCubit>();
    // context.read<ThemeCubit>().loadTheme();
    _isObscured = true;
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   passwordController.dispose();
  // }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   final passwordBlocWatch = context.watch<PasswordCubit>();
  //   print('WWW');

  //   // final purchasesBloc = context.watch<PurchasesBloc>();
  //   // // Обновляем контроллер при изменении состояния
  //   final String password = passwordBlocWatch.state.inputPassword;
  //   print('password = $password');
  //   print('passwordController = ${passwordController.text}');
  //   if (passwordController.text != password) {
  //     print('QQQ');
  //     passwordController.value = TextEditingValue(
  //       text: password,
  //       selection: TextSelection.collapsed(offset: password.length),
  //     );
  //     // if (passwordBlocWatch.changePasswordToStart(passwordController.text)) {
  //     //   context.go('/home');
  //     //   passwordController.text = '';
  //     // }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // final bloc = context.read<PasswordCubit>();

    return Flexible(
      flex: 1,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.deepPurple),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  // height: 100,
                  child: Text(
                    'Введите пароль',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w600,
                      // color: Theme.of(context).colorScheme.onSecondary,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                // SizedBox(height: 20),
                Container(
                  // padding: EdgeInsets.only(top: 20, bottom: 20),
                  margin: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 20,
                    bottom: 20,
                  ),
                  // color: Colors.white,
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 40),
                      Center(
                        child: BlocConsumer<PasswordCubit, PasswordState>(
                          listenWhen: (previous, current) =>
                              previous.inputPassword != current.inputPassword,
                          listener: (context, state) async {
                            if (passwordBloc.changePasswordToStart(
                              state.inputPassword,
                            )) {
                              // задержка 2 секунды
                              await Future.delayed(const Duration(seconds: 2));

                              if (!context.mounted) return;

                              context.go('/home');

                              passwordBloc.updateState(
                                state.copyWith(inputPassword: ''),
                              );
                            }
                          },
                          buildWhen: (previous, current) =>
                              previous.inputPassword != current.inputPassword,
                          builder: (context, state) {
                            return Text(
                              _isObscured
                                  ? '•' * state.inputPassword.length
                                  : state.inputPassword,
                              style: const TextStyle(fontSize: 40),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            );
                          },
                        ),

                        // BlocBuilder<PasswordCubit, PasswordState>(
                        //   buildWhen: (previous, current){
                        //     return previous.inputPassword != current.inputPassword;
                        //   },
                        //   builder: (context, state) {
                        //     if (passwordBloc.changePasswordToStart(state.inputPassword)) {
                        //       context.go('/home');
                        //       passwordBloc.updateState(
                        //         state.copyWith(inputPassword: ''),
                        //       );
                        //     }
                        //     return Text(
                        //       _isObscured
                        //           ? '•' * state.inputPassword.length
                        //           : state.inputPassword,
                        //       style: const TextStyle(fontSize: 40),
                        //       maxLines: 1,
                        //       overflow: TextOverflow.ellipsis,
                        //     );
                        //   },
                        // ),

                        // BlocListener<PasswordCubit, PasswordState>(
                        //     listenWhen: (previous, current) =>
                        //         previous.inputPassword != current.inputPassword,
                        //     listener: (context, state) {
                        //       // setState(() {

                        //       // });
                        //       // реакция на изменение пароля
                        //       // debugPrint('Password changed: ${state.inputPassword}');
                        //     },
                        //     child: Text(
                        //       // _isObscured
                        //       //     ? '•' * inputController.text.length
                        //       //     : inputController.text,passwordBloc
                        //       _isObscured
                        //           ? '•' * passwordBloc.state.inputPassword.length
                        //           : passwordBloc.state.inputPassword,
                        //       // _isObscured
                        //       //     ? '•' * passwordController.text.length
                        //       //     : passwordController.text,
                        //       style: TextStyle(fontSize: 40),
                        //       maxLines: 1,
                        //       overflow: TextOverflow.ellipsis,
                        //     ),
                        //   ),

                        // child: BlocBuilder<PasswordCubit, PasswordState>(
                        //   buildWhen: (c, s) => c.inputPassword != s.inputPassword,
                        //   builder: (_, state) {
                        //     // return TextField(
                        //     //   key: ValueKey(state.fieldVersion),
                        //     // );
                        //     return Text(
                        //       // _isObscured
                        //       //     ? '•' * inputController.text.length
                        //       //     : inputController.text,
                        //       _isObscured
                        //           ? '•' * passwordController.text.length
                        //           : passwordController.text,
                        //       style: TextStyle(fontSize: 40),
                        //       maxLines: 1,
                        //       overflow: TextOverflow.ellipsis,
                        //     );
                        //   },
                        // ),

                        // child: Text(
                        //   _isObscured
                        //       ? '•' * inputController.text.length
                        //       : inputController.text,
                        //   // _isObscured
                        //   //     ? '•' * passwordController.text.length
                        //   //     : passwordController.text,
                        //   style: TextStyle(fontSize: 40),
                        //   maxLines: 1,
                        //   overflow: TextOverflow.ellipsis,
                        // ),
                      ),
                      IconButton(
                        iconSize: 40,
                        onPressed: () {
                          setState(() {
                            _isObscured = !_isObscured;
                          });
                        },
                        icon: Icon(
                          _isObscured ? Icons.visibility : Icons.visibility_off,
                        ),
                        splashRadius: 20,
                        // padding: EdgeInsets.all(8),
                      ),
                    ],
                  ),
                ),
                // SizedBox( // Text Field
                //   width: 270,
                //   height: 100,
                //   /* Строка для ввода пароля */
                //   child: TextField(
                //     cursorColor: Theme.of(
                //       context,
                //     ).colorScheme.onSecondary,
                //     autofocus: true,
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
                //       suffixIcon: IconButton(
                //         onPressed: () {
                //           setState(() {
                //             _isObscured = !_isObscured;
                //           });
                //         },
                //         icon: Icon(Icons.visibility),
                //       ),
                //     ),
                //     // onChanged: (value) {},
                //     onChanged: (value) {
                //       // print(passwordController.text);
                //       // if (bloc.changePasswordToStart(passwordController.text)) {
                //       //   context.go('/home');
                //       //   value = '';
                //       // }
                //     },
                //     // keyboardType: TextInputType.numberWithOptions(),
                //     controller: passwordController,
                //     obscureText: _isObscured,
                //     inputFormatters: <TextInputFormatter>[
                //       FilteringTextInputFormatter
                //           .digitsOnly, // С таким фильтром могут быть введены только числа
                //     ],
                //   ),
                // ),
              ],
            ),
            // SizedBox(
            //   child: Text(
            //     'Клиент предоставил',
            //     style: TextStyle(fontSize: 30),
            //   ),
            // ),
            // Row(
            //   children: [
            //     Expanded(
            //       child: SizedBox(
            //         child: Column(
            //           children: [
            //             SizedBox(
            //               child: Text(
            //                 'Нал',
            //                 style: TextStyle(fontSize: 20),
            //               ),
            //             ),
            //             SizedBox(
            //               child: Text(
            //                 '2 000',
            //                 style: TextStyle(fontSize: 30),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //     Expanded(
            //       child: SizedBox(
            //         child: Column(
            //           children: [
            //             SizedBox(
            //               child: Text(
            //                 'Карта',
            //                 style: TextStyle(fontSize: 20),
            //               ),
            //             ),
            //             SizedBox(
            //               child: Text(
            //                 '3 000',
            //                 style: TextStyle(fontSize: 30),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 2),
            //   child: Divider(height: 2, color: Colors.black),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 2),
            //   child: Divider(height: 2, color: Colors.black),
            // ),
            // SizedBox(
            //   child: Text('Всего', style: TextStyle(fontSize: 25)),
            // ),
            // SizedBox(
            //   child: Text('5 000', style: TextStyle(fontSize: 40)),
            // ),
            // Row(
            //   children: [
            //     Expanded(
            //       child: Column(
            //         children: [
            //           SizedBox(
            //             child: Text(
            //               'Итог',
            //               style: TextStyle(fontSize: 25),
            //             ),
            //           ),
            //           SizedBox(
            //             child: Text(
            //               '4 500',
            //               style: TextStyle(fontSize: 40),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //     Expanded(
            //       child: Column(
            //         children: [
            //           SizedBox(
            //             child: Text(
            //               'Скидка %',
            //               style: TextStyle(fontSize: 20),
            //             ),
            //           ),
            //           SizedBox(
            //             child: Text(
            //               '0',
            //               style: TextStyle(fontSize: 40),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
            // Expanded(child: SizedBox()),
            SizedBox(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: TextButton(
                            onPressed: () {
                              passwordBloc.plusValueState('1');
                              // passwordController.text += '1';
                              // // setState(() {
                              // // ограничить до 12 символов!
                              // passwordController.text += '1';
                              // // passwordBloc.inputPassword(
                              // //   '${passwordBloc.state.inputPassword}1',
                              // // );
                              // print(passwordBloc.state.inputPassword);
                              // print(passwordController.text);
                              // // });
                            },
                            child: Text('1', style: TextStyle(fontSize: 40)),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: TextButton(
                            onPressed: () {
                              passwordBloc.plusValueState('2');
                              // passwordController.text += '2';
                              // setState(() {
                              // passwordController.text += '2';
                              // passwordBloc.inputPassword(
                              //   '${passwordBloc.state.inputPassword}2',
                              //   // passwordController.text += '2',
                              // );
                              // context.go('/home');

                              //   passwordController.text = '';
                              // passwordBloc.changePasswordToStart('123');
                              // passwordController.text += '2';
                              // });
                              // if (bloc.changePasswordToStart(
                              //   passwordController.text,
                              // )) {
                              //   context.go('/home');
                              //   passwordController.text = '';
                              // }
                            },
                            child: Text('2', style: TextStyle(fontSize: 40)),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: TextButton(
                            onPressed: () {
                              passwordBloc.plusValueState('3');
                              // inputController.text += '3';
                              // setState(() {
                              // passwordBloc.inputPassword(
                              //   '${passwordBloc.state.inputPassword}3',
                              //   // passwordController.text += '3',
                              // );
                              // passwordController.text += '3';
                              // }
                              // );
                            },
                            child: Text('3', style: TextStyle(fontSize: 40)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: TextButton(
                            onPressed: () {
                              passwordBloc.plusValueState('4');
                              // inputController.text += '4';
                              // setState(() {
                              //   passwordController.text += '4';
                              // });
                            },
                            child: Text('4', style: TextStyle(fontSize: 40)),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: TextButton(
                            onPressed: () {
                              passwordBloc.plusValueState('5');
                              // inputController.text += '5';
                              // setState(() {
                              //   passwordController.text += '5';
                              // });
                            },
                            child: Text('5', style: TextStyle(fontSize: 40)),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: TextButton(
                            onPressed: () {
                              passwordBloc.plusValueState('6');
                              // inputController.text += '6';
                              // setState(() {
                              //   passwordController.text += '6';
                              // });
                              // print(passwordController.text);
                              // if (bloc.changePasswordToStart(
                              //   passwordController.text,
                              // )) {
                              //   context.go('/home');
                              //   passwordController.text = '';
                              // }
                            },
                            child: Text('6', style: TextStyle(fontSize: 40)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: TextButton(
                            onPressed: () {
                              passwordBloc.plusValueState('7');
                              // inputController.text += '7';
                              // setState(() {
                              //   passwordController.text += '7';
                              // });
                            },
                            child: Text('7', style: TextStyle(fontSize: 40)),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: TextButton(
                            onPressed: () {
                              passwordBloc.plusValueState('8');
                              // inputController.text += '8';
                              // setState(() {
                              //   passwordController.text += '8';
                              // });
                            },
                            child: Text('8', style: TextStyle(fontSize: 40)),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: TextButton(
                            onPressed: () {
                              passwordBloc.plusValueState('9');
                              // inputController.text += '9';
                              // setState(() {
                              //   passwordController.text += '9';
                              // });
                            },
                            child: Text('9', style: TextStyle(fontSize: 40)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: IconButton(
                            onPressed: () {
                              passwordBloc.updateState(
                                passwordBloc.state.copyWith(inputPassword: ''),
                              );
                              // inputController.text = '';
                              // setState(() {
                              //   passwordController.text = '';
                              // });
                            },
                            icon: const Icon(
                              size: 40,
                              Icons.refresh,
                              // color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: TextButton(
                            onPressed: () {
                              passwordBloc.plusValueState('0');
                              // inputController.text += '0';
                              // setState(() {
                              //   passwordController.text += '0';
                              // });
                            },
                            child: Text('0', style: TextStyle(fontSize: 40)),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: IconButton(
                            onPressed: () {
                              passwordBloc.updateState(
                                passwordBloc.state.copyWith(
                                  inputPassword:
                                      passwordBloc
                                          .state
                                          .inputPassword
                                          .isNotEmpty
                                      ? passwordBloc.state.inputPassword
                                            .substring(
                                              0,
                                              passwordBloc
                                                      .state
                                                      .inputPassword
                                                      .length -
                                                  1,
                                            )
                                      : '',
                                ),
                              );
                              // if (inputController.text.isNotEmpty) {
                              //   setState(() {
                              //     inputController.text = inputController.text
                              //         .substring(
                              //           0,
                              //           inputController.text.length - 1,
                              //         );
                              //   });
                              // }
                              // if (passwordController.text.isNotEmpty) {
                              //   setState(() {
                              //     passwordController.text = passwordController
                              //         .text
                              //         .substring(
                              //           0,
                              //           passwordController.text.length - 1,
                              //         );
                              //   });
                              // }
                            },
                            icon: const Icon(
                              size: 40,
                              Icons.backspace,
                              // color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: SizedBox(
                  //         child: IconButton(
                  //           onPressed: () {},
                  //           icon: const Icon(
                  //             size: 40,
                  //             Icons.refresh,
                  //             // color: Colors.black,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     Expanded(
                  //       child: SizedBox(
                  //         child: IconButton(
                  //           onPressed: () {},
                  //           icon: const Icon(
                  //             size: 40,
                  //             Icons.backspace,
                  //             // color: Colors.black,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
            // SizedBox(
            //   width: double.infinity,
            //   child: TextButton(
            //     onPressed: () {},
            //     child: Text('Чек', style: TextStyle(fontSize: 40)),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
