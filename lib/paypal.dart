// // ignore: avoid_web_libraries_in_flutter
// import 'dart:js' as js;

// class PayPalService {
//   Future<String> createOrder(String amount) async {
//     dynamic result = await js.context.callMethod('paypal', [
//       'Checkout',
//       'createOrder',
//       js.JsObject.jsify({
//         'purchase_units': [
//           {
//             'amount': {'value': amount, 'currency_code': 'USD'}
//           }
//         ]
//       })
//     ]);
//     return result.toString();
//   }

//   Future<void> onApprove(String orderId) async {
//     await js.context.callMethod('paypal', [
//       'Checkout',
//       'capture',
//       orderId,
//       js.allowInterop((details) {
//         // Handle payment capture
//         print('Payment details: $details');
//       })
//     ]);
//   }
// }
