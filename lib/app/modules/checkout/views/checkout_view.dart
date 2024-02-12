import 'package:dianminimotor/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../controllers/checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
  const CheckoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int subtotalProduk = controller.produkInfo['harga'];
    int subtotalPengiriman =
        40000; // Misalkan biaya pengiriman adalah Rp. 30.000
    int totalPembayaran = subtotalProduk + subtotalPengiriman;

    NumberFormat formatter = NumberFormat('#,###');

    String formattedAmount = formatter.format(totalPembayaran);
    return Scaffold(
      backgroundColor: Color(0xFF181818),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFF121212),
        title: Text(
          'Checkout',
          style: GoogleFonts.readexPro(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child:
            // Text('Nama: ${controller.produkInfo['nama']}'),
            Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Alamat',
                style: GoogleFonts.readexPro(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Color(0xFF181818),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 7, 0),
                              child: Icon(
                                Icons.location_on_rounded,
                                color: Color(0xFFCE9018),
                                size: 30,
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Rumah',
                                  style: GoogleFonts.readexPro(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  '+62-819-4704-2884',
                                  style: GoogleFonts.readexPro(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w200,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Jl. Pemuda, No. 1, RT001/RW002 ..',
                                  style: GoogleFonts.readexPro(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w200,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                        child: IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 22,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print(Get.toNamed('page'));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFCE9018),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    ),
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  height: 40,
                  alignment: Alignment.center,
                  child: Text(
                    '+ Tambah Alamat',
                    style: GoogleFonts.readexPro(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              GetBuilder<CheckoutController>(builder: (controller) {
                print(controller.produkInfo);
                return Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          '${controller.produkInfo['gambar']}',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: 240,
                        height: 100,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${controller.produkInfo['kategori']}',
                                    style: GoogleFonts.readexPro(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    '${controller.produkInfo['nama']}',
                                    style: GoogleFonts.readexPro(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '${controller.produkInfo['harga']}',
                                    style: GoogleFonts.readexPro(
                                      color: Color(0xFFCE9018),
                                      fontSize: 14,
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Warna : ${controller.produkInfo['warna'].toString()}',
                                        style: GoogleFonts.readexPro(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w200,
                                        ),
                                      ),
                                      Text(
                                        'Jumlah Beli : ${controller.produkInfo['count']}',
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.readexPro(
                                          color: Color(0xFFCE9018),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
              SizedBox(height: 8),
              Text(
                'Pembayaran',
                style: GoogleFonts.readexPro(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                child: Container(
                  width: double.infinity,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Color(0xFF191919),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Color(0xFF404040),
                      width: 2,
                    ),
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              'https://firebasestorage.googleapis.com/v0/b/dianminimotor.appspot.com/o/pembayaran%2Fbank-mandiri.png?alt=media&token=5de56d02-7662-48ac-8ab0-0d8c5e505470',
                              width: 50,
                              height: 30,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Bank Mandiri',
                                style: GoogleFonts.readexPro(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                              Text(
                                '(3210987654321)',
                                textAlign: TextAlign.end,
                                style: GoogleFonts.readexPro(
                                  color: Colors.blue[300],
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal Produk :',
                    style: GoogleFonts.readexPro(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    'Rp. $subtotalProduk',
                    style: GoogleFonts.readexPro(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal Pengiriman :',
                    style: GoogleFonts.readexPro(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    'Rp. $subtotalPengiriman',
                    style: GoogleFonts.readexPro(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Pembayaran :',
                      style: GoogleFonts.readexPro(
                        color: Color(0xFFCE9018),
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      'Rp. ${formattedAmount}',
                      style: GoogleFonts.readexPro(
                        color: Color(0xFFCE9018),
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10),
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Color(0xFFCE9018))),
          onPressed: () async {
            final Map<String, dynamic> produkInfoData =
                Map.from(controller.produkInfo);

            if (produkInfoData.isNotEmpty) {
              await controller.checkout(produkInfoData);
              Get.defaultDialog(
                  title: 'Berhasil',
                  middleText: 'Pesanan anda berhasil diproses',
                  textConfirm: 'OK',
                  onConfirm: () {
                    // Pada halaman tertentu, seperti pada tombol kembali
                    // Untuk kembali ke halaman sebelum '/target_route' dan menutup halaman saat ini
                    Get.until(
                        (route) => Get.previousRoute == Routes.PRODUK_DETAIL);
                  });
            } else {
              Get.snackbar(
                'Error',
                'Mohon lengkapi data sebelum melakukan checkout',
                backgroundColor: Colors.red,
                colorText: Colors.white,
              );
            }
          },
          child: Container(
            width: double.infinity,
            height: 40,
            alignment: Alignment.center,
            child: Text(
              'CHECKOUT',
              style: GoogleFonts.readexPro(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
