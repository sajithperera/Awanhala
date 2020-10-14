
import 'package:awanahala/Screens/profile.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cantime Home"),
        backgroundColor: Colors.red[400],
      ),
      body: Center(
        child: RaisedButton(onPressed: (){
         Navigator.push(context,MaterialPageRoute(builder: (context)=>UserProfile()));
        },
        child: Text("hai me"),),
      ),
    );
  }
}
