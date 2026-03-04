import 'package:flutter_test/flutter_test.dart';

import 'package:xpayment/xpayment.dart';

void main() {
  test('pay uri is correct', () async {
    final app = PaymentApp.pai;
    final orderId = '123456';
    final symbol = 'USD';
    final amount = '100';
    final to = 'ABC Company';
    final appReturnUrl = 'https://example.com';

    final uri = Uri(
      scheme: app.scheme,
      path: 'requestPay',
      queryParameters: {
        'orderId': orderId,
        'symbol': symbol,
        'amount': amount,
        'to': to,
        'appReturnUrl': appReturnUrl,
      },
    );
    expect(
      uri.toString(),
      'paipay:requestPay?orderId=123456&symbol=USD&amount=100&to=ABC+Company&appReturnUrl=https%3A%2F%2Fexample.com',
    );
  });
}
