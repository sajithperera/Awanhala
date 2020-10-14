import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:awanahala/shared/sizeConfig.dart';
import 'package:image_picker/image_picker.dart';

class RateFood extends StatefulWidget {
  @override
  _RateFoodState createState() => _RateFoodState();
}

class _RateFoodState extends State<RateFood> {

  File _image;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double blockHeight = SizeConfig.safeBlockVertical;
    double blockWidth = SizeConfig.safeBlockHorizontal;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 40,
              color: Colors.white,
            ),
            onPressed: (){
              Navigator.pop(context);
            },
            //should add selection drop down
          ),
          title: Text("Rate the Food"),
          backgroundColor: Colors.red[400],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox( height: blockHeight * 5),
              Padding(
                padding: EdgeInsets.only(left: blockWidth * 15),
                child: Container(
                  child: Text(
                    "Your Plate",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: blockHeight * 3,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: blockWidth * 23,
                  ),
                  Expanded(
                    child: Text(
                      "Fish Bun",
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    child: Flex(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.thumb_up,
                            color: Colors.green,
                          ),
                          onPressed: () {
                            print("Thumbs up button clicked");
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.thumb_down,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            print("Thumbs down button clicked");
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: blockWidth * 23,
                  ),
                  Expanded(
                    child: Text(
                      "Rolls",
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    child: Flex(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.thumb_up,
                            color: Colors.green,
                          ),
                          onPressed: () {
                            print("Thumbs up button clicked");
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.thumb_down,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            print("Thumbs down button clicked");
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: blockWidth * 23,
                  ),
                  Expanded(
                    child: Text(
                      "Tea",
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    child: Flex(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.thumb_up,
                            color: Colors.green,
                          ),
                          onPressed: () {
                            print("Thumbs up button clicked");
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.thumb_down,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            
                            print("Thumbs down button clicked");
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: blockHeight * 3,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: blockWidth * 23,
                  ),
                  Text("Add a Complaint"),
                  SizedBox(
                    width: blockWidth * 25
                    ),
                  IconButton(
                    icon: Icon(
                      Icons.add_a_photo,
                      color: Colors.green[500],
                      size: 30,
                    ),
                    onPressed: () {
                      picker(context);
                      print("Add photo button clicked ");
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: blockWidth * 23),
                  Container(
                    width: blockWidth*50,
                    height: blockHeight*30,
                    color: Colors.grey[100],
                    child: Container(     
                      //backgroundColor: Colors.red,
                      child: _image != null
                        ? ClipRRect(
                          borderRadius: BorderRadius.circular(10),   
                          child: Image.file(
                            _image,
                            width: blockWidth* 90,
                            height:blockHeight* 90,
                            fit: BoxFit.cover,
                          ),
                        )
                       : Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10)
                          ),  
                          width: blockWidth* 90,
                          height: blockHeight* 90,
                          child: Icon(
                            Icons.camera_alt,
                            size: 50,
                            color: Colors.grey[800],
                          ),
                        ),
                     ),
                  ),
                  SizedBox(width: blockWidth * 12),
                ],
              ),
              SizedBox(height: blockHeight * 3),
              Row(
                children: <Widget>[   
                  SizedBox(
                    width: blockWidth * 23,
                  ),
                  Expanded(
                    child: TextField(
                      minLines: 5,
                      maxLines: 10,
                      decoration: InputDecoration(
                        hintText: "Write your Complaint here",
                        filled: true,
                        fillColor: Colors.transparent,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: blockWidth * 12),
                ],
              ),
              SizedBox(height: blockHeight * 2.5),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: blockWidth * 23,
                  ),
                  Expanded(
                    child: RaisedButton(
                      child: Text("Add Rating"),
                      onPressed: () {
                        print("Add Rating Button Click");
                      },
                      padding: EdgeInsets.fromLTRB(blockWidth * 2,
                          blockHeight * 1, blockWidth * 2, blockHeight * 1),
                      color: Colors.grey,
                      textColor: Colors.black,
                    ),
                  ),
                  SizedBox(width: blockWidth * 12)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
                          
  void picker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: Wrap(
              children: <Widget>[
                 ListTile(
                    leading: Icon(Icons.photo_library),
                    title: Text('Photo Library'),
                    onTap: () {
                      _imgFromGallery();
                      Navigator.of(context).pop();
                    }),
                 ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text('Camera'),
                  onTap: () {
                    _imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  void _imgFromCamera() async {
  // ignore: deprecated_member_use
  File image = await ImagePicker.pickImage(
    source: ImageSource.camera, imageQuality: 50
  );

  setState(() {
    _image = image;
  });
}

  void _imgFromGallery() async{
    // ignore: deprecated_member_use
    File image = await  ImagePicker.pickImage(
      source: ImageSource.gallery, imageQuality: 50
  );

  setState(() {
    _image = image;
  });
  }

  

}
