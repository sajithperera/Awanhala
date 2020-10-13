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
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Card(
          color: Colors.green[100].withOpacity(0.6),
          child: InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(3),
              alignment: Alignment.centerLeft,
              height: blockHeight * 5,
              child: Row(
                children: [
                  SizedBox(
                    width: blockWidth * 3,
                  ),
                  Text(
                    'Order 01',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: blockWidth * 5,
                  ),
                  Text(
                    'Total Price R.s 250/',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    width: blockWidth * 5,
                  ),
                  Text(
                    '2020-10-13',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
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
