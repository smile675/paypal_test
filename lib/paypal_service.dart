import 'models.dart';
import 'payment_api.dart';
import 'dart:html' as html;

class PaypalService {
  Future<void> paypalPayment() async {
    PaypalSecret secret = PaypalSecret(
      clientId:
          'AULNDDYjz27qvIt2iEpYmGvDLG_Gq9kVgCNZcq36UnfZnqHOBaNjqpuirtq3WfXBWLAteXHtBJOku7ff',
      clientSecret:
          'EKagkSdkbInPdPB8WKrXvWHnu_rkqojhR7bjLVyw_Fn0z1O0WktdgxRvykFRiqbcE5k-HigUU1KpqiZT',
      paymentMode: PaymentMode.sandbox,
    );

    PaypalPayment paymentService = PaypalPayment(paypalSecret: secret);

    Token token = await paymentService.getAccessToken(secret);

    if (token.token == null) {
      return;
    }
    Payment payment = await paymentService.createPayment(
      transaction(),
      token.token!,
    );
    if (payment.approvalUrl == null) {
      return;
    }
    html.window.open(payment.approvalUrl!, "Payment");
  }
}
