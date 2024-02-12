import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class PesananController extends GetxController {
  RxList<Map<String, dynamic>> orders = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    fetchOrders();
    super.onInit();
  }

  Future<void> fetchOrders() async {
    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('orders').get();
      final List<Map<String, dynamic>> fetchedOrders = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
      orders.assignAll(fetchedOrders);
    } catch (e) {
      // Handle error
    }
  }
}
