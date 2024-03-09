import 'package:flutter/material.dart';

class PaymentSuccess extends StatelessWidget {
  final String email;
  final String password;
  const PaymentSuccess(
      {super.key, required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(" Paymnet Success Success"),
    );
  }
}

class PaymentFailed extends StatelessWidget {
  const PaymentFailed({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(" Paymnet failed failed"),
    );
  }
}
