import 'package:dianminimotor/app/modules/home/views/home_view.dart';
import 'package:dianminimotor/app/modules/pesanan/views/pesanan_view.dart';
import 'package:dianminimotor/app/modules/profil/views/profil_view.dart';
import 'package:dianminimotor/app/modules/semua_produk/views/semua_produk_view.dart';
import 'package:dianminimotor/app/utils/bottom_navbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: IndexedStack(
            index: controller.selectedIndex.value,
            children: [
              HomeView(),
              PesananView(),
              ProfilView(),
            ],
          ),
          bottomNavigationBar: Obx(() {
            int selectedIndex = Get.find<MainController>().selectedIndex.value;

            return BottomNavigationBar(
              backgroundColor: Color(0xFF212121),
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey[600],
              elevation: 10,
              items: items,
              currentIndex: selectedIndex,
              onTap: (index) {
                Get.find<MainController>().changeTabIndex(index);
              },
            );
          }),
        ));
  }
}
