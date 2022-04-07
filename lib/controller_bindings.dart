import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/instance_manager.dart';
import 'package:mdmrest/controllers/authContoller.dart';
class ControllerBindings extends Bindings{
  @override
  void dependencies() {
Get.put<AuthController>( AuthController());
  }
}