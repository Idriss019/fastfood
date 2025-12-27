import 'dart:io';
// import 'dart:convert';
import 'package:fastfood/DB/database.dart';
import 'package:fastfood/DB/table/dishesDB.dart';
import 'package:fastfood/DB/table/purchasesDB.dart';
import 'package:fastfood/DB/table/staffDB.dart';
import 'package:fastfood/DB/table/storageBD.dart';
import 'package:fastfood/data_class/staff_data.dart';
import 'package:fastfood/presentation/creatingDishes/bloc/creating_dishes_bloc.dart';
import 'package:fastfood/presentation/password/cubit/password_cubit.dart';
import 'package:fastfood/presentation/purchases/bloc/purchases_bloc.dart';
import 'package:fastfood/presentation/recalculation/bloc/recalculation_bloc.dart';
import 'package:fastfood/presentation/staff/bloc/staff_bloc.dart';
import 'package:fastfood/presentation/theme/cubit/theme_cubit.dart';
import 'package:fastfood/routers.dart';
import 'package:fastfood/theme.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
// import 'package:dartpy/dartpy.dart';
// import 'package:network_info_plus/network_info_plus.dart';
import 'package:window_size/window_size.dart';

void main() async {
  // StaffSQL staffSQL = StaffSQL(database: AppDatabase());
  // staffSQL.insertRoot();
  final exePath = '/proc/self/exe';
  if (File(exePath).existsSync()) {
    print('Executable path: ${File(exePath).resolveSymbolicLinksSync()}');
  } else {
    print('Cannot access $exePath');
  }

  runApp(const MyApp());
  String mac = '';
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('My App');
    setWindowMinSize(const Size(1024, 748));
    setWindowMaxSize(const Size(1024, 748));
    setWindowFrame(const Rect.fromLTWH(100, 100, 1024, 748));
  }
  //   Future<String?> getMacAddressLinux() async {
  //   try {
  //     // Запуск команды ip link show
  //     final ProcessResult result = await Process.run('ip', ['link', 'show']);

  //     if (result.exitCode != 0) {
  //       print('Ошибка выполнения команды: ${result.stderr}');
  //       return null;
  //     }

  //     final String output = result.stdout.toString();

  //     // Парсим вывод для поиска MAC-адреса (после 'link/ether')
  //     final macAddressLine = output.split('\n')
  //         .firstWhere(
  //             (line) => line.trim().startsWith('ether'),
  //       );

  //     if (macAddressLine != null) {
  //       return macAddressLine.split(' ').first.trim(); // или другая логика парсинга
  //     } else {
  //       print('MAC-адрес не найден.');
  //       return null;
  //     }
  //   } catch (e) {
  //     print('Ошибка при получении MAC-адреса: $e');
  //     return null;
  //   }
  // }
  // final String? macAddress = await getMacAddressLinux();
  // if (macAddress != null) {
  //         print('MAC-адрес:!!!! $macAddress');
  //       } else {
  //         print('Не удалось получить MAC-адрес.');
  //       }
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
    final purchaseSql = PurchasesSql(database: AppDatabase());
    final dishesSQL = DishesSQL(database: AppDatabase());
    final staffSql = StaffSQL(database: AppDatabase());
    // final staffSQL = StaffSQL(database: AppDatabase());
    // // staffSQL.insertRoot();
    // List<StaffData> staffList = staffSQL.getAllStaff();
    // print(staffList[0].login);

    // final initialRecalculationState = RecalculationState();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit(context)),
        BlocProvider(create: (context) => PasswordCubit(staffSQL:staffSql)),
        BlocProvider(
          create: (context) => StaffBloc(staffSql),
        ),
        BlocProvider(
          create: (context) =>
              PurchasesBloc(purchasesSql: purchaseSql, storageSQL: storageSql),
        ),
        BlocProvider(
          create: (context) =>
              CreatingDishesBloc(storageSQL: storageSql, dishesSQL: dishesSQL),
        ),
        // BlocProvider(
        //   lazy: true,
        //   create: (context) => RecalculationBloc(
        //     // initialState: initialRecalculationState,
        //     storageSql: storageSql,
        //     // heightContainer: 30.0,
        //   ),
        // ),
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
