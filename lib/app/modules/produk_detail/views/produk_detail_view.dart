import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dianminimotor/app/modules/checkout/controllers/checkout_controller.dart';
import 'package:dianminimotor/app/routes/app_pages.dart';
// import 'package:dianminimotor/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_popup_card/flutter_popup_card.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/produk_detail_controller.dart';

// ignore: must_be_immutable
class ProdukDetailView extends GetView<ProdukDetailController> {
  final ProdukDetailController _counterController =
      Get.put(ProdukDetailController());
  late Map<String, dynamic> data;
  ProdukDetailView({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181818),
      appBar: AppBar(
        backgroundColor: Color(0xFF121212),
        iconTheme: IconThemeData(color: (Colors.white)),
        title: Text('Detail Produk',
            style: GoogleFonts.poppins(color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<DocumentSnapshot<Object?>>(
          future: controller.getData(Get.arguments),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              data = snapshot.data!.data() as Map<String, dynamic>;
              _counterController.setProductData(data);
              // 'id':
              //     data['id'], // Pastikan field 'id' ada di dalam data produk
              // 'nama': data['nama'],
              // 'harga': data['harga'].toString(),
              // 'deskripsi': data['deskripsi'],
              // // ... field lainnya
              // };
              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(0),
                      child: Image.network(
                        data['gambar'],
                        width: double.infinity,
                        height: 350,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 10, 10, 5),
                      child: Row(
                        children: [
                          Flexible(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data['nama'],
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '${data['terjual'] == null || data['terjual'] == 0 ? "0 terjual" : "${data['terjual']} Terjual"}'
                                      .toString(),
                                  style: GoogleFonts.poppins(
                                      color: Color(0xFFCE9018), fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.00, -1.00),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 10, 10),
                        child: Text(
                          'Rp. ${data['harga']}'.toString(),
                          style: GoogleFonts.readexPro(
                            color: Color(0xFFCE9018),
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.00, -1.00),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 30, 10, 10),
                        child: Text(
                          'Deskripsi',
                          style: GoogleFonts.readexPro(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.00, -1.00),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 10, 10),
                        child: Text(
                          data['deskripsi'],
                          style: GoogleFonts.readexPro(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            } else if (snapshot.hasError) {
              return Align(
                alignment: Alignment.center,
                child: Center(
                  child: Text('Error: ${snapshot.error}'),
                ),
              );
            } else {
              // Kasus ketika snapshot.data == null dan tidak ada error
              return Align(
                alignment: Alignment.center,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showPopupCard(
              context: context,
              builder: (builder) {
                return GetBuilder<ProdukDetailController>(
                  init: _counterController,
                  builder: (controller) {
                    List<String> colors = data['warna'] != null
                        ? List<String>.from(data['warna'])
                        : [];
                    return PopupCard(
                      elevation: 8,
                      color: Colors.grey[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    data['gambar'],
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'Rp. ${data['harga']}'.toString(),
                                  style: GoogleFonts.readexPro(
                                    color: Colors.black,
                                    fontSize: 22,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text('Warna'),
                            Obx(() => Wrap(
                                  spacing: 8.0,
                                  children: [
                                    for (String color in colors)
                                      ElevatedButton(
                                        onPressed: () {
                                          controller.selectedColors.clear();
                                          controller.selectedColors.add(color);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: controller
                                                  .selectedColors
                                                  .contains(color)
                                              ? Color(0xFFCE9018)
                                              : Colors.grey[300],
                                        ),
                                        child: Text(
                                          color,
                                          style: GoogleFonts.poppins(
                                            color: controller.selectedColors
                                                    .contains(color)
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                  ],
                                )),
                            SizedBox(
                              height: 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Jumlah'),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.remove),
                                      onPressed: _counterController.decrement,
                                    ),
                                    Obx(() => Text(
                                          '${_counterController.count}',
                                          style: TextStyle(fontSize: 18),
                                        )),
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: _counterController.increment,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.add_shopping_cart),
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    Map<String, dynamic> produkInfo =
                                        _counterController.getCheckout();

                                    // Check if selectedColors or count is null or empty
                                    if (produkInfo['selectedColors'] == null &&
                                        produkInfo['count'] == null &&
                                        (produkInfo['selectedColors'] as List)
                                            .isEmpty &&
                                        produkInfo['count'] <= 0) {
                                      // Show Snackbar with a message
                                      Get.snackbar(
                                        'Error',
                                        'Please select colors and specify a quantity greater than zero.',
                                        snackPosition: SnackPosition.BOTTOM,
                                        duration: Duration(seconds: 3),
                                      );
                                      return; // Prevent navigation if conditions are not met
                                    }

                                    print(
                                        "Navigating to checkout with produkInfo: $produkInfo");

                                    // Get existing instance of CheckoutController
                                    CheckoutController checkoutController =
                                        Get.find();

                                    // Set the produkInfo
                                    checkoutController
                                        .setProdukInfo(produkInfo);

                                    // Wait for the data to be set before navigating to checkout
                                    await Future.delayed(Duration.zero);

                                    Get.toNamed(Routes.CHECKOUT);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFCE9018),
                                    foregroundColor: Colors.white,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 24, vertical: 0),
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                    ),
                                  ),
                                  child: Container(
                                    width: 250,
                                    height: 40,
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Pesan Sekarang',
                                      style: GoogleFonts.readexPro(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              offset: const Offset(0, 0),
              alignment: Alignment.bottomCenter,
              useSafeArea: true,
            );
          },
          child: Icon(Icons.shopping_cart_checkout_rounded)),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: bottomNavBarItems,
      //   onTap: (index) {
      //     // Tambahkan logika untuk menangani interaksi bottom navigation bar di sini
      //     if (index == 0) {
      //       // Jika item pertama (Checkout) diklik, navigasikan ke halaman checkout
      //       Get.toNamed(Routes.CHECKOUT, arguments: checkoutData);
      //     }
      //   },
      // ),
    );
  }

  // final List<BottomNavigationBarItem> bottomNavBarItems = [
  //   BottomNavigationBarItem(
  //     icon: Icon(Icons.chat),
  //     label: '',
  //   ),
  //   BottomNavigationBarItem(
  //     icon: Icon(Icons.shopping_cart),
  //     label: '',
  //   ),
  //   BottomNavigationBarItem(
  //     icon: Icon(Icons.shopping_cart_checkout),
  //     label: 'Beli Sekarang',
  //   ),
  // ];
}
