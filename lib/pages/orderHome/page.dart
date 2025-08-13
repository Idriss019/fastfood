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
    setState(() {
      // _onPressed = !_onPressed; _showOverlay
      if (_onPressed) {
        _onPressed = !_onPressed;
        return _showOverlay();
      } else {
        _onPressed = !_onPressed;
        return _removeOverlay();
      }
    });
  }

  OverlayEntry? _overlayEntry;

  void _showOverlay() {
    // _onPressed = !_onPressed;
    final overlay = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (context) => 
      Positioned(
        top: 30,
        left: 0,
        child: 
        Material(
          color: Colors.transparent,
          child: SizedBox(
            height: 1000,
            child: Navbar())
          // Container(
          //   width: 150,
          //   height: 150,
          //   color: Colors.red,
          //   child: Center(
          //     child: Text(
          //       'Появился сверху!',
          //       style: TextStyle(color: Colors.white, fontSize: 16),
          //     ),
          //   ),
          // ),
        ),
      ),
    );

    overlay?.insert(_overlayEntry!);
  }

  void _removeOverlay() {
    // _onPressed = !_onPressed;
    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() {
      
    });
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     // appBar: AppBar(title: Text('Overlay пример')),
  //     body: Center(
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           ElevatedButton(
  //             onPressed: _showOverlay,
  //             child: Text('Показать поверх'),
  //           ),
  //           SizedBox(height: 20),
  //           ElevatedButton(
  //             onPressed: _removeOverlay,
  //             child: Text('Скрыть'),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
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
                  onPressed: _onPress,
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
        ],
      ),
    );
  }
}
