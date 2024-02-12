import 'package:dianminimotor/app/modules/semua_produk/controllers/semua_produk_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

ElevatedButton SelectedButton(
    SemuaProdukController controller, int currentIndex, String text) {
  final controller = Get.put(SemuaProdukController());
  return ElevatedButton(
    onPressed: () {
      controller.selectCategory(currentIndex);
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: currentIndex == controller.selectedCategoryIndex
          ? Color(0xFFCE9018)
          : Color(0x00FFFFFF),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Color(0xFFCE9018)),
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    child: Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}
