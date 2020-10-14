import 'package:awanahala/bloc/CartBlocObserver.dart';
import 'package:awanahala/bloc/SignUpBlocObserver.dart';
import 'package:awanahala/service_locator/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:awanahala/Screens/awanhala.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);

  Bloc.observer = SignUpBlocObserver();
  Bloc.observer = CartBlocObserver();
  setupServiceLocator();
  runApp(Awanhala());
}
