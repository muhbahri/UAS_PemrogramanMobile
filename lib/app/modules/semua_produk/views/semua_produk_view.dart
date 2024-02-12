import 'package:dianminimotor/app/controllers/auth_controller.dart';
import 'package:dianminimotor/app/routes/app_pages.dart';
import 'package:dianminimotor/app/utils/selected_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/semua_produk_controller.dart';

class SemuaProdukView extends GetView<SemuaProdukController> {
  SemuaProdukView({Key? key}) : super(key: key);
  final authC = Get.find<AuthController>();
  final SemuaProdukController controller = Get.find();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
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
      body: Column(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 15, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 320,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0x00FFFFFF),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SelectedButton(controller, -1, 'Semua'),
                          SizedBox(width: 10),
                          SelectedButton(controller, 0, 'Motor Listrik'),
                          SizedBox(width: 10),
                          SelectedButton(controller, 1, 'Mobil Listrik'),
                          SizedBox(width: 10),
                          SelectedButton(controller, 2, 'Sepeda Listrik'),
                        ],
                      ),
                    ),
                  ),
                ),
                Text(
                  'Filter',
                  style:
                      GoogleFonts.readexPro(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
          Container(
            height: 620,
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Rp. ${(listAllData[index].data() as Map<String, dynamic>)["harga"]}',
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
    );
  }
}
