import 'package:papalgateway/secret.dart';

import 'models.dart';
import 'payment_api.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

class PaypalService {
  Future<void> paypalPayment() async {
    PaypalSecret secret = PaypalSecret(
      clientId: Secret.clientIdSandbox,
      clientSecret: Secret.clientSecretSandbox,
      paymentMode: PaymentMode.sandbox,
    );

    PaypalPayment paymentService = PaypalPayment(paypalSecret: secret);

    Token token = await paymentService.getAccessToken(secret);

    if (token.token == null) {
      return;
    }
    Payment payment = await paymentService.createPayment(
      transactionSubscription(),
      token.token!,
    );
    if (payment.approvalUrl == null) {
      return;
    }
    html.window.open(payment.approvalUrl!, "Payment");
  }
}
