import 'dart:convert';

import 'package:awanahala/bloc/CartBloc.dart';
import 'package:awanahala/events/CartEvent.dart';
import 'package:awanahala/models/CartModel.dart';
import 'package:awanahala/services/order_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OrderServiceImpl extends Orderservice {
  @override
  Future<void> createOrder(CartModel cartModel, BuildContext context) async {
    try {
      List items = [];

      cartModel.items.forEach((element) {
        items.add(element.toJson());
      });

      final body = jsonEncode({
        "cusID": cartModel.cusID,
        "price": cartModel.price,
        "quantity": cartModel.quantity,
        "items": items
      });

      var url = 'http://3.223.72.19/api/order/create';
      var response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body,
      );
      var jsonResponse = json.decode(response.body);
      print(jsonResponse);
      if (response.statusCode == 200) {
        BlocProvider.of<CartBloc>(context).add(CartEvent.clearCart());
        Get.back();
        Future.delayed(Duration(seconds: 1)).then((value) {
          Get.snackbar("Order Placed", "Order Places successfully",
              icon: Icon(
                Icons.done,
                color: Colors.green,
              ));
        });
      } else {
        BlocProvider.of<CartBloc>(context).add(CartEvent.clearCart());
        Get.back();
        Future.delayed(Duration(seconds: 1)).then((value) {
          Get.snackbar("Error occured",
              "Error occured while placing the order please try again",
              icon: Icon(
                Icons.error,
                color: Colors.red,
              ));
        });
      }
    } catch (e) {
      BlocProvider.of<CartBloc>(context).add(CartEvent.clearCart());
      Get.back();
      Future.delayed(Duration(seconds: 1)).then((value) {
        Get.snackbar("Error occured",
            "Error occured while placing the order please try again",
            icon: Icon(
              Icons.error,
              color: Colors.red,
            ));
      });
    }
  }
}
