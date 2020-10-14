// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CartModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map<String, dynamic> json) {
  return CartModel(
      cusID: json['cusID'] as String,
      price: (json['price'] as num)?.toDouble(),
      quantity: json['quantity'] as int,
      items: (json['items'] as List)
          ?.map((e) =>
              e == null ? null : CartItem.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      'cusID': instance.cusID,
      'price': instance.price,
      'quantity': instance.quantity,
      'items': instance.items
    };
