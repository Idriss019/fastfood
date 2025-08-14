import 'package:fastfood/navBar.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  bool _onPressed = false;
  void _onPress() {
    _onPressed = !_onPressed;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                color: Colors.grey,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: _onPress, //_onPress,
                      icon: Icon(Icons.settings_outlined),
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
              Container(color: Colors.blue, width: double.infinity, height: 700),
              // Stack(
              //   children: [
              //     Expanded(
              //       child: Container(
              //         color: Colors.blue,
              //         width: double.infinity,
              //         height: double.infinity,
              //       ),
              //     ),
              //     // Expanded(
              //     //   child: Container(
              //     //     color: Colors.red,
              //     //   ),
              //     // ),
              //     // Positioned(
              //     //   left: 0,
              //     //   bottom: 0,
              //     //   child: Visibility(
              //     //               visible: _onPressed,
              //     //               child: Navbar()),
              //     // )
              //     Visibility(
              //       visible: _onPressed, // или условие
              //       child: Positioned(
              //         top: 50,
              //         left: 50,
              //         child: Container(color: Colors.red, width: 100, height: 100),
              //       ),
              //     ),
              //   ],
              // ),
              // Row(
              //   children: [
              //     Stack(
              //       children: [
              //         // Другие виджеты
              //         Container(color: Colors.blue, width: 200, height: 200),
              //         // Контейнер, который должен появляться сверху
              //         Visibility(
              //           visible: _onPressed, // или условие
              //           child: Positioned(
              //             top: 50,
              //             left: 50,
              //             child: Container(
              //               color: Colors.red,
              //               width: 100,
              //               height: 100,
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
              
              // Visibility(
              //   visible: _onPressed, // или условие
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       SizedBox(height: 600, width: 300, child: Navbar()),
              //       // SizedBox(),
                    
              //     ],
              //   ),
              // ),
              
              

              //    Visibility(
              //   visible: _onPressed, // или условие
              //   child: Positioned(
              //     top: 50,
              //     left: 0,
              //     child: SizedBox(
              //       height: 600,
              //       width: 300,
              //       child: Navbar()),
              //   ),
              // ),
            ],
          ),
          // Container(color: Colors.blue, width: 200, height: 200),
          // Positioned(
          //   top: 50,
          //           left: 50,
            // child: 
            Visibility(
                  visible: _onPressed, // или условие
                  child: Positioned(
                    top: 40,
                    left: 0,
                    child: SizedBox(
            width: 300,
            height: 600,
            child: Navbar(),
                    ),
                  ),
                ),
          // ),
        ],
      ),
    );
  }
}
