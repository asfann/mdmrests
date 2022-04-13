import 'package:get/get.dart';
import 'package:mdmrest/bindings/waiter_bindings.dart';
import 'package:mdmrest/screens/waiters/waiters.dart';

part 'app_routes.dart';

class AppPages{
  AppPages._();


  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: () => Waiters(),
    binding: WaiterBinding()
    ),
  ];
}