import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../controllers/pesanan_controller.dart';

class PesananView extends GetView<PesananController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181818),
      appBar: AppBar(
        backgroundColor: Color(0xFF121212),
        centerTitle: true,
        title: Text(
          'Pesanan',
          style: GoogleFonts.poppins(color: Colors.white),
        ),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              // Tambahkan logika refresh di sini
              Get.offAllNamed('/');
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Obx(
        () {
          if (controller.orders.isEmpty) {
            return Center(
              child: Text(
                'Belum ada pesanan',
                style: TextStyle(color: Colors.white),
              ),
            );
          } else {
            return Obx(() => ListView.builder(
                  itemCount: controller.orders.length,
                  itemBuilder: (context, index) {
                    final order = controller.orders[index];
                    return ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          order['gambar'],
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        order['nama'],
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        'Rp. ${order['total_bayar'].toString()}',
                      ),
                      trailing: Text(
                        order['status'],
                        style: TextStyle(color: Color(0xFFCE9018)),
                      ),
                    );
                  },
                ));
          }
        },
      ),
    );
  }
}
