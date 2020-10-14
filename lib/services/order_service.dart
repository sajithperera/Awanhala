import 'package:awanahala/models/CartModel.dart';
import 'package:flutter/widgets.dart';

abstract class Orderservice {
  Future<void> createOrder(CartModel cartModel, BuildContext context);
}
