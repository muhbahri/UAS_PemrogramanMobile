import 'package:dianminimotor/app/controllers/auth_controller.dart';
import 'package:dianminimotor/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
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
                  'Login Page',
                  style: GoogleFonts.poppins(fontSize: 18, color: Colors.white),
                ),
                TextField(
                  controller: controller.emailC,
                  decoration: InputDecoration(labelText: "Email"),
                  style: TextStyle(color: Colors.grey),
                ),
                TextField(
                  controller: controller.passwordC,
                  decoration: InputDecoration(labelText: "Password"),
                  style: TextStyle(color: Colors.grey),
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: TextButton(
                      onPressed: () => Get.toNamed(Routes.RESET_PASSWORD),
                      child: Text(
                        'Lupa password?',
                        style: GoogleFonts.poppins(color: Color(0xFFCE9018)),
                      )),
                ),
                SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () => authC.login(
                      controller.emailC.text, controller.passwordC.text),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xFFCE9018))),
                  child: Text(
                    'LOGIN',
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Belum Punya Akun?',
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 12),
                ),
                TextButton(
                    onPressed: () => Get.toNamed(Routes.SIGNUP),
                    child: Text(
                      'Register',
                      style: GoogleFonts.poppins(color: Color(0xFFCE9018)),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
