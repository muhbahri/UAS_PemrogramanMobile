import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  RxMap<String, dynamic> produkInfo = RxMap<String, dynamic>();

  void setProdukInfo(Map<String, dynamic> info) {
    print('warna sekarang : ${produkInfo['warna']}');
    print("Setting produkInfo: $info");
    produkInfo.addAll(info);
    print("ProdukInfo after setting: $produkInfo");
  }

  Future<void> checkout(Map<String, dynamic> data) async {
    try {
      // Mengonversi nilai RxMap menjadi Map biasa
      Map<String, dynamic> produkData = Map.from(produkInfo);

      // Mengonversi nilai Rx ke nilai dasar jika diperlukan
      produkData.forEach((key, value) {
        if (value is Rx) {
          produkData[key] = value.value;
        }
      });

      int subtotalProduk = produkData['harga'];
      int subtotalPengiriman = 40000;
      int totalPembayaran = subtotalProduk + subtotalPengiriman;

      produkData['total_bayar'] = totalPembayaran;

      produkData['status'] = 'dikemas';

      // Simpan data checkout ke Firebase
      await FirebaseFirestore.instance.collection('orders').add(produkData);
      print('Checkout successful');
    } catch (e) {
      // Handle error
      print('Error during checkout: $e');
    }
  }
}
