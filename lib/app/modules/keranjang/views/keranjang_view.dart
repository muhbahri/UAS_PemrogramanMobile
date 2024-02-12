import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/keranjang_controller.dart';

class KeranjangView extends GetView<KeranjangController> {
  const KeranjangView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181818),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFF121212),
        centerTitle: true,
        title: Text(
          'Keranjang',
          style: GoogleFonts.outfit(color: Colors.white, fontSize: 22),
        ),
      ),
      body: const Center(
        child: Text(
          'KeranjangView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
