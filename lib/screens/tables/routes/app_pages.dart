import 'package:get/get.dart';
import 'package:mdmrest/bindings/table_bindings.dart';
import 'package:mdmrest/screens/tables/tables.dart';

part 'app_routes.dart';

class AppPages{
  AppPages._();


  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: () => Tables(),
        binding: TableBinding()
    ),
  ];
}