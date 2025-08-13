import 'package:fastfood/bloc/password/password_cubit.dart';
import 'package:fastfood/bloc/theme/theme_cubit.dart';
import 'package:fastfood/pages/orderHome/page.dart';
import 'package:fastfood/pages/password/passwordPage.dart';
import 'package:fastfood/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Map choiceTheme = {'light': lightTheme, 'dark': darkTheme};
    // final db = AppDatabase();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit(context)),
        BlocProvider(create: (context) => PasswordCubit('')),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: choiceTheme[state.theme],
            routerConfig: _router,
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

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: PasswordPage(),
      ),
      routes: [
        GoRoute(
          path: 'home',
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: OrderPage(),
          ),
        ),
        // GoRoute(
        //   path: 'purchases',
        //   pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        //     context: context,
        //     state: state,
        //     child: PurchasesPage(),
        //   ),
        // ),
        // GoRoute(
        //   path: 'order',
        //   pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        //     context: context,
        //     state: state,
        //     child: OrderPage(),
        //   ),
        // ),
        // GoRoute(
        //     path: 'tables',
        //     pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        //           context: context,
        //           state: state,
        //           child: TablePageWidget(),
        //         ),
        //     routes: [
        // GoRoute(
        //   path: 'storage',
        //   pageBuilder: (context, state) =>
        //       buildPageWithDefaultTransition<void>(
        //     context: context,
        //     state: state,
        //     child: StoragePage(),
        //   ),
        // ),
        // GoRoute(
        //   path: 'sales',
        //   pageBuilder: (context, state) =>
        //       buildPageWithDefaultTransition<void>(
        //     context: context,
        //     state: state,
        //     child: SalesPage(),
        //   ),
        // ),
        // GoRoute(
        //   path: 'purchaseTable',
        //   pageBuilder: (context, state) {
        //     return buildPageWithDefaultTransition<void>(
        //       context: context,
        //       state: state,
        //       child: PurchasesTableWidget(),
        //     );
        //   },
        // ),
        // ]),
        // GoRoute(
        //   path: 'storage',
        //   pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        //     context: context,
        //     state: state,
        //     child: StoragePage(),
        //   ),
        // ),
        // GoRoute(
        //   path: 'sales',
        //   pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        //     context: context,
        //     state: state,
        //     child: SalesPage(),
        //   ),
        // ),
        // GoRoute(
        //   path: 'recalculation',
        //   pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        //     context: context,
        //     state: state,
        //     child: RecalculationPage(),
        //   ),
        // ),
        // GoRoute(
        //   path: 'setting',
        //   pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        //     context: context,
        //     state: state,
        //     child: SettingPage(),
        //   ),
        // ),
      ],
    ),
  ],
);
