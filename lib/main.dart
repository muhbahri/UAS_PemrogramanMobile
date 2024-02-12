import 'package:dianminimotor/app/controllers/auth_controller.dart';
import 'package:dianminimotor/app/modules/checkout/controllers/checkout_controller.dart';
import 'package:dianminimotor/app/modules/home/controllers/home_controller.dart';
import 'package:dianminimotor/app/modules/home/views/home_view.dart';
import 'package:dianminimotor/app/modules/main/controllers/main_controller.dart';
import 'package:dianminimotor/app/modules/pesanan/controllers/pesanan_controller.dart';
import 'package:dianminimotor/app/modules/profil/views/profil_view.dart';
import 'package:dianminimotor/app/modules/semua_produk/controllers/semua_produk_controller.dart';
import 'package:dianminimotor/app/modules/semua_produk/views/semua_produk_view.dart';
import 'package:dianminimotor/app/utils/bottom_navbar.dart';
// import 'package:dianminimotor/app/modules/home/views/home_view.dart';
// import 'package:dianminimotor/app/modules/login/views/login_view.dart';
import 'package:dianminimotor/app/utils/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(HomeController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authC = Get.put(AuthController(), permanent: true);
  final MainController mainController = Get.put(MainController());
  final HomeController homeController = Get.put(HomeController());
  final PesananController pesananController = Get.put(PesananController());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Application",
            initialRoute: snapshot.data != null && snapshot.data!.emailVerified
                ? Routes.MAIN
                : Routes.LOGIN,
            getPages: AppPages.routes,
            initialBinding: BindingsBuilder(() {
              Get.put(SemuaProdukController());
              Get.put(CheckoutController());
            }),
          );
        }
        return LoadingView();
      },
      stream: authC.streamAuthStatus,
    );
  }
}
