import 'package:fastfood/navBar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Tables extends StatelessWidget {
  const Tables({super.key});

  @override
  Widget build(BuildContext context) {
    return NavBarWidget(child: Center(
      child: Column(
        children: [
          TextButton(child: Text('Закуп'), onPressed: () {
            context.go('/Tables/PurchasesTable');
          },),
          TextButton(child: Text('Продажа'), onPressed: () {
            context.go('/Tables/SalesTable');
          },),
          TextButton(child: Text('Склад'), onPressed: () {
            context.go('/Tables/StorageTable');
          },),
          TextButton(child: Text('Персонал'), onPressed: () {
            context.go('/Tables/StaffTable');
          },),
          TextButton(child: Text('Перерасчет'), onPressed: () {
            context.go('/Tables/Recalculation');
          },),
          TextButton(child: Text('Журнал действий'), onPressed: () {
            context.go('/Tables/HistoryTable');
          },),
        ],
      ),
    ));
  }
}
