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
    SizeConfig().init(context);
    double blockHeight = SizeConfig.safeBlockVertical;
    double blockWidth = SizeConfig.safeBlockHorizontal;
    
    return ListView(
      children: <Widget>[
        Material(
                  child: ListTile(
                  title: Card(
                    color: Colors.green[100].withOpacity(0.6),
                    child: InkWell(
                      onTap: () {
                        
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(5),
                        alignment: Alignment.centerLeft,
                        height: blockHeight * 4,
                        child: Row(
                          children: [
                            Text(
                              'Order Id 01',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: blockWidth*3,
                            ),
                            Text(
                              'Order Price R.s 250/==',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              width: blockWidth*3,
                            ),
                            Text(
                              'Order Date 2020-10-13',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              width: blockWidth*3,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
        ),
      ],
      
    );
  }
}