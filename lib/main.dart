// import 'package:example/paypal_webview.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:papalgateway/paypal_service.dart';
import 'package:url_strategy/url_strategy.dart';

import 'router.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Paypal SDK',
      routerConfig: MyRouter().router,

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: 'Paypal SDK'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({
    super.key,
    required this.title,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PaypalService _service = PaypalService();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  subscribe() {
    _service.paypalPayment();
  }

  registerUser() {
    print(email.text);
    print(password.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: email,
            decoration: const InputDecoration(
              hintText: "Email",
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: password,
            decoration: const InputDecoration(
              hintText: "Password",
            ),
          ),
          TextButton(
            onPressed: () {
              subscribe();
            },
            child: const Text("Subscribe"),
          ),
        ],
      ),
    );
  }
}
