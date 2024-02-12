import 'package:get/get.dart';

import '../controllers/semua_produk_controller.dart';

class SemuaProdukBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SemuaProdukController>(
      () => SemuaProdukController(),
    );
  }
}
