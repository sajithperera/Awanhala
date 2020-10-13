import 'dart:ui';

import 'package:awanahala/Screens/login.dart';
import 'package:awanahala/Screens/pastOrders.dart';
import 'package:awanahala/Screens/profile.dart';
import 'package:awanahala/models/University.dart';
import 'package:awanahala/service_locator/service_locator.dart';
import 'package:awanahala/services/university_service.dart';
import 'package:awanahala/shared/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'foodItem.dart';

class CanteenSelect extends StatefulWidget {
  @override
  _CanteenSelectState createState() => _CanteenSelectState();
}

class _CanteenSelectState extends State<CanteenSelect> {
  final UniversityService universityService = locator<UniversityService>();

  List<University> universities = [
    University(id: "0001", university: "University of Colombo"),
    University(id: "0001", university: "University of Moratuwa")
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double blockHeight = SizeConfig.safeBlockVertical;
    double blockWidth = SizeConfig.safeBlockHorizontal;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Select the Canteen"),
          // automaticallyImplyLeading: false,
          backgroundColor: Colors.red[400],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                height: blockHeight * 35,
                child: DrawerHeader(
                  child: Container(
                    // width: blockWidth*20,
                    // height: blockHeight*40,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          scale: 1.5,
                          image: AssetImage("images/Cantima.png"),
                          fit: BoxFit.fitHeight),
                      //color: Colors.yellow,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Card(
                  color: Colors.green[100].withOpacity(0.6),
                  child: InkWell(
                    onTap: () {
                      print('Card tapped.');
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UserProfile()),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(5),
                      alignment: Alignment.centerLeft,
                      height: blockHeight * 5,
                      child: Text(
                        'Profile',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Card(
                  color: Colors.green[100].withOpacity(0.6),
                  child: InkWell(
                    onTap: () {
                      print('Card tapped.');
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PastOrders()),
                      );

                      //past order widget list
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(5),
                      alignment: Alignment.centerLeft,
                      height: blockHeight * 5,
                      child: Text(
                        'Past Orders',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ),
              
    Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: 300,
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Column(
              children: <Widget>[
                Container(
                  child: Image.network(
                    "http://s3.amazonaws.com/foodspotting-ec2/reviews/2310941/thumb_600.jpg?1346218231",
                    fit: BoxFit.cover,
                  ),
                  height: 200,
                  color: Colors.blue,
                  width: MediaQuery.of(context).size.width - 64,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    "Fish Rolls",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text("Price : 380"),
                    Text("Quantity : 4"),
                  ],
                ),
              ],
            )),
      ),
    ),
    


              ListTile(
                title: Card(
                  color: Colors.green[100].withOpacity(0.6),
                  child: InkWell(
                    onTap: () {
                      print('Card tapped.');
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(5),
                      alignment: Alignment.centerLeft,
                      height: blockHeight * 5,
                      child: Row(
                        children: [
                          Text(
                            'Log out',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            width: blockWidth * 32,
                          ),
                          IconButton(
                              alignment: Alignment.topRight,
                              icon: Icon(
                                Icons.logout,
                                size: 23,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()),
                                );
                              })
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: blockHeight*20,
              ),
              
            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: universities.length,
            itemBuilder: (context, position) {
              return buildListItem(
                  universities[position].university, "images/ucsc.jpg");
            },
          ),
        ),
      ),
    );
  }

  buildListItem(String canteenName, String imageURL) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
      width: double.infinity,
      child: InkWell(
        child: Container(
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 25.0),
          decoration: BoxDecoration(
            color: Colors.green[100].withOpacity(0.6),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                radius: 40.0,
                backgroundImage: AssetImage(imageURL),
              ),
              SizedBox(width: 20.0),
              Container(
                width: 1.0,
                height: 40.0,
                color: Colors.black,
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0),
                width: 180.0,
                child: Text(
                  canteenName,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodItem(canteenName),
            ),
          );
        },
      ),
    );
  }
}
