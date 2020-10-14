import 'dart:io';

import 'package:awanahala/Screens/ratethefood.dart';
import 'package:awanahala/shared/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  File _image;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _body(),
      ),
    );
  }

  Widget _body() {
    return ListView(
      children: <Widget>[
        _profilepic(),
        _divider(),
        _profiledetails(),
        _heading("Ongoing oders"),
        _myongoingoders(),
        _heading("Past Orders"),
        _mypastoders(),
      ],
    );
  }

  Widget _profilepic() {
    return Padding(
      padding: EdgeInsets.only(top: 32),
      child: GestureDetector(
        onTap: () {
          picker(context);
        },
        child: CircleAvatar(
          radius: 55,
          backgroundColor: Colors.yellow[200],
          child: _image != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.file(
                    _image,
                    width: 100,
                    height: 100,
                    fit: BoxFit.fitWidth,
                  ),
                )
              : Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(50)),
                  width: 100,
                  height: 100,
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.grey[800],
                  ),
                ),
        ),
      ),
    );
  }

  Widget _divider() {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Container(
        height: 0.5,
        color: Colors.black,
      ),
    );
  }

  Widget _profiledetails() {
    return Padding(
      padding: EdgeInsets.only(top: 16),
      child: Column(
        children: <Widget>[
          Text(
            "Theekshana sashika",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 8),
          Text(
            "Theekshanasashika@gmail.com",
            style: TextStyle(fontSize: 16, color: Color(0xffaeaeae)),
          ),
          SizedBox(height: 20),
          // Expanded(child: _myoders())
        ],
      ),
    );
  }

  Widget _heading(String text) {
    SizeConfig().init(context);
    double blockHeight = SizeConfig.safeBlockVertical;
    double blockWidth = SizeConfig.safeBlockHorizontal;
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Container(
                width: blockWidth*50,
                child: Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                width: blockWidth * 20,
              ),
              IconButton(
                alignment: Alignment.centerRight,
                icon: Icon(
                  Icons.keyboard_arrow_right,
                  // Icons.keyboard_arrow_right_rounded,
                  color: Colors.green,
                  size: blockWidth*15,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RateFood()),
                  );
                },
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: ClipRRect(
                
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 4,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.red,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _myongoingoders() {
    return Padding(
      padding: EdgeInsets.only(left: 32, right: 32, top: 16),
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
                  height: 180,
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
                    Text("Quqntity : 4"),
                  ],
                ),
                SizedBox(height: 16),
                Text("Expires in : 45 minutes")
              ],
            )),
      ),
    );
  }

  Widget _mypastoders() {
    return Padding(
      padding: EdgeInsets.only(left: 32, right: 32, top: 16),
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
    );
  }

  void picker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _imgFromCamera() async {
    // ignore: deprecated_member_use
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  void _imgFromGallery() async {
    // ignore: deprecated_member_use
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }
}
