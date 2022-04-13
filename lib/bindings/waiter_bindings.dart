import 'package:get/get.dart';
import 'package:mdmrest/controllers/waiterController.dart';

class WaiterBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<WaiterController>(() => WaiterController()
    );
  }
}
