import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Container(
        // width: 100,
        decoration: BoxDecoration(color: Colors.blue),
        child: Column(
          children: [
            Text('Меню', style: TextStyle(fontSize: 40)),
            Expanded(
              child: ListView(
                children: [
                  SizedBox(
                    height: 90,
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        print('Кофе');
                      },
                      // style: TextButton.styleFrom(
                      //   fixedSize: const Size(300, 100),
                      // ),
                      child: Text(
                        'Кофе',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 90,
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        print('Не Кофе');
                      },
                      // style: TextButton.styleFrom(
                      //   fixedSize: const Size(300, 100),
                      // ),
                      child: Text(
                        'Не Кофе',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 90,
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        print('Смузи');
                      },
                      // style: TextButton.styleFrom(
                      //   fixedSize: const Size(300, 100),
                      // ),
                      child: Text(
                        'Смузи',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 90,
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        print('Чай');
                      },
                      // style: TextButton.styleFrom(
                      //   fixedSize: const Size(300, 100),
                      // ),
                      child: Text(
                        'Чай',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 90,
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        print('Фреши');
                      },
                      // style: TextButton.styleFrom(
                      //   fixedSize: const Size(300, 100),
                      // ),
                      child: Text(
                        'Фреши',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 90,
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        print('Лимонады');
                      },
                      // style: TextButton.styleFrom(
                      //   fixedSize: const Size(300, 100),
                      // ),
                      child: Text(
                        'Лимонады',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 90,
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        print('Мороженое');
                      },
                      // style: TextButton.styleFrom(
                      //   fixedSize: const Size(300, 100),
                      // ),
                      child: Text(
                        'Мороженое',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 90,
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        print('Дисерты');
                      },
                      // style: TextButton.styleFrom(
                      //   fixedSize: const Size(300, 100),
                      // ),
                      child: Text(
                        'Дисерты',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}