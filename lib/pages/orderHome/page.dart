import 'package:fastfood/navBar.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage>
    with SingleTickerProviderStateMixin {
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
              children: [
                IconButton(
                  onPressed: _toggleContainer, //_onPress, keyboard_backspace_outlined
                  icon: _onPressed == true ? Icon(Icons.keyboard_backspace_outlined): Icon(Icons.menu),
                ),
                // Navbar(),
                Expanded(
                  child: Container(
                    // margin: EdgeInsets.only(left: 25, right: 25),
                    child: Column(
                      children: [
                        // Expanded(
                        //   // child: SingleChildScrollView(
                        //   child:
                        Column(children: [Text('Заказы')]),
                        // ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.blue,
            width: double.infinity,
            height: 700,
            child: Stack(
              children: [
                Visibility(
                  visible: true, //_onPressed, // или условие
                  child: SlideTransition(
                    position: _animation,
                    child: SizedBox(width: 300, height: 600, child: Navbar()),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),

    );
  }
}
