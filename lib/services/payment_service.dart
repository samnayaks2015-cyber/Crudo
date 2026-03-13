import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentService {

  static void pay(double total){

    Razorpay razorpay = Razorpay();

    var options = {

      'key': 'RAZORPAY_KEY',
      'amount': total * 100,
      'name': 'CRUDO',
      'description': 'Milk Delivery',

    };

    razorpay.open(options);

  }

}
