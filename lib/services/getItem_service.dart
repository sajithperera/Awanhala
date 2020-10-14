import 'dart:convert';

import 'package:awanahala/models/Items.dart';
import 'package:http/http.dart' as http;

class HttpService {
  final String itemurl = 'http://3.223.72.19/api/item/';
  Future<List<Item>> getItems() async {
    List<Item> allItems = [];

    var response = await http.get(
      itemurl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 400) {
      return allItems;
    }

    var jsonResponse = json.decode(response.body);

    // print(jsonResponse);
    List<dynamic> itemsList = jsonResponse['items'];
    // print(itemsList);
    itemsList.forEach((element) {
      print(element);
      Item item = Item.fromJson(element);

      allItems.add(item);
    });

    return allItems;
  }

  Future<List<Item>> getAllItemsOfaGivencategory(int catId) async {
    List<Item> allItems = [];

    var response = await http.get(
      itemurl + "/cat/" + catId.toString(),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 400) {
      return allItems;
    }

    var jsonResponse = json.decode(response.body);

    // print(jsonResponse);
    List<dynamic> itemsList = jsonResponse['items'];
    // print(itemsList);
    itemsList.forEach((element) {
      print(element);
      Item item = Item.fromJson(element);

      allItems.add(item);
    });

    print(allItems);

    return allItems;
  }
}
