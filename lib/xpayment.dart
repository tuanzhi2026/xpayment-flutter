import 'package:url_launcher/url_launcher.dart';

/// 支付 APP 
enum PaymentApp {
  pai,
  lanton;

  /// 调起支付 APP 所需的 scheme
  String get scheme => switch (this) {
    pai => 'paipay',
    lanton => 'lanton',
  };
}
/// 调起其他APP进行支付
Future<bool> pay({
  /// 将要调用的支付APP
  required PaymentApp app,
  /// 支付APP后端生成的预支付订单ID，经商户后端传给商户APP
  required String orderId,
  /// 支付币种，例如：USDT
  required String symbol,
  /// 支付金额，单位：symbol
  required String amount,
  /// 商户名称
  required String to,
  /// 支付完成后，点击返回商户按钮后跳转的URL，可使用该URL跳转到商户APP内的支付结果页面
  String? appReturnUrl,
}) async {
  final uri = Uri(
    scheme: app.scheme,
    path: 'requestPay',
    queryParameters: {
      'orderId': orderId,
      'symbol': symbol,
      'amount': amount,
      'to': to,
      'appReturnUrl': ?appReturnUrl,
    },
  );
  return await launchUrl(uri);
}
