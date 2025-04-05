import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  Map<String, dynamic>? paymentIntent;

  Future<void> makePayment() async {
    try {
      // 1️⃣ Create Payment Intent (Backend API Call)
      paymentIntent = await createPaymentIntent('50', 'USD'); // $50
      if (paymentIntent == null) return;

      // 2️⃣ Initialize Payment Sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent!['client_secret'],
          merchantDisplayName: 'TechLink Services',
        ),
      );

      // 3️⃣ Show Payment Sheet
      await Stripe.instance.presentPaymentSheet();

      // 4️⃣ Payment Success
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Payment Successful!")));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Payment Failed: $e")));
    }
  }

  // Backend Request (Create Payment Intent)
  Future<Map<String, dynamic>?> createPaymentIntent(String amount, String currency) async {
    try {
      final response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer sk_test_XXXXXXXX', // Secret Key
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'amount': (int.parse(amount) * 100).toString(), // Convert to cents
          'currency': currency,
          'payment_method_types[]': 'card',
        },
      );

      return jsonDecode(response.body);
    } catch (err) {
      print("Error creating payment intent: $err");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pay for Service')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => makePayment(),
          child: Text('Pay Now'),
        ),
      ),
    );
  }
}
