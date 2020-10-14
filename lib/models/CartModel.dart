import 'package:awanahala/models/CartItem.dart';
import 'package:json_annotation/json_annotation.dart';
// part 'CartItem.g.dart';

part 'CartModel.g.dart';

@JsonSerializable()
class CartModel {
  String cusID; //id of the customer
  double price; //price of the order
  int quantity;
  List<CartItem> items;

  CartModel({
    this.cusID,
    this.price,
    this.quantity,
    this.items,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}
