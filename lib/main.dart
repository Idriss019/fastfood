import 'dart:io';

import 'package:fastfood/DB/database.dart';
import 'package:fastfood/DB/table/storageBD.dart';
import 'package:fastfood/names/creatingDishes/bloc/creating_dishes_bloc.dart';
import 'package:fastfood/names/password/cubit/password_cubit.dart';
import 'package:fastfood/names/purchases/bloc/purchases_bloc.dart';
import 'package:fastfood/names/recalculation/bloc/recalculation_bloc.dart';
import 'package:fastfood/names/theme/cubit/theme_cubit.dart';
import 'package:fastfood/routers.dart';
import 'package:fastfood/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:dartpy/dartpy.dart';
// import 'package:network_info_plus/network_info_plus.dart';

void main() async {
  runApp(const MyApp());
  String mac = '';
  Future<String> runPythonScript() async {
    // Укажите полный путь к интерпретатору Python, если он не в PATH
    var result = await Process.run('python3', [
      '/home/diamond/Programming/PL/Dart/fastfood/lib/GetMac.py',
    ]);
    // print('Вывод: ${result.stdout}');
    // print('Ошибки: ${result.stderr}');
    mac = result.stdout;
    return result.stdout;
  }

  print('Mac');
  await runPythonScript();
  print(mac);

  // print('MAC');
  // Future<String?> getMacAddress() async {
  //     final networkInfo = NetworkInfo();
  //     // Этот метод вернет MAC-адрес Wi-Fi адаптера.
  //     // Для других адаптеров потребуются дополнительные проверки.
  //     return await networkInfo.getWifiGatewayIP();
  //   }
  // print(getMacAddress);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Map choiceTheme = {'light': lightTheme, 'dark': darkTheme};
    final storageSql = StorageSQL(database: AppDatabase());
    final initialRecalculationState = RecalculationState(heightContainer: 30);
    // final db = AppDatabase();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit(context)),
        BlocProvider(create: (context) => PasswordCubit('')),
        BlocProvider(create: (context) => PurchasesBloc()),
        BlocProvider(create: (context) => CreatingDishesBloc()),
        BlocProvider(
            lazy: true,
            create: (context) => RecalculationBloc(
              initialState: initialRecalculationState,
              storageSql:storageSql,
              // heightContainer: 30.0,
            ),
          )
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: choiceTheme[state.theme],
            routerConfig: router,
          );
        },
      ),
    );
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //   ),
    //   home: const MyHomePage(title: 'Flutter Demo Home Page'),
    // );
  }
}

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    // transitionDuration: const Duration(milliseconds: 3000),
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}

// final _router = GoRouter(
//   routes: [
//     GoRoute(
//       path: '/',
//       pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
//         context: context,
//         state: state,
//         child: PasswordPage(),
//       ),
//       routes: [
//         GoRoute(
//           path: 'home',
//           pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
//             context: context,
//             state: state,
//             child: OrderPage(),
//           ),
//         ),
//         GoRoute(
//           path: 'Setting',
//           pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
//             context: context,
//             state: state,
//             child: Settings(),
//           ),
//         ),
//         GoRoute(
//           path: 'Purchases',
//           pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
//             context: context,
//             state: state,
//             child: Purchases(),
//           ),
//         ),
//         GoRoute(
//           path: 'AdjustmentPage',
//           pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
//             context: context,
//             state: state,
//             child: AdjustmentPage(),
//           ),
//         ),
//         GoRoute(
//             path: 'Tables',
//             pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
//                   context: context,
//                   state: state,
//                   child: Tables(),
//                 ),
//             routes: [
//         GoRoute(
//           path: 'StorageTable',
//           pageBuilder: (context, state) =>
//               buildPageWithDefaultTransition<void>(
//             context: context,
//             state: state,
//             child: StorageTable(),
//           ),
//         ),
//         GoRoute(
//           path: 'SalesTable',
//           pageBuilder: (context, state) =>
//               buildPageWithDefaultTransition<void>(
//             context: context,
//             state: state,
//             child: SalesTable(),
//           ),
//         ),
//         GoRoute(
//           path: 'PurchasesTable',
//           pageBuilder: (context, state) {
//             return buildPageWithDefaultTransition<void>(
//               context: context,
//               state: state,
//               child: PurchasesTable(),
//             );
//           },
//         ),
//         GoRoute(
//           path: 'HistoryTable',
//           pageBuilder: (context, state) {
//             return buildPageWithDefaultTransition<void>(
//               context: context,
//               state: state,
//               child: HistoryTable(),
//             );
//           },
//         ),
//         GoRoute(
//           path: 'StaffTable',
//           pageBuilder: (context, state) {
//             return buildPageWithDefaultTransition<void>(
//               context: context,
//               state: state,
//               child: StaffTable(),
//             );
//           },
//         ),
//         GoRoute(
//           path: 'Recalculation',
//           pageBuilder: (context, state) {
//             return buildPageWithDefaultTransition<void>(
//               context: context,
//               state: state,
//               child: Recalculation(),
//             );
//           },
//         ),
//         ]),
//         GoRoute(
//           path: 'CreateDishesPage',
//           pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
//             context: context,
//             state: state,
//             child: CreateDishesPage(),
//           ),
//         ),
//         GoRoute(
//           path: 'Disposal',
//           pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
//             context: context,
//             state: state,
//             child: CleanForStorage(),
//           ),
//         ),
//         GoRoute(
//           path: 'Payment',
//           pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
//             context: context,
//             state: state,
//             child: Payment(),
//           ),
//         ),
//         GoRoute(
//           path: 'Staff',
//           pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
//             context: context,
//             state: state,
//             child: Staff(),
//           ),
//         ),
//         GoRoute(
//           path: 'Report',
//           pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
//             context: context,
//             state: state,
//             child: Report(),
//           ),
//         ),
//       ],
//     ),
//   ],
// );
