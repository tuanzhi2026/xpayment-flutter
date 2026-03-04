<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

# XPayment SDK for Flutter


## 功能

- 调起 APP（Pai 或 Lanton ）进行支付

## 前提条件

- 将要调起的 APP（Pai 或 Lanton） 已经安装在设备上

## 安装

```shell
flutter pub add xpayment
```
或者 直接在 pubspec.yaml 引入

```yaml
dependencies:
  xpayment: ^0.0.6
```

## 使用

1. 引入 XPayment 库

```dart
import 'package:xpayment/xpayment.dart' as xpay;
```

2. 调起其他APP进行支付

```dart
// 调起其他APP进行支付
await xpay.pay(
      app: xpay.PaymentApp.pai, // 支付 APP 类型，Pai 或 Lanton
      orderId: '123456', // 支付 APP后端生成的预支付订单ID，经商户后端传给商户 APP
      symbol: 'USDT', // 支付币种
      amount: '3.65', // 支付金额
      to: '商户 ABC', // 收款方名称
      appReturnUrl: 'https://example.com/app-return', // 支付完成后，点击返回商户按钮后跳转的 URL，可使用该 URL 跳转到商户 APP 内的支付结果页面
    );
```
## 调起APP后的预览

![支付](https://statics.paiops.com/tmp/d1.jpg)
![支付成功](https://statics.paiops.com/tmp/d2.jpg)
