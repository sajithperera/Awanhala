import 'package:awanahala/bloc/SignUpBloc.dart';
import 'package:awanahala/events/SignUpEvent.dart';
import 'package:awanahala/models/User.dart';
import 'package:awanahala/service_locator/service_locator.dart';
import 'package:awanahala/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FinalReg extends StatefulWidget {
  @override
  _FinalRegState createState() => _FinalRegState();
}

class _FinalRegState extends State<FinalReg> {
  final _formKey = GlobalKey<FormState>();
  final AuthService authService = locator<AuthService>();

  signupeFun(User user) {
    print(user.email);
    // user.faculty = _selectedFac;
    // user.university = _selectedUni;
    authService.signUp(user);
  }

  List<String> _universities = [
    "University of Colombo",
    "University of Peradeniya",
    "University of Kelaniya",
    "University of Ruhuna",
    "University of Jayawardenapura",
    "University of Sabaragamuwa",
  ];

  List<String> _faculty = [
    "Faculty of Art",
    "UCSC",
    "Faculty of Medicine",
    "Faculty of Management",
    "Faculty of Engeneering",
  ];

  String _selectedUni;
  String _selectedFac;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Register2"),
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
                        Padding(
                          padding: EdgeInsets.only(left: 50.0, right: 50.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.0, right: 10.0),
                              child: DropdownButtonFormField(
                                isExpanded: true,
                                decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                ),
                                hint: Text("Select your university"),
                                iconSize: 30.0,
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 16.0),
                                value: _selectedUni,
                                validator: (value) {
                                  if (value == null) {
                                    return 'This field is required';
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedUni = newValue;
                                  });
                                },
                                items: _universities.map(
                                  (uni) {
                                    return DropdownMenuItem(
                                      child: Text(uni),
                                      value: uni,
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Padding(
                          padding: EdgeInsets.only(left: 50.0, right: 50.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.0, right: 10.0),
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                ),
                                hint: Text("Select your Faculty"),
                                iconSize: 30.0,
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 16.0),
                                value: _selectedFac,
                                validator: (value) {
                                  if (value == null) {
                                    return 'This field is required';
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedFac = newValue;
                                  });
                                },
                                items: _faculty.map(
                                  (uni) {
                                    return DropdownMenuItem(
                                      child: Text(uni),
                                      value: uni,
                                    );
                                  },
                                ).toList(),
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
                                "Register",
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
                                  // Navigator.pushNamed(context, '/home');' BlocProvider.of<SignUpBloc>(context).add(
                                  signupeFun(state);
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
        ),
      ),
    );
  }
}
