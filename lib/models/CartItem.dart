import 'package:json_annotation/json_annotation.dart';
part 'CartItem.g.dart';

@JsonSerializable()
class CartItem {
  String id; //id of the item
  double price; //price of the single item
  int qty; //quantity of items
  String itemName;

  CartItem({
    this.id,
    this.price,
    this.qty,
    this.itemName,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemToJson(this);
}
