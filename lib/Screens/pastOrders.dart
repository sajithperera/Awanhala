import 'dart:convert';

import 'package:awanahala/shared/sizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:http/http.dart' as http;

class PastOrders extends StatefulWidget {
  @override
  _PastOrdersState createState() => _PastOrdersState();
}

class _PastOrdersState extends State<PastOrders> {
  var jsonResponse;
  getPastOrders() async {
    String userId = Hive.box("user").get('id');
    var url = 'http://3.223.72.19/api/order/getallorders/' + userId;

    var response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    setState(() {
      jsonResponse = json.decode(response.body);
    });
    print(jsonResponse.length);
    if (response.statusCode == 200) {
      print("orders fetched successfully");
    } else {
      print("error occured");
    }
  }

  @override
  void initState() {
    super.initState();
    getPastOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Past Orders"),
        // automaticallyImplyLeading: false,
        backgroundColor: Colors.red[400],
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return ListView.builder(
      itemCount: (jsonResponse == null) ? 0 : jsonResponse.length,
      itemBuilder: (BuildContext context, int index) {
        return orderView(jsonResponse[index]);
      },
    );
  }

  Widget orderView(responseBody) {
    return Card(
      elevation: 20,
      child: Container(
        padding: EdgeInsets.all(
          10,
        ),
        margin: EdgeInsets.symmetric(
          vertical: 5,
        ),
        // height: 70,
        // color: Colors.redAccent,
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
                height: 30,
                // color: Colors.orange,
                alignment: Alignment.centerLeft,
                child: Text("Order ID : " + responseBody['_id'])),
            Container(
              height: 30,
              // color: Colors.green,
              alignment: Alignment.centerLeft,
              child: Text("Date : " + responseBody['date']),
            ),
            Container(
              height: 30,
              // color: Colors.green,
              alignment: Alignment.centerLeft,
              child: Text("Rs .  " + responseBody['price'].toString()),
            )
          ],
        ),
      ),
    );
  }

  Widget _listView(responseBody) {
    SizeConfig().init(context);
    double blockHeight = SizeConfig.safeBlockVertical;
    double blockWidth = SizeConfig.safeBlockHorizontal;
    return Padding(
      padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
      child: Container(
        height: 60.0,
        child: Card(
          color: Colors.green[200],
          child: InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(3),
              alignment: Alignment.centerLeft,
              height: blockHeight * 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: blockWidth * 3,
                  ),
                  Text(
                    'Order 01',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    height: 40.0,
                    width: 0.5,
                    color: Colors.green[900],
                  ),
                  Text(
                    'Total R.s ' + responseBody['price'].toString(),
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    height: 40.0,
                    width: 0.5,
                    color: Colors.green[900],
                  ),
                  Text(
                    '2020-10-13',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    width: blockWidth * 3,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
