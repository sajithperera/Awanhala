import 'package:awanahala/bloc/CartBloc.dart';
import 'package:awanahala/models/CartModel.dart';
import 'package:awanahala/shared/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatefulWidget {
  CartPage({Key key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double blockHeight = SizeConfig.safeBlockVertical;
    double blockWidth = SizeConfig.safeBlockHorizontal;
    double margin = blockWidth * 5;

    // CartModel cartModel = BlocProvider.of<CartBloc>(context);

    return BlocBuilder<CartBloc, CartModel>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: blockWidth * 5,
                  ),
                  height: blockHeight * 10,
                  // color: Colors.redAccent,
                  alignment: Alignment.center,
                  child: Container(
                      height: blockHeight * 5,
                      // color: Colors.yellow,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text(
                            "Cart",
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          SizedBox(
                            width: blockWidth * 5,
                          ),
                          Icon(
                            Icons.shopping_cart,
                          )
                        ],
                      )),
                ),
                Container(
                  height: blockHeight * 5,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                    10,
                  )),
                  margin: EdgeInsets.symmetric(
                    horizontal: margin,
                  ),
                  elevation: 20,
                  child: Container(
                    height: blockHeight * 5,
                    // color: Colors.yellow,
                    padding: EdgeInsets.only(
                      left: blockWidth * 3,
                    ),

                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Items inside cart",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: blockHeight * 2,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: margin,
                    ),
                    color: Colors.grey,
                    padding: EdgeInsets.all(
                      blockHeight,
                    ),
                    alignment: Alignment.topCenter,
                    child: ListView.builder(
                      itemCount: state.items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          margin: EdgeInsets.only(
                            bottom: blockHeight * 2,
                          ),
                          child: Container(
                            height: blockHeight * 6,
                            // color: Colors.yellowAccent,

                            alignment: Alignment.center,
                            child: Container(
                              height: blockHeight * 4,
                              // color: Colors.greenAccent,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                horizontal: blockWidth * 2,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      // color: Colors.redAccent,
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        state.items[index].itemName,
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: blockWidth * 20,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "${state.items[index].qty} * ${state.items[index].price}",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: margin,
                  ),
                  height: blockHeight * 25,
                  // color: Colors.yellow,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: blockHeight * 6,
                        // color: Colors.redAccent,
                        padding: EdgeInsets.symmetric(
                          horizontal: blockWidth * 3,
                        ),
                        alignment: Alignment.center,
                        child: Container(
                          height: blockHeight * 4,
                          // color: Colors.yellow,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total Item Count",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                state.quantity.toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: blockHeight * 6,
                        // color: Colors.redAccent,
                        padding: EdgeInsets.symmetric(
                          horizontal: blockWidth * 3,
                        ),
                        alignment: Alignment.center,
                        child: Container(
                          height: blockHeight * 4,
                          // color: Colors.yellow,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "RS. ${state.price}",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: blockHeight * 2,
                      ),
                      RaisedButton(
                        color: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                          20,
                        )),
                        padding: EdgeInsets.all(
                          0,
                        ),
                        onPressed: () {},
                        child: Container(
                          height: blockHeight * 6,
                          // color: Colors.greenAccent,
                          alignment: Alignment.center,
                          child: Container(
                            height: blockHeight * 3.5,
                            // color: Colors.yellow,
                            alignment: Alignment.center,
                            child: Text(
                              "Checkout".toUpperCase(),
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
