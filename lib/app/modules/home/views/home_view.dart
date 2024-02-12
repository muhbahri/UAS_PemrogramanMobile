// import 'dart:math';
import 'package:dianminimotor/app/utils/bottom_navbar.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:dianminimotor/app/controllers/auth_controller.dart';
import 'package:dianminimotor/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final authC = Get.find<AuthController>();
  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181818),
      appBar: AppBar(
        backgroundColor: Color(0xFF121212),
        title: Text(
          'Dian Mini Motor',
          style: GoogleFonts.outfit(color: Colors.white, fontSize: 22),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 40,
                  onPressed: () {},
                  icon: Icon(
                    Icons.search_rounded,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                IconButton(
                  iconSize: 40,
                  onPressed: () {
                    // Get.toNamed(Routes.KERANJANG);
                  },
                  icon: Icon(
                    Icons.shopping_cart_rounded,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
        ],
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
              child: Stack(
                children: [
                  Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/dianminimotor.appspot.com/o/homepage.jpeg?alt=media&token=2b8b59ab-2a8d-48aa-9a21-8a3f7f6d0159',
                    width: double.infinity,
                    height: 400,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: double.infinity,
                    height: 400,
                    decoration: BoxDecoration(color: Color(0x74000000)),
                    child: Align(
                      alignment: AlignmentDirectional(-1, -1),
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Penuhi Kebutuhan\nbermain Anak',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.white),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                              child: Text(
                                'dengan diskon belanja 20%',
                                textAlign: TextAlign.start,
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12,
                                    color: Colors.white),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Get.toNamed(Routes.SEMUA_PRODUK);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFCE9018),
                                elevation: 3,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24, 0, 24, 0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text('Cari Produk',
                                  style: GoogleFonts.readexPro(
                                    color: Colors.white,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
              child: Text('Kategori',
                  style: GoogleFonts.poppins(color: Colors.white)),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
              child: SizedBox(
                height: 150,
                child: StreamBuilder(
                  stream: controller
                      .streamDistinctKategori(), // Replace with your stream for kategori
                  builder: (context, snapshot) {
                    print('Stream Snapshot: $snapshot');
                    print('Snapshot Data: ${snapshot.data}');
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    var Kategori = snapshot.data ?? [];
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Kategori.length,
                      itemBuilder: (context, index) {
                        return Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Container(
                            width: 140,
                            height: 140,
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    Kategori[index]['gambar'] ?? '',
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration:
                                      BoxDecoration(color: Color(0xA1000000)),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    Kategori[index]['kategori'] ?? '',
                                    style: GoogleFonts.readexPro(
                                        color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
              child: Text('Semua Produk',
                  style: GoogleFonts.poppins(color: Colors.white)),
            ),
            Container(
              height: 565,
              child: StreamBuilder(
                stream: controller.streamData(), // Use your stream here

                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  var listAllData = snapshot.data!.docs;
                  return GridView.builder(
                    // physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 5 / 8.5,
                    ),
                    itemCount: listAllData.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => Get.toNamed(Routes.PRODUK_DETAIL,
                            arguments: listAllData[index].id),
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Color(0xFF181818),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Stack(
                                    alignment: AlignmentDirectional(1, -1),
                                    children: [
                                      Image.network(
                                        '${(listAllData[index].data() as Map<String, dynamic>)["gambar"]}',
                                        width: 180,
                                        height: 210,
                                        fit: BoxFit.cover,
                                      ),
                                      // Align(
                                      //   alignment: AlignmentDirectional(1, -1),
                                      //   child: IconFavorit(),
                                      // ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 0, 0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '${(listAllData[index].data() as Map<String, dynamic>)["nama"]}',
                                        style: GoogleFonts.poppins(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 10, 5),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '${(listAllData[index].data() as Map<String, dynamic>)["terjual"] == null || (listAllData[index].data() as Map<String, dynamic>)['terjual'] == 0 ? "0 terjual" : "${(listAllData[index].data() as Map<String, dynamic>)['terjual']} Terjual"}',
                                        style: GoogleFonts.poppins(
                                            color: Color(0xFFCE9018),
                                            fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 10, 10),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Rp. ${(listAllData[index].data() as Map<String, dynamic>)["harga"].toString()}',
                                    style: GoogleFonts.poppins(
                                        color: Color(0xFFCE9018), fontSize: 14),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
