import 'package:awanahala/shared/sizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PastOrders extends StatefulWidget {
  @override
  _PastOrdersState createState() => _PastOrdersState();
}

class _PastOrdersState extends State<PastOrders> {
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
    return ListView(
        children: <Widget>[
    _listView(),
    _listView(),
    _listView(),
    _listView(),
    _listView(),
    _listView(),
    _listView(),
    _listView(),
        ],
      );
  }

  Widget _listView() {
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
                    margin: EdgeInsets.symmetric(horizontal:10.0),
                    height: 40.0,
                    width: 0.5,
                    color: Colors.green[900],
                  ),
                  Text(
                    'Total R.s 250',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal:10.0),
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
