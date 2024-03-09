import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:papalgateway/main.dart';
import 'package:papalgateway/return_screens.dart';

class MyRouter {
  late final GoRouter router;

  MyRouter() {
    _configureRoutes();
  }

  void _configureRoutes() {
    router = GoRouter(
      errorPageBuilder: (context, state) {
        return const MaterialPage(
          child: Center(
            child: Text("No ROute"),
          ),
        );
      },
      routes: <RouteBase>[
        GoRoute(
          name: MyRouteConst.home,
          path: '/',
          pageBuilder: (context, state) {
            return const MaterialPage(
                child: MyHomePage(
              title: "Home",
            ));
          },
          routes: [
            GoRoute(
              path: 'payment_success',
              name: MyRouteConst.paymentSuccess,
              builder: (context, state) {
                return const PaymentSuccess(
                  email: "",
                  password: "",
                );
              },
            ),
            GoRoute(
              path: 'payment_failed',
              name: MyRouteConst.paymentFailed,
              builder: (context, state) {
                return const PaymentFailed();
              },
            ),
          ],
        ),
      ],
    );
  }
}

class MyRouteConst {
  static const home = "home";
  static const paymentSuccess = "payment_success";
  static const paymentFailed = "payment_failed";
}
