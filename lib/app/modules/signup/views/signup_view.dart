import 'package:dianminimotor/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181818),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(40),
            child: Column(
              children: [
                Text(
                  'Register Page',
                  style: GoogleFonts.poppins(fontSize: 18, color: Colors.white),
                ),
                TextField(
                  controller: controller.emailC,
                  decoration: InputDecoration(
                    labelText: "Email",
                  ),
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                TextField(
                  controller: controller.passwordC,
                  decoration: InputDecoration(labelText: "Password"),
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 25),
                ElevatedButton(
                    onPressed: () => authC.signup(
                        controller.emailC.text, controller.passwordC.text),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Color(0xFFCE9018))),
                    child: Text(
                      'REGISTER',
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
                SizedBox(height: 15),
                TextButton(
                    onPressed: () => Get.back(),
                    child: Text(
                      'Login',
                      style: GoogleFonts.poppins(color: Color(0xFFCE9018)),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
