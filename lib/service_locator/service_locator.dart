import 'package:awanahala/services/auth_service.dart';
import 'package:awanahala/services/auth_service_impl.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

setupServiceLocator() {
  locator.registerLazySingleton<AuthService>(() => AuthServiceImpl());
}
