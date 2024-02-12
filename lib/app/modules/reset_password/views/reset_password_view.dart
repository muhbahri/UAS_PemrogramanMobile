import 'package:dianminimotor/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password Screen'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            TextField(
              controller: controller.emailC,
              decoration: InputDecoration(labelText: "Email"),
            ),
            SizedBox(height: 25),
            ElevatedButton(
                onPressed: () => authC.resetPassword(controller.emailC.text),
                child: Text('RESET')),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Sudah Punya Akun?'),
                TextButton(onPressed: () => Get.back(), child: Text('Login')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
