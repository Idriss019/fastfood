import 'package:fastfood/bloc/password/password_cubit.dart';
import 'package:fastfood/bloc/theme/theme_cubit.dart';
import 'package:fastfood/pages/adjustment/page.dart';
import 'package:fastfood/pages/creatingDishes/page.dart';
import 'package:fastfood/pages/disposal/page.dart';
import 'package:fastfood/pages/orderHome/page.dart';
import 'package:fastfood/pages/password/passwordPage.dart';
import 'package:fastfood/pages/payment/page.dart';
import 'package:fastfood/pages/purchases/page.dart';
import 'package:fastfood/pages/settings/settings.dart';
import 'package:fastfood/pages/staff/page.dart';
import 'package:fastfood/pages/tables/historyTable.dart';
import 'package:fastfood/pages/tables/page.dart';
import 'package:fastfood/pages/tables/purchasesTable.dart';
import 'package:fastfood/pages/tables/salesTable.dart';
import 'package:fastfood/pages/tables/staffTable.dart';
import 'package:fastfood/pages/tables/storageTable.dart';
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
        GoRoute(
          path: 'Setting',
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: Settings(),
          ),
        ),
        GoRoute(
          path: 'Purchases',
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: Purchases(),
          ),
        ),
        GoRoute(
          path: 'AdjustmentPage',
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: AdjustmentPage(),
          ),
        ),
        GoRoute(
            path: 'Tables',
            pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
                  context: context,
                  state: state,
                  child: Tables(),
                ),
            routes: [
        GoRoute(
          path: 'StorageTable',
          pageBuilder: (context, state) =>
              buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: StorageTable(),
          ),
        ),
        GoRoute(
          path: 'SalesTable',
          pageBuilder: (context, state) =>
              buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: SalesTable(),
          ),
        ),
        GoRoute(
          path: 'PurchasesTable',
          pageBuilder: (context, state) {
            return buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: PurchasesTable(),
            );
          },
        ),
        GoRoute(
          path: 'HistoryTable',
          pageBuilder: (context, state) {
            return buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: HistoryTable(),
            );
          },
        ),
        GoRoute(
          path: 'StaffTable',
          pageBuilder: (context, state) {
            return buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: StaffTable(),
            );
          },
        ),
        ]),
        GoRoute(
          path: 'CreateDishesPage',
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: CreateDishesPage(),
          ),
        ),
        GoRoute(
          path: 'Disposal',
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: Disposal(),
          ),
        ),
        GoRoute(
          path: 'Payment',
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: Payment(),
          ),
        ),
        GoRoute(
          path: 'Staff',
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: Staff(),
          ),
        ),
      ],
    ),
  ],
);
