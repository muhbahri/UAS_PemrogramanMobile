import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddProdukController extends GetxController {
  late TextEditingController namaC = TextEditingController();
  late TextEditingController hargaC = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void AddProduk(String nama, String harga) async {
    CollectionReference produks = firestore.collection('produks');

    try {
      await produks.add({
        "nama": nama,
        "harga": harga,
      });

      Get.defaultDialog(
          title: "Produk Berhasil Ditambahkan",
          onConfirm: () {
            Get.back();
            Get.back();
          },
          textConfirm: "Oke");
    } catch (e) {
      print(e);
      Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "Produk tidak berhasil ditambahkan");
    }
  }

  @override
  void onClose() {
    namaC.dispose();
    hargaC.dispose();
    super.onClose();
  }
}
