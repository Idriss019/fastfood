import 'package:fastfood/main.dart';
import 'package:fastfood/presentation/storage_page/widget/page.dart';
import 'package:fastfood/presentation/cleanForStorage/widget/page.dart';
import 'package:fastfood/presentation/creatingDishes/widget/page.dart';
import 'package:fastfood/presentation/orderHome/widget/page.dart';
import 'package:fastfood/presentation/password/widget/passwordPage.dart';
import 'package:fastfood/presentation/payment/widget/page.dart';
import 'package:fastfood/presentation/purchases/widget/page.dart';
import 'package:fastfood/presentation/report/widget/page.dart';
import 'package:fastfood/presentation/settings/widget/settings.dart';
import 'package:fastfood/presentation/staff/widget/page.dart';
import 'package:fastfood/presentation/tables/widget/historyTable.dart';
import 'package:fastfood/presentation/tables/widget/page.dart';
import 'package:fastfood/presentation/tables/widget/purchasesTable.dart';
import 'package:fastfood/presentation/recalculation/widget/page.dart';
import 'package:fastfood/presentation/tables/widget/salesTable.dart';
import 'package:fastfood/presentation/tables/widget/staffTable.dart';
import 'package:fastfood/presentation/tables/widget/storageTable.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
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
          path: 'StoragePage',
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: StoragePage(),
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
            GoRoute(
              path: 'Recalculation',
              pageBuilder: (context, state) {
                return buildPageWithDefaultTransition<void>(
                  context: context,
                  state: state,
                  child: Recalculation(),
                );
              },
            ),
          ],
        ),
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
            child: CleanForStorage(),
          ),
        ),
        GoRoute(
          path: 'Payment',
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: PaymentPage(),
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
        GoRoute(
          path: 'Report',
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: Report(),
          ),
        ),
      ],
    ),
  ],
);
