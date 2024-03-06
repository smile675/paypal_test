// import 'package:flutter/material.dart';
// import 'package:papalgateway/paypal.dart';
// import 'package:paypal_sdk/core.dart';
// import 'package:paypal_sdk/orders.dart';
// import 'package:paypal_sdk/payments.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'PayPal Integration',
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('PayPal Integration'),
//         ),
//         body: Center(
//           child: ElevatedButton(
//             onPressed: () async {
//               String _clientId =
//                   "AZAyXUDm9EDvHilN7eF0iEeoLF-9MXCnx6SY8gE0wMOlBiN_h1i1jWEaa7cQ0-HWqABS8zRFJ2IhAOP1";
//               String _clientSecret =
//                   "EBQiquyQuvqlcskV6waNfEU96L59Dv_6lI2X_B1LJC-H4PBxXIj2Le_ckvAiFCFvTDZtxH9dl5m4-n6o";
//               var paypalEnvironment = PayPalEnvironment.sandbox(
//                   clientId: _clientId, clientSecret: _clientSecret);
//               PayPalHttpClient payPalHttpClient =
//                   PayPalHttpClient(paypalEnvironment);
//               PaymentsApi paymentsApi = PaymentsApi(payPalHttpClient);
//               OrdersApi ordersApi = OrdersApi(payPalHttpClient);

//               // paymentsApi.captureAuthorizedPayment(
//               //   authorizationId: ,
//               //   request,
//               // );
//               // paymentsApi.voidAuthorizedPayment(authorizationId),

//               // ordersApi.authorizePaymentForOrder(id)
//               var orderRequest = OrderRequest(
//                 intent: OrderRequestIntent.capture,
//                 purchaseUnits: [
//                   PurchaseUnitRequest(
//                     amount: AmountWithBreakdown(
//                       currencyCode: 'USD',
//                       value: '100.00',
//                     ),
//                   ),
//                 ],
//               );

//               try {
//                 // Call the createOrder method to create an order
//                 var order = await ordersApi.createOrder(orderRequest);
//                 Order data =
//                     await ordersApi.authorizePaymentForOrder(order.id!);
//                 print(data);

//                 // Print the ID of the created order
//                 print('Order ID: ${order.id}');
//               } catch (e) {
//                 // Handle any errors that occur during the process
//                 print('Error creating order: $e');
//               }

//               // when this button clicked i want to create the order req or whatever, so that user able to pay

//               // ordersApi.createOrder(request)
//               // OrderRequest orderRequest = const OrderRequest(
//               //   intent: OrderRequestIntent.capture,
//               //   payer: Payer(emailAddress: "angred.ismail@gmail.com"),
//               //   purchaseUnits: [
//               //     PurchaseUnitRequest(
//               //         amount: AmountWithBreakdown(
//               //             currencyCode: "MYR", value: '10.00')),
//               //   ],
//               //   applicationContext: ApplicationContext(
//               //     brandName: "Your Brand",
//               //     locale: "en-US",
//               //     landingPage: LandingPage.noPreference,
//               //     shippingPreference: ShippingPreference.noShipping,
//               //     userAction: UserAction.continue_,
//               //     returnUrl: "https://yourwebsite.com/return",
//               //     cancelUrl: "https://yourwebsite.com/cancel",
//               //   ),
//               // );

//               // print(orderRequest);
//             },
//             child: const Text("Pay"),
//           ),
//         ),
//       ),
//     );
//   }
// }







// // import 'package:paypal_sdk/catalog_products.dart';
// // import 'package:paypal_sdk/core.dart';
// // import 'package:paypal_sdk/src/webhooks/webhooks_api.dart';
// // import 'package:paypal_sdk/subscriptions.dart';
// // import 'package:paypal_sdk/webhooks.dart';

// // const _clientId =
// //     'AULNDDYjz27qvIt2iEpYmGvDLG_Gq9kVgCNZcq36UnfZnqHOBaNjqpuirtq3WfXBWLAteXHtBJOku7ff';
// // const _clientSecret =
// //     'EKagkSdkbInPdPB8WKrXvWHnu_rkqojhR7bjLVyw_Fn0z1O0WktdgxRvykFRiqbcE5k-HigUU1KpqiZT';

// // void main() async {
// //   AccessToken? accessToken; // load existing token here if available

// //   var paypalEnvironment = PayPalEnvironment.sandbox(
// //       clientId: _clientId, clientSecret: _clientSecret);

// //   var payPalHttpClient =
// //       PayPalHttpClient(paypalEnvironment, accessToken: accessToken,
// //           accessTokenUpdatedCallback: (accessToken) async {
// //     // Persist token for re-use
// //   });

// //   await catalogProductsExamples(payPalHttpClient);
// //   // await subscriptionExamples(payPalHttpClient);
// //   // await webhookExamples(payPalHttpClient);
// // }

