import 'package:awanahala/shared/sizeConfig.dart';
import 'package:flutter/material.dart';

class CanteenCredit extends StatefulWidget {
  @override
  _CanteenCreditState createState() => _CanteenCreditState();
}

class _CanteenCreditState extends State<CanteenCredit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Canteen Credits History"),
        // automaticallyImplyLeading: false,
        backgroundColor: Colors.red[400],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Card(
            elevation: 20,
            margin: EdgeInsets.all(
              20,
            ),
            child: Container(
              // width: 400,
              height: 200,
              // color: Colors.orange,
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    height: 80,
                    // color: Colors.yellow,
                    alignment: Alignment.center,
                    child: Text(
                      "Remaining Credits",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Container(
                    height: 80,
                    // color: Colors.yellow,
                    alignment: Alignment.center,
                    child: Text(
                      "RS . 1000.00",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _listView() {
    SizeConfig().init(context);
    double blockHeight = SizeConfig.safeBlockVertical;
    return Padding(
      padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
      child: Container(
        height: 90.0,
        child: Card(
          color: Colors.green[200],
          child: InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30.0),
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              alignment: Alignment.centerLeft,
              height: blockHeight * 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Rs. ',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            TextSpan(
                              text: "300.0",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "to",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'CC. ',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            TextSpan(
                              text: "300.0",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 50.0,
                    width: 0.5,
                    color: Colors.green[900],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'UCSC canteen',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        '2020-10-13',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.black87),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
