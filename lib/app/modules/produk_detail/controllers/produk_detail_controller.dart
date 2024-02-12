import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProdukDetailController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late Map<String, dynamic> data;
  RxInt count = 0.obs;
  RxList<dynamic> selectedColors = <dynamic>[].obs;

  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference docRef = firestore.collection('produks').doc(docID);

    return docRef.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference produks = firestore.collection('produks');

    return produks.snapshots();
  }

  void setProductData(Map<String, dynamic> productData) {
    data = productData;
  }

  Map<String, dynamic> getCheckout() {
    // ignore: unnecessary_null_comparison
    if (data == null) {
      print("Error: Data is null");
      return {};
    }

    print("produkInfo: $data");
    return {
      'nama': data['nama'],
      'harga': data['harga'],
      'gambar': data['gambar'],
      'kategori': data['kategori'],
      'warna': List<String>.from(selectedColors),
      'count': count,
    };
  }

  void increment() {
    count++;
  }

  void decrement() {
    if (count > 0) {
      count--;
    }
  }
}
