import 'package:awanahala/bloc/SignUpBloc.dart';
import 'package:awanahala/events/SignUpEvent.dart';
import 'package:awanahala/models/User.dart';
import 'package:awanahala/service_locator/service_locator.dart';
import 'package:awanahala/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _formKey = GlobalKey<FormState>();
  RegExp regex1 = new RegExp(r'^([0-9]{9}[x|X|v|V])$');
  RegExp regex2 = new RegExp(r'^([0-9]{12})$');
  String fullName;
  String phoneNumber;
  String email;
  String nic;
  final AuthService authService = locator<AuthService>();

  signupFun(User user) {
    user.fullName = fullName;
    user.phoneNumber = phoneNumber;
    user.email = email;
    user.nic = nic;
    authService.signUp(user);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Registraion"),
            backgroundColor: Colors.red[400],
          ),
          body: BlocBuilder<SignUpBloc, User>(
            builder: (context, state) {
              return Container(
                child: SingleChildScrollView(
                  child: Center(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 150.0,
                            child: Padding(
                              padding: EdgeInsets.only(top: 30.0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 15.0,
                                child: Image.asset("images/Cantima.png"),
                              ),
                            ),
                          ),
                          SizedBox(height: 40.0),
                          Container(
                            child: Padding(
                              padding: EdgeInsets.only(left: 50.0, right: 50.0),
                              child: TextFormField(
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Name is required';
                                  } else {
                                    return null;
                                  }
                                },
                                onSaved: (newValue) {
                                  fullName = newValue;
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10.0),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30.0)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30.0)),
                                  ),
                                  prefixIcon: Icon(Icons.person),
                                  hintText: "Name",
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            child: Padding(
                              padding: EdgeInsets.only(left: 50.0, right: 50.0),
                              child: TextFormField(
                                keyboardType: TextInputType.phone,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Mobile number is required';
                                  } else if (value.length != 10 ||
                                      value.substring(0, 2) != "07") {
                                    return 'Enter valid phone number';
                                  } else {
                                    return null;
                                  }
                                },
                                onSaved: (newValue) {
                                  phoneNumber = newValue;
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10.0),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30.0)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30.0)),
                                  ),
                                  prefixIcon: Icon(Icons.vpn_key),
                                  hintText: "Phone Number",
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            child: Padding(
                              padding: EdgeInsets.only(left: 50.0, right: 50.0),
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10.0),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30.0)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30.0)),
                                  ),
                                  prefixIcon: Icon(Icons.vpn_key),
                                  hintText: "Email",
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  border: InputBorder.none,
                                ),
                                onSaved: (newValue) {
                                  email = newValue;
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            child: Padding(
                              padding: EdgeInsets.only(left: 50.0, right: 50.0),
                              child: TextFormField(
                                validator: (value) {
                                  if ((value.length == 10 &&
                                          regex1.hasMatch(value)) ||
                                      (value.length == 12 &&
                                          regex2.hasMatch(value))) {
                                    return null;
                                  } else {
                                    return 'Enter valid NIC number';
                                  }
                                },
                                onSaved: (newValue) {
                                  nic = newValue;
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10.0),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30.0)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30.0)),
                                  ),
                                  prefixIcon: Icon(Icons.vpn_key),
                                  hintText: "NIC",
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 35.0),
                          Container(
                            color: Colors.transparent,
                            width: double.infinity,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 50.0,
                                  right: 50.0,
                                  top: 10.0,
                                  bottom: 10.0),
                              child: MaterialButton(
                                height: 50.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  side: BorderSide(color: Colors.transparent),
                                ),
                                child: Text(
                                  "Next",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                textColor: Colors.white,
                                splashColor: Colors.green,
                                color: Colors.green[300],
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    _formKey.currentState.save();
                                    signupFun(state);
                                  }
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 15.0),
                          Text(
                            "Already have an account ?",
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.pushNamed(context, '/login');
                            },
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                fontWeight: FontWeight.w200,
                                color: Colors.black54,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }
}
