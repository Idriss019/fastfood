import 'package:flutter/material.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.deepPurple),
        child: Column(
          children: [
            SizedBox(
              child: Text(
                'Клиент предоставил',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    child: Column(
                      children: [
                        SizedBox(
                          child: Text(
                            'Нал',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          child: Text(
                            '2 000',
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    child: Column(
                      children: [
                        SizedBox(
                          child: Text(
                            'Карта',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          child: Text(
                            '3 000',
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Divider(height: 2, color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Divider(height: 2, color: Colors.black),
            ),
            SizedBox(
              child: Text('Всего', style: TextStyle(fontSize: 25)),
            ),
            SizedBox(
              child: Text('5 000', style: TextStyle(fontSize: 40)),
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        child: Text(
                          'Итог',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      SizedBox(
                        child: Text(
                          '4 500',
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        child: Text(
                          'Скидка %',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        child: Text(
                          '0',
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(child: SizedBox()),
            SizedBox(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              '1',
                              style: TextStyle(fontSize: 40),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              '2',
                              style: TextStyle(fontSize: 40),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              '3',
                              style: TextStyle(fontSize: 40),
                            ),
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
                            onPressed: () {},
                            child: Text(
                              '4',
                              style: TextStyle(fontSize: 40),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              '5',
                              style: TextStyle(fontSize: 40),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              '6',
                              style: TextStyle(fontSize: 40),
                            ),
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
                            onPressed: () {},
                            child: Text(
                              '7',
                              style: TextStyle(fontSize: 40),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              '8',
                              style: TextStyle(fontSize: 40),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              '9',
                              style: TextStyle(fontSize: 40),
                            ),
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
                            onPressed: () {},
                            child: Text(
                              '00',
                              style: TextStyle(fontSize: 40),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              '0',
                              style: TextStyle(fontSize: 40),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              '000',
                              style: TextStyle(fontSize: 40),
                            ),
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
                            onPressed: () {},
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
                          child: IconButton(
                            onPressed: () {},
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
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {},
                child: Text('Чек', style: TextStyle(fontSize: 40)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
