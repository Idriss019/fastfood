import 'package:fastfood/presentation/theme/cubit/theme_cubit.dart';
import 'package:fastfood/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class NavBarWidget extends StatefulWidget {
  final Widget child;
  const NavBarWidget({required this.child, super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget>
    with SingleTickerProviderStateMixin {
  // late Widget child;
  late AnimationController _controller;
  late Animation<Offset> _animation;

  bool _onPressed = false;

  // void _onPress() {
  //   _onPressed = !_onPressed;
  //   _startAnimation();
  //   setState(() {});
  // }
  void _toggleContainer() {
    if (_onPressed) {
      _controller.reverse(); // уезжает обратно
    } else {
      _controller.forward(); // выезжает вперед
    }
    setState(() {
      _onPressed = !_onPressed; // меняем состояние
    });
  }

  @override
  void initState() {
    super.initState();
    // child = widget.child;
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    // Анимация сдвига слева направо
    _animation = Tween<Offset>(
      begin: Offset(-1.0, 0.0), // полностью слева за границей экрана
      end: Offset(0.0, 0.0), // на месте
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // // Запускаем анимацию при инициализации
    // _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed:
                      _toggleContainer, //_onPress, keyboard_backspace_outlined
                  icon: _onPressed == true
                      ? Icon(Icons.keyboard_backspace_outlined)
                      : Icon(Icons.menu),
                ),
                // Navbar(),
                TextButton(
                  onPressed: () {
                    context.go('/home');
                  },
                  child: Text('Заказы'),
                ),
                SizedBox(width: 50),
              ],
            ),
          ),
          SizedBox(
            // color: Colors.blue,
            width: double.infinity,
            height: 700,
            child: Stack(
              children: [
                widget.child,
                SlideTransition(
                  position: _animation,
                  // child: SizedBox(width: 300, height: 610, child: Navbar()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Navbar extends StatefulWidget {
  // late bool themeLight;
  late Widget child;

  Navbar({super.key, required this.child});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  late ThemeCubit themeCubit;
  Map choiceTheme = {'light': lightTheme, 'dark': darkTheme};
  bool onPress = themeChoice == 'light' ? true : false;
  @override
  void initState() {
    themeCubit = context.read<ThemeCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // new Future.delayed(const Duration(seconds: 8), () {
    //   // deleayed code here
    //   // print('delayed execution');
    // });
    // if (Scaffold.of(context).isDrawerOpen) {
    //   Scaffold.of(context).closeDrawer();
    // }
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.grey,
        shadowColor: Colors.orange,
        title: Column(
          children: [
            Container(
              // color: Colors.grey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // IconButton(
                  //   onPressed:
                  //       _toggleContainer, //_onPress, keyboard_backspace_outlined
                  //   icon: _onPressed == true
                  //       ? Icon(Icons.keyboard_backspace_outlined)
                  //       : Icon(Icons.menu),
                  // ),
                  // Navbar(),
                  TextButton(
                    onPressed: () {
                      context.go('/home');
                    },
                    child: Text('Заказы'),
                  ),
                  TextButton(
                    onPressed: () {
                      context.go('/Payment');
                    },
                    child: Text('Оплата'),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      // size: 50,
                      Icons.lock_outline,
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   // color: Colors.blue,
            //   width: double.infinity,
            //   height: 700,
            //   child: Stack(
            //     children: [
            //       widget.child,
            //       SlideTransition(
            //         position: _animation,
            //         child: SizedBox(width: 300, height: 610, child: Navbar()),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              leading: const Icon(
                Icons.assignment_outlined,
              ), // analytics_outlined
              title: const Text('Заказы'),
              onTap: () {
                context.go('/home');
              },
            ),
            ListTile(
              leading: const Icon(Icons.balance), // arrow_circle_up
              title: const Text('Оплата'),
              onTap: () {
                context.go('/Payment');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.delete,
              ), //app_registration architecture create
              title: const Text('Снятие со склада'),
              onTap: () {
                context.go('/Disposal');
              },
            ),
            ListTile(
              leading: const Icon(Icons.store), //app_registration architecture
              title: const Text('Склад'),
              onTap: () {
                context.go('/StoragePage');
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_shopping_cart),
              title: const Text('Закуп'),
              onTap: () {
                context.go('/Purchases');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.person, // assignment_ind,
              ), //app_registration architecture
              title: const Text('Персонал'),
              onTap: () {
                context.go('/Staff');
              },
            ),
            ListTile(
              leading: const Icon(Icons.apps_sharp),
              title: const Text('Таблицы'),
              onTap: () {
                context.go('/Tables');
              },
            ),
            ListTile(
              leading: const Icon(Icons.create), //app_registration architecture
              title: const Text('Создание блюда'),
              onTap: () {
                context.go('/CreateDishesPage');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.assessment_outlined,
              ), //app_registration architecture
              title: const Text('Отчет'),
              onTap: () {
                context.go('/Report');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Настройки'),
              onTap: () {
                context.go('/Setting');
              },
            ),
            ListTile(
              leading: themeCubit.state.themeIcon, // brightness_2
              // leading: themeCubit.state.theme == 'light'? Icon(Icons.brightness_5_outlined): Icon(Icons.brightness_2), // brightness_2
              title: const Text('Тема'),
              onTap: () {
                //   themeChoice = onPress ? 'dark' : 'light';
                // setTheme(context, onPress);
                setState(() {
                  if (themeCubit.state.theme == 'light') {
                    themeCubit.updateTheme('dark', context);
                  } else {
                    themeCubit.updateTheme('light', context);
                  }
                });
              },
            ),
            // ListTile(
            //   leading: const Icon(
            //     Icons.assessment_outlined,
            //   ), //app_registration architecture
            //   title: const Text('Отчет'),
            //   onTap: () {
            //     context.pop();
            //     context.go('/report');
            //   },
            // ),
            // ListTile(
            //   leading: const Icon(Icons.amp_stories_outlined),
            //   title: const Text('Прочее'),
            //   onTap: () {
            //     context.pop();
            //     context.go('/other');
            //   },
            // ),
            SizedBox(height: 10),
            const Divider(),
            ListTile(
              // leading: const Icon(Icons.exit_to_app),
              leading: const Icon(Icons.subdirectory_arrow_left),
              title: const Text('Выход'),
              onTap: () {
                context.go('/');
                // context.pop();
                // Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: widget.child,

      // Column(
      //   children: [
      //     // Container(
      //     //   color: Colors.grey,
      //     //   child: Row(
      //     //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     //     children: [
      //     //       IconButton(
      //     //         onPressed:
      //     //             _toggleContainer, //_onPress, keyboard_backspace_outlined
      //     //         icon: _onPressed == true
      //     //             ? Icon(Icons.keyboard_backspace_outlined)
      //     //             : Icon(Icons.menu),
      //     //       ),
      //     //       // Navbar(),
      //     //       TextButton(
      //     //         onPressed: () {
      //     //           context.go('/home');
      //     //         },
      //     //         child: Text('Заказы'),
      //     //       ),
      //     //       SizedBox(width: 50),
      //     //     ],
      //     //   ),
      //     // ),
      //     SizedBox(
      //       // color: Colors.blue,
      //       width: double.infinity,
      //       height: 700,
      //       child: Stack(
      //         children: [
      //           widget.child,
      //           // SlideTransition(
      //           //   position: _animation,
      //           //   child: SizedBox(width: 300, height: 610, child: Navbar()),
      //           // ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
