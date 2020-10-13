import 'package:awanahala/models/Items.dart';
import 'package:awanahala/service_locator/service_locator.dart';
import 'package:awanahala/services/getItem_service.dart';
import 'package:flutter/material.dart';

import 'addToCart.dart';

class FoodItemCategory extends StatefulWidget {
  final String category;
  final int catID;
  FoodItemCategory(
    this.category,
    this.catID,
  );
  @override
  _FoodItemCategoryState createState() => _FoodItemCategoryState();
}

//sashika
class _FoodItemCategoryState extends State<FoodItemCategory> {
  String itemName;
  List<String> items = List();
  List<double> unitPrice = List();
  final HttpService httpService = locator<HttpService>();

  @override
  void initState() {
    for (int i = 0; i < 7; i++) {
      items.add("Item__" + (i + 1).toString());
      unitPrice.add(i * 15.5);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: FutureBuilder(
        future: httpService.getAllItemsOfaGivencategory(widget.catID),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            print(snapshot.data);
            if (snapshot.data.length == 0) {
              return Center(
                child: Text(
                  "Sorry there are no items from this category",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              );
            } else {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (context, position) {
                  return buildListItem(
                      "images/art.jpg", snapshot.data[position]);
                },
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  buildListItem(String imageURL, Item itembody) {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      width: double.infinity,
      child: InkWell(
        child: Container(
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
          decoration: BoxDecoration(
            color: Colors.green[100].withOpacity(0.6),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 25.0),
                child: CircleAvatar(
                  radius: 35.0,
                  backgroundImage: AssetImage(imageURL),
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      itembody.name,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Rs. ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          TextSpan(
                            text: itembody.price.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 25.0),
                child: Icon(
                  Icons.av_timer,
                  size: 40.0,
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => AddToCart(itembody),
            ),
          );
        },
      ),
    );
  }
}