// // Future<void> catalogProductsExamples(PayPalHttpClient payPalHttpClient) async {
// //   var productsApi = CatalogProductsApi(payPalHttpClient);

  

// //   // Get product details
// //   try {
// //     var product = await productsApi.showProductDetails('01');
// //     print(product);
// //   } on ApiException catch (e) {
// //     print(e);
// //   }

// //   // List products
// //   try {
// //     var productsCollection = await productsApi.listProducts();

// //     for (var product in productsCollection.products) {
// //       print(product);
// //     }
// //   } on ApiException catch (e) {
// //     print(e);
// //   }
  

// //   // Create product
// //   try {
// //     var createProductRequest = ProductRequest(
// //         name: 'Qr Profile Loyal Member',
// //         type: ProductType.digital,
// //         description: 'test_description');

// //     var product = await productsApi.createProduct(createProductRequest);

// //     print(product);
// //   } on ApiException catch (e) {
// //     print(e);
// //   }

// //   // // Update product
// //   try {
// //     await productsApi.updateProduct('product_id', [
// //       Patch(
// //           op: PatchOperation.replace,
// //           path: '/description',
// //           value: 'Updated description')
// //     ]);
// //   } on ApiException catch (e) {
// //     print(e);
// //   }
// // }

// // Future<void> subscriptionExamples(PayPalHttpClient payPalHttpClient) async {
// //   var subscriptionsApi = SubscriptionsApi(payPalHttpClient);

// //   // Plans
// //   // List plans
// //   try {
// //     var planCollection = await subscriptionsApi.listPlans();
// //     print(planCollection);
// //   } on ApiException catch (e) {
// //     print(e);
// //   }

// //   // Create plan
// //   try {
// //     var planRequest = PlanRequest(
// //         productId: 'PROD-3XF87627UU805523Y',
// //         name: 'Test plan',
// //         billingCycles: [
// //           BillingCycle(
// //               pricingScheme: PricingScheme(
// //                 fixedPrice: Money(currencyCode: 'GBP', value: '5'),
// //               ),
// //               frequency: Frequency(
// //                 intervalUnit: IntervalUnit.month,
// //                 intervalCount: 1,
// //               ),
// //               tenureType: TenureType.regular,
// //               sequence: 1)
// //         ],
// //         paymentPreferences: PaymentPreferences(
// //             autoBillOutstanding: true,
// //             setupFee: Money(currencyCode: 'GBP', value: '1.00'),
// //             setupFeeFailureAction: SetupFeeFailureAction.cancel,
// //             paymentFailureThreshold: 2));
// //     var billingPlan = await subscriptionsApi.createPlan(planRequest);
// //     print(billingPlan);
// //   } on ApiException catch (e) {
// //     print(e);
// //   }

// //   // Update plan
// //   try {
// //     await subscriptionsApi.updatePlan('P-6KG67732XY2608640MFGL3RY', [
// //       Patch(
// //           op: PatchOperation.replace,
// //           path: '/description',
// //           value: 'Test description')
// //     ]);
// //   } on ApiException catch (e) {
// //     print(e);
// //   }

// //   // Show plan details
// //   try {
// //     var billingPlan =
// //         await subscriptionsApi.showPlanDetails('P-6KG67732XY2608640MFGL3RY');
// //     print(billingPlan);
// //   } on ApiException catch (e) {
// //     print(e);
// //   }

// //   // Activate plan
// //   try {
// //     await subscriptionsApi.activatePlan('P-6KG67732XY2608640MFGL3RY');
// //   } on ApiException catch (e) {
// //     print(e);
// //   }

// //   // Deactivate plan
// //   try {
// //     await subscriptionsApi.deactivatePlan('P-6KG67732XY2608640MFGL3RY');
// //   } on ApiException catch (e) {
// //     print(e);
// //   }

// //   // Update plan pricing
// //   try {
// //     await subscriptionsApi.updatePlanPricing(
// //         'P-6KG67732XY2608640MFGL3RY',
// //         PricingSchemesUpdateRequest([
// //           PricingSchemeUpdateRequest(
// //               billingCycleSequence: 1,
// //               pricingScheme: PricingScheme(
// //                 fixedPrice: Money(currencyCode: 'GBP', value: '5.0'),
// //               ))
// //         ]));
// //   } on ApiException catch (e) {
// //     print(e);
// //   }

// //   // Subscriptions
// //   // Create subscription
// //   try {
// //     var createSubscriptionRequest = SubscriptionRequest(
// //         planId: 'P-6KG67732XY2608640MFGL3RY', customId: 'custom_id');
// //     var subscription =
// //         await subscriptionsApi.createSubscription(createSubscriptionRequest);
// //     print(subscription);
// //   } on ApiException catch (e) {
// //     print(e);
// //   }

