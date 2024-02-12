import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }
}

final List<BottomNavigationBarItem> items = [
  BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
  BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Pesanan'),
  BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
];

@override
Widget build(BuildContext context) {
  return Obx(() {
    int selectedIndex = Get.find<MainController>().selectedIndex.value;

    return BottomNavigationBar(
      items: items,
      currentIndex: selectedIndex,
      onTap: (index) {
        Get.find<MainController>().changeTabIndex(index);
      },
    );
  });
}
