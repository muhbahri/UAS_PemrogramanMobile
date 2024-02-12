import 'package:dianminimotor/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final RxInt currentIndex = 0.obs;
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  void signup(String email, String password) async {
    try {
      UserCredential myUser = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await myUser.user!.sendEmailVerification();
      Get.defaultDialog(
          title: 'Verifikasi Email',
          middleText: 'Kami telah mengirimkan email verifikasi ke $email',
          titlePadding: EdgeInsets.all(10),
          onConfirm: () {
            Get.back();
            Get.back();
          },
          textConfirm: "Ya, saya akan cek email");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('the email already exist');
        Get.defaultDialog(
            title: 'Terjadi Kesalahan',
            middleText: 'the email already exist',
            titlePadding: EdgeInsets.all(10));
      } else if (e.code == 'weak-password') {
        print('the password provided is too weak');
        Get.defaultDialog(
            title: 'Terjadi Kesalahan',
            middleText: 'the password provided is too weak',
            titlePadding: EdgeInsets.all(10));
      }
    }
    cacth(e) {
      print(e);
      print('Email tidak terdaftar');
    }

    ;
  }

  void login(String email, String password) async {
    try {
      UserCredential myUser = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (myUser.user!.emailVerified) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.defaultDialog(
            title: 'Verifikasi Email',
            middleText: 'Email anda belum terverifikasi',
            titlePadding: EdgeInsets.all(10),
            onConfirm: () async {
              await myUser.user!.sendEmailVerification();
              Get.back();
            },
            textConfirm: "Kirim Verifikasi",
            textCancel: "Kembali");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('Email tidak terdaftar');
        Get.defaultDialog(
            title: 'Terjadi Kesalahan',
            middleText: 'Email tidak terdaftar',
            titlePadding: EdgeInsets.all(10));
      } else if (e.code == 'wrong-password') {
        print('Password anda Salah');
        Get.defaultDialog(
            title: 'Terjadi Kesalahan',
            middleText: 'Password anda Salah',
            titlePadding: EdgeInsets.all(10));
      }
    } catch (e) {
      print(e);
      Get.defaultDialog(
          title: 'Terjadi Kesalahan',
          middleText: 'Tidak dapat Login dengan akun ini',
          titlePadding: EdgeInsets.all(10));
    }
  }

  void resetPassword(String email) async {
    // ignore: unrelated_type_equality_checks
    if (email != '' && email == GetUtils.isEmail(email)) {
      try {
        auth.sendPasswordResetEmail(email: email);
        Get.defaultDialog(
            title: 'Reset Password Berhasil',
            middleText: 'Kami telah mengirimkan reset password ke $email',
            titlePadding: EdgeInsets.all(10),
            onConfirm: () async {
              Get.back();
              Get.back();
            },
            textConfirm: "Oke",
            textCancel: "Kembali");
      } catch (e) {
        Get.defaultDialog(
            title: 'Terjadi Kesalahan',
            middleText: 'Tidak dapat reset password',
            titlePadding: EdgeInsets.all(10));
      }
    } else {
      Get.defaultDialog(
          title: 'Terjadi Kesalahan',
          middleText: 'Email tidak valid',
          titlePadding: EdgeInsets.all(10));
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }

  void updateCurrentIndex(int index) {
    currentIndex.value = index;
  }
}
