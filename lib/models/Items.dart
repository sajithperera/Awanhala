import 'package:flutter/foundation.dart';

class Item {
  final String name;
  final String id;
  final int price;
  final int category;
  final String image;
  final int time;
  final bool veg;
  final String desc;

  Item({
    @required this.name,
    @required this.id,
    @required this.price,
    @required this.category,
    @required this.image,
    @required this.time,
    @required this.veg,
    @required this.desc,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      name: json['name'] as String,
      id: json['id'] as String,
      price: json['price'] as int,
      category: json['category'] as int,
      image: json['image'] as String,
      time: json['time'] as int,
      veg: json['vegetarian'] as bool,
      desc: json['desc'] as String,
    );
  }
}
