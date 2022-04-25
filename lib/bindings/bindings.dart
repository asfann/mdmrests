import 'package:get/get.dart';
import 'package:mdmrest/controllers/authContoller.dart';
import 'package:mdmrest/controllers/tableController.dart';
import 'package:mdmrest/controllers/waiterController.dart';

Future<void> init() async{
Get.lazyPut(() => WaiterController());
Get.lazyPut(() => TableController());
Get.lazyPut(() => AuthController());
}
