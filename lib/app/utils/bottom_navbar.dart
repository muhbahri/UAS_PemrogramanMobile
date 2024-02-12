import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  final List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Cart'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      int selectedIndex = Get.find<NavbarController>().selectedIndex.value;

      return BottomNavigationBar(
        items: items,
        currentIndex: selectedIndex,
        onTap: (index) {
          Get.find<NavbarController>().changeTabIndex(index);
        },
      );
    });
  }
}

class NavbarController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }
}