// //   // Update subscription
// //   try {
// //     await subscriptionsApi.updateSubscription('I-1WSNAWATBCXP', [
// //       Patch(
// //           op: PatchOperation.add,
// //           path: '/custom_id',
// //           value: 'updated_custom_id')
// //     ]);
// //   } on ApiException catch (e) {
// //     print(e);
// //   }

// //   // Show subscription details
// //   try {
// //     var subscription =
// //         await subscriptionsApi.showSubscriptionDetails('I-1WSNAWATBCXP');
// //     print(subscription);
// //   } on ApiException catch (e) {
// //     print(e);
// //   }

// //   // Activate subscription
// //   try {} on ApiException catch (e) {
// //     print(e);
// //   }

// //   // Cancel subscription
// //   try {
// //     await subscriptionsApi.cancelSubscription(
// //         'I-93KN27174NGR', 'No longer needed');
// //   } on ApiException catch (e) {
// //     print(e);
// //   }

// //   // Capture authorized payment on subscription
// //   try {
// //     var request = SubscriptionCaptureRequest(
// //         note: 'Outstanding balance',
// //         amount: Money(currencyCode: 'GBP', value: '5.00'));

// //     var response = await subscriptionsApi
// //         .captureAuthorizedPaymentOnSubscription('I-1WSNAWATBCXP', request);
// //     print(response);
// //   } on ApiException catch (e) {
// //     print(e);
// //   }

// //   // Revise plan or quantity of subscription
// //   try {
// //     var request = SubscriptionReviseRequest(
// //         planId: 'P-9DR273747C8107746MFGHYKY',
// //         shippingAmount: Money(currencyCode: 'USD', value: '2.0'));

// //     var response =
// //         await subscriptionsApi.reviseSubscription('I-1WSNAWATBCXP', request);
// //     print(response);
// //   } on ApiException catch (e) {
// //     print(e);
// //   }

// //   // Suspend subscription
// //   try {
// //     var request = Reason('Out of stock');
// //     await subscriptionsApi.suspendSubscription('I-1WSNAWATBCXP', request);
// //   } on ApiException catch (e) {
// //     print(e);
// //   }

// //   // List transactions for subscription
// //   try {
// //     var response = await subscriptionsApi.listTransactions('I-1WSNAWATBCXP',
// //         '2021-09-01T07:50:20.940Z', '2021-09-29T07:50:20.940Z');
// //     print(response);
// //   } on ApiException catch (e) {
// //     print(e);
// //   }
// // }

// // Future<void> webhookExamples(PayPalHttpClient payPalHttpClient) async {
// //   var webhooksApi = WebhooksApi(payPalHttpClient);

// //   // List webhooks
// //   try {
// //     var webhooksList = await webhooksApi.listWebhooks();
// //     print(webhooksList);
// //   } on ApiException catch (e) {
// //     print(e);
// //   }

// //   // Create webhook
// //   try {
// //     var webhook =
// //         Webhook(url: 'https://api.test.com/paypal_callback', eventTypes: [
// //       EventType(name: 'BILLING.SUBSCRIPTION.CREATED'),
// //       EventType(name: 'BILLING.SUBSCRIPTION.CANCELLED'),
// //     ]);

// //     webhook = await webhooksApi.createWebhook(webhook);
// //     print(webhook);
// //   } on ApiException catch (e) {
// //     print(e);
// //   }

// //   // Delete webhook
// //   try {
// //     await webhooksApi.deleteWebhook('1HG80537L4140544T');
// //   } on ApiException catch (e) {
// //     print(e);
// //   }

// //   // Update webhook
// //   try {
// //     await webhooksApi.updateWebhook('5B760822JX046254S', [
// //       Patch(
// //           op: PatchOperation.replace,
// //           path: '/url',
// //           value: 'https://api.test.com/paypal_callback_new'),
// //     ]);
// //   } on ApiException catch (e) {
// //     print(e);
// //   }

// //   // Show webhook details
// //   try {
// //     var webhook = await webhooksApi.showWebhookDetails('7BS56736HU608525B');
// //     print(webhook);
// //   } on ApiException catch (e) {
// //     print(e);
// //   }

// //   // List event types for webhook
// //   try {
// //     var eventTypesList =
// //         await webhooksApi.listEventSubscriptionsForWebhook('7BS56736HU608525B');
// //     print(eventTypesList);
// //   } on ApiException catch (e) {
// //     print(e);
// //   }

// //   // List available events
// //   try {
// //     var eventTypesList = await webhooksApi.listAvailableEvents();
// //     print(eventTypesList);
// //   } on ApiException catch (e) {
// //     print(e);
// //   }
// // }
