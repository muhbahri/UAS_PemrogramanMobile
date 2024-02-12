import 'package:dianminimotor/app/controllers/auth_controller.dart';
import 'package:dianminimotor/app/modules/pesanan/views/pesanan_view.dart';
import 'package:dianminimotor/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/profil_controller.dart';

class ProfilView extends GetView<ProfilController> {
  final authC = Get.find<AuthController>();
  ProfilView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181818),
      appBar: AppBar(
        backgroundColor: Color(0xFF121212),
        title: Text(
          'Profil Saya',
          style: GoogleFonts.outfit(color: Colors.white, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: Align(
        alignment: AlignmentDirectional(0, -1),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Stack(
                  alignment: AlignmentDirectional(1.3, 1.3),
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1534308143481-c55f00be8bd7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyNHx8ZGVmYXVsdCUyMHByb2ZpbGUlMjBwaWN0dXJlfGVufDB8fHx8MTcwMTA0MzU3MXww&ixlib=rb-4.0.3&q=80&w=1080',
                        width: 130,
                        height: 130,
                        fit: BoxFit.cover,
                      ),
                    ),
                    IconButton(
                        iconSize: 45,
                        color: Colors.white,
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 35,
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 30),
                child: Text(
                  'Muhamad Bahri',
                  style: GoogleFonts.readexPro(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 10,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                    color: Color(0xFF212121),
                    width: 344,
                    height: 140,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person_2_rounded,
                            color: Colors.white, size: 40),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Profil Saya',
                          style: GoogleFonts.readexPro(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.toNamed(Routes.PESANAN);
                      },
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: 10,
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          color: Color(0xFF212121),
                          width: 165,
                          height: 140,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.assignment,
                                  color: Colors.white, size: 40),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Pemesanan',
                                style: GoogleFonts.readexPro(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: 10,
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          color: Color(0xFF212121),
                          width: 165,
                          height: 140,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.settings,
                                  color: Colors.white, size: 40),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Pengaturan',
                                style: GoogleFonts.readexPro(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Colors.red,
                  ),
                ),
                onPressed: () => authC.logout(),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    'LOGOUT',
                    style: GoogleFonts.readexPro(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
