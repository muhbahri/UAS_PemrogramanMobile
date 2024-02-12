import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class SemuaProdukController extends GetxController {
  int selectedCategoryIndex = -1;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference produks = firestore.collection('produks');

    return produks.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    List<String> kategori = [
      'Motor Listrik',
      'Mobil Listrik',
      'Sepeda Listrik'
    ];
    if (selectedCategoryIndex == -1) {
      print('Fetching all products');
      return FirebaseFirestore.instance.collection('produks').snapshots();
    } else {
      print(
          'Fetching products with category: ${kategori[selectedCategoryIndex]}');
      return FirebaseFirestore.instance
          .collection('produks')
          .where('kategori', isEqualTo: kategori[selectedCategoryIndex])
          .snapshots();
    }
  }

  void selectCategory(int index) {
    selectedCategoryIndex = index;
    update();
    Get.appUpdate();
  }
}
