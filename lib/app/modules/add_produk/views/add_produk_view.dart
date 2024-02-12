import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_produk_controller.dart';

class AddProdukView extends GetView<AddProdukController> {
  const AddProdukView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tambah Data Produk'),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(50),
          child: Column(
            children: [
              TextField(
                controller: controller.namaC,
                autocorrect: false,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(labelText: "Nama Produk"),
              ),
              TextField(
                controller: controller.hargaC,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(labelText: "Harga Produk"),
              ),
              SizedBox(
                height: 50,
              ),
              TextButton(
                  onPressed: () => controller.AddProduk(
                      controller.namaC.text, controller.hargaC.text),
                  child: Text('Tambah Data'))
            ],
          ),
        ));
  }
}
