import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference produks = firestore.collection('produks');

    return produks.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference produks = firestore.collection('produks');

    return produks.snapshots();
  }

  Stream<List<Map<String, String>>> streamDistinctKategori() {
    return FirebaseFirestore.instance
        .collection('produks')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs
          .fold<Map<String, String>>({}, (uniqueData, doc) {
            var kategori = doc['kategori'] as String?;
            var gambar = doc['gambar'] as String?;

            if (kategori != null && gambar != null) {
              // Menambahkan data kategori dan gambar ke dalam Map
              uniqueData[kategori] = gambar;
            }

            return uniqueData;
          })
          .entries
          .map((entry) {
            return {'kategori': entry.key, 'gambar': entry.value};
          })
          .toList();
    });
  }
}
