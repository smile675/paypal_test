// import 'package:example/paypal_webview.dart';
import 'dart:convert';
import 'dart:ui';
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:papalgateway/models.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paypal SDK',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Paypal SDK'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () async {
              PaypalSecret secret = PaypalSecret(
                clientId:
                    'AULNDDYjz27qvIt2iEpYmGvDLG_Gq9kVgCNZcq36UnfZnqHOBaNjqpuirtq3WfXBWLAteXHtBJOku7ff',
                clientSecret:
                    'EKagkSdkbInPdPB8WKrXvWHnu_rkqojhR7bjLVyw_Fn0z1O0WktdgxRvykFRiqbcE5k-HigUU1KpqiZT',
                paymentMode: PaymentMode.sandbox,
              );

              PaypalPayment paymnet = PaypalPayment(paypalSecret: secret);

              Token token = await paymnet.getAccessToken(secret);

              if (token.token == null) {
                return;
              }
              Payment payment = await paymnet.createPayment(
                transaction(),
                token.token!,
              );
              html.window.open(payment.approvalUrl!, "Paymnet");
            },
            child: const Text("Pay")),
      ),
    );
  }
}

class PaypalPayment {
  final PaypalSecret paypalSecret;

  PaypalPayment({required this.paypalSecret});
  _baseUrl(PaypalSecret paypalSecret) {
    String baseUrl = paypalSecret.paymentMode == PaymentMode.sandbox
        ? "https://api.sandbox.paypal.com"
        : 'https://api.paypal.com';
    return baseUrl;
  }

  Future<Token> getAccessToken(PaypalSecret paypalSecret) async {
    var client = AuthClient(paypalSecret.clientId, paypalSecret.clientSecret);
    var response = await client.post(
      Uri.parse(
          "${_baseUrl(paypalSecret)}/v1/oauth2/token?grant_type=client_credentials"),
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      // print(body);

      return Token(
        token: body['access_token'],
        message: 'access granted',
      );
    }
    return Token(token: null, message: 'access denied');
  }

  // Future<Payment> createPaymnet()
  Future<Payment> createPayment(
    Map<String, dynamic> transactions,
    String accessToken,
  ) async {
    try {
      var response = await http.post(
        Uri.parse('https://api-m.sandbox.paypal.com/v2/checkout/orders'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        body: jsonEncode(transactions),
      );

      // print(response.statusCode);
      // print(response.body);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data['links']);
        if (data["links"] != null && data["links"].length > 0) {
          List links = data["links"];

          String approvalUrl = "";
          final item = links.firstWhere(
            (o) => o["rel"] == "payer-action",
            orElse: () => null,
          );
          if (item != null) {
            approvalUrl = item["href"];
          }
          print(approvalUrl);

          return Payment(
            status: true,
            approvalUrl: approvalUrl,
          );
        }
      }
    } catch (e) {
      print('Error creating payment: $e');
    }

    return Payment(status: false);
  }
}

class AuthClient extends http.BaseClient {
  final String userName;
  final String password;
  final http.Client _inner;
  final String _authString;

  AuthClient(this.userName, this.password, {http.Client? inner})
      : _authString = _getAuthString(userName, password),
        _inner = inner ?? http.Client();
  static String _getAuthString(String username, String password) {
    final token = base64.encode(latin1.encode('$username:$password'));

    final authstr = 'Basic ${token.trim()}';

    return authstr;
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    request.headers['Authorization'] = _authString;

    return _inner.send(request);
  }

  @override
  void close() {
    _inner.close();
  }
}
