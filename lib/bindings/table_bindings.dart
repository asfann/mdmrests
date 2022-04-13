import 'package:get/get.dart';
import 'package:mdmrest/controllers/tableController.dart';

class TableBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<TableController>(() => TableController()
    );
  }
}
