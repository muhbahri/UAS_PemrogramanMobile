import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  TextEditingController emailC =
      TextEditingController(text: "muhamadbahri0408@gmail.com");
  TextEditingController passwordC = TextEditingController(text: "bahri123");

  @override
  void onClose() {
    emailC.dispose();
    passwordC.dispose();
    super.onClose();
  }
}
