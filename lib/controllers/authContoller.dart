import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../config.dart';
import '../screens/root.dart';

class AuthController extends GetxController{
var displayName = '';

FirebaseAuth auth = FirebaseAuth.instance;

User? get userProfile => auth.currentUser;

@override
  void onInit() {
  displayName = userProfile != null ? userProfile!.displayName! : '';
  super.onInit();
  }


void singIn(String email,String password) async{
  try{
    await auth
        .signInWithEmailAndPassword(email: email, password:  password)
        .then((value) => displayName=userProfile!.displayName!);
    update();
  } on FirebaseAuthException catch (e) {
    String title = e.code.replaceAll(RegExp('-'),' ').capitalize!;
    String message= '';

    if(e.code == 'wrong-password'){
      message = 'Invalid password. Please try again!';
    } else if(e.code == 'user-not-found'){
      message = 'The account does not exist for $email.';
    }else{
      message = e.message.toString();
    }

    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: kPrimaryColor,
        colorText: kBackgroundColor);
  } catch (e) {
    Get.snackbar(
      'Error occured!',
      e.toString(),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: kPrimaryColor,
      colorText: kBackgroundColor,
    );
  }
}

void signOut() async {
  try{
    await auth.signOut();
    displayName = '';
    update();
    Get.offAll(() => Root());
  }catch (e){
    Get.snackbar('Error Occured', e.toString(), backgroundColor: kPrimaryColor, colorText:kBackgroundColor );
  }
}

}