import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:games/feature/games/presentation/widgets/custom_button.dart';

class PaypalPaymentButton extends StatelessWidget {
  final BuildContext context;

  const PaypalPaymentButton({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: "pay",
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => PaypalCheckoutView(
            sandboxMode: true,
            clientId:
                "AZHxgWwJRYfyerKQrKBqogWi71nct7s6NWlDAwYHscDzkhd87RxT-iE5LKJ4S6TNWoojzbn3f4qp1Zsh",
            secretKey:
                "ELgY0lScMG0XeTBo8msi5Oz_F0-Fv1PObEpO3NtKl4OHZSi6lvWA00oW9cN1ylU9QAh9buuYJ4RNLDVa",
            transactions: const [
              {
                "amount": {
                  "total": '70',
                  "currency": "USD",
                  "details": {
                    "subtotal": '70',
                    "shipping": '0',
                    "shipping_discount": 0
                  }
                },
                "description": "The payment transaction description.",
                "item_list": {
                  "items": [
                    {
                      "name": "Apple",
                      "quantity": 4,
                      "price": '5',
                      "currency": "USD"
                    },
                    {
                      "name": "Pineapple",
                      "quantity": 5,
                      "price": '10',
                      "currency": "USD"
                    }
                  ]
                }
              }
            ],
            note: "Contact us for any questions on your order.",
            onSuccess: (Map params) async {
              print("onSuccess: $params");
            },
            onError: (error) {
              print("onError: $error");
              Navigator.pop(context);
            },
            onCancel: () {
              print('cancelled:');
            },
          ),
        ));
      },
    );
  }
}
