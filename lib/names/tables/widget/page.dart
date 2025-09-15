import 'package:fastfood/navBar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Tables extends StatelessWidget {
  const Tables({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Navbar(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              Text('Таблицы', style: TextStyle(fontSize: 40)),
              Expanded(
                child: ListView(
                  children: [
                    SizedBox(
                      height: 90,
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          context.go('/Tables/PurchasesTable');
                        },
                        // style: TextButton.styleFrom(
                        //   fixedSize: const Size(300, 100),
                        // ),
                        child: Text('Закуп', style: TextStyle(fontSize: 25)),
                      ),
                    ),
                    SizedBox(
                      height: 90,
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          context.go('/Tables/SalesTable');
                        },
                        // style: TextButton.styleFrom(
                        //   fixedSize: const Size(300, 100),
                        // ),
                        child: Text('Продажи', style: TextStyle(fontSize: 25)),
                      ),
                    ),
                    SizedBox(
                      height: 90,
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          context.go('/Tables/StorageTable');
                        },
                        // style: TextButton.styleFrom(
                        //   fixedSize: const Size(300, 100),
                        // ),
                        child: Text('Склад', style: TextStyle(fontSize: 25)),
                      ),
                    ),
                    SizedBox(
                      height: 90,
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          context.go('/Tables/StaffTable');
                        },
                        // style: TextButton.styleFrom(
                        //   fixedSize: const Size(300, 100),
                        // ),
                        child: Text('Персонал', style: TextStyle(fontSize: 25)),
                      ),
                    ),
                    SizedBox(
                      height: 90,
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          context.go('/Tables/Recalculation');
                        },
                        // style: TextButton.styleFrom(
                        //   fixedSize: const Size(300, 100),
                        // ),
                        child: Text(
                          'Перерасчет',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 90,
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          context.go('/Tables/HistoryTable');
                        },
                        // style: TextButton.styleFrom(
                        //   fixedSize: const Size(300, 100),
                        // ),
                        child: Text(
                          'Журнал действий',
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
      ),
    );
    // return NavBarWidget(child: Center(
    //   child: Column(
    //     children: [
    //       TextButton(child: Text('Закуп'), onPressed: () {
    //         context.go('/Tables/PurchasesTable');
    //       },),
    //       TextButton(child: Text('Продажа'), onPressed: () {
    //         context.go('/Tables/SalesTable');
    //       },),
    //       TextButton(child: Text('Склад'), onPressed: () {
    //         context.go('/Tables/StorageTable');
    //       },),
    //       TextButton(child: Text('Персонал'), onPressed: () {
    //         context.go('/Tables/StaffTable');
    //       },),
    //       TextButton(child: Text('Перерасчет'), onPressed: () {
    //         context.go('/Tables/Recalculation');
    //       },),
    //       TextButton(child: Text('Журнал действий'), onPressed: () {
    //         context.go('/Tables/HistoryTable');
    //       },),
    //     ],
    //   ),
    // ));
  }
}
