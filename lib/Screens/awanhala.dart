import 'package:awanahala/Screens/profile.dart';
import 'package:awanahala/bloc/SignUpBloc.dart';
import 'package:awanahala/models/User.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'login.dart';
import 'signUp.dart';
import 'forgotPass.dart';
import 'registration.dart';
import 'finalReg.dart';
import 'home.dart';
import 'cart.dart';
import 'scanQR.dart';
import 'canteenSelect.dart';
import 'ratethefood.dart';

class Awanhala extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpBloc>(
      create: (context) => SignUpBloc(User()),
      child: GetMaterialApp(
        title: 'Awanahala',
        debugShowCheckedModeBanner: false,
        initialRoute: '/canteenSelect',
        routes: {
          '/login': (context) => Login(),
          '/sighUp': (context) => SignUp(),
          '/forgotPass': (context) => ForgotPass(),
          '/registration': (context) => Registration(),
          '/finalReg': (context) => FinalReg(),
          '/home': (context) => Home(),
          '/canteenSelect': (context) => CanteenSelect(),
          '/rateFood': (context) => RateFood(),
          '/cart': (context) => Cart(),
          '/scanQR': (context) => ScanQR(),
          '/profile': (context) => UserProfile(),
        },
        home: FutureBuilder(
          future: Hive.openBox('user'), //user data us stored in the hive box
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              print("opening box");
              if (snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text(snapshot.error.toString()),
                  ),
                );
              } else {
                if (Hive.box('user').get('email') == null) {
                  print("not logged in");
                  return Login();
                } else {
                  print("logged in");
                  return CanteenSelect();
                }
              }
            } else {
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
