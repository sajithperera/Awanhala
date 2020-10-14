import 'package:awanahala/services/auth_service.dart';
import 'package:awanahala/services/auth_service_impl.dart';
import 'package:awanahala/services/getItem_service.dart';
import 'package:awanahala/services/order_service.dart';
import 'package:awanahala/services/order_service_impl.dart';
import 'package:awanahala/services/university_service.dart';
import 'package:awanahala/services/university_service_impl.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

setupServiceLocator() {
  locator.registerLazySingleton<AuthService>(() => AuthServiceImpl());

  locator
      .registerLazySingleton<UniversityService>(() => UniversityServiceImpl());

  locator.registerLazySingleton(() => HttpService());

  locator.registerLazySingleton<Orderservice>(() => OrderServiceImpl());
}
