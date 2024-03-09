import 'dart:html' as html;

class Token {
  final String? token;
  final String? message;

  Token({required this.token, required this.message});
}

class PaypalSecret {
  final String clientId;
  final String clientSecret;
  final PaymentMode paymentMode;

  PaypalSecret({
    required this.clientId,
    required this.clientSecret,
    required this.paymentMode,
  });
}

enum PaymentMode { sandbox, live }

class Payment {
  // final String? executeUrl;
  final String? approvalUrl;
  final bool status;

  Payment({
    // this.executeUrl,
    this.approvalUrl,
    required this.status,
  });
}

transactionSubscription() {
  String baseUrl = html.window.location.origin;
  Map<String, dynamic> transactions = {
    "intent": "CAPTURE",
    "purchase_units": [
      {
        // "reference_id": "d9f80740-38f0-11e8-b467-0ed5f89f718b",
        "amount": {"currency_code": "MYR", "value": "10.00"}
      }
    ],
    "payment_source": {
      "paypal": {
        "experience_context": {
          "payment_method_preference": "IMMEDIATE_PAYMENT_REQUIRED",
          "brand_name": "EXAMPLE INC",
          "locale": "en-US",
          "landing_page": "LOGIN",
          // "shipping_preference": "SET_PROVIDED_ADDRESS",
          "user_action": "PAY_NOW",
          "return_url": "$baseUrl/payment_success",
          //"https://example.com/successUrl", //https://example.com/cancelUrl
          "cancel_url":
              "$baseUrl/payment_failed", //"https://example.com/cancelUrl"
        }
      }
    }
  };

  return transactions;
}
