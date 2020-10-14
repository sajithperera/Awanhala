// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CartItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItem _$CartItemFromJson(Map<String, dynamic> json) {
  return CartItem(
      id: json['id'] as String,
      price: (json['price'] as num)?.toDouble(),
      qty: json['qty'] as int,
      itemName: json['itemName'] as String);
}

Map<String, dynamic> _$CartItemToJson(CartItem instance) => <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'qty': instance.qty,
      'itemName': instance.itemName
    };
