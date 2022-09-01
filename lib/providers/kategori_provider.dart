import 'dart:convert';

import 'package:flutter/services.dart';
import '../models/kategori_model.dart';
import '../modules/db_instance.dart';

class KategoriApiProvider {
  Future<List<KategoriModel?>> getAllKategori() async {
    final String response =
        await rootBundle.loadString('assets/data/kategori.json');

    final data = await json.decode(response);

    return (data as List).map((e) {
      DBProvider.db.createKategori(KategoriModel.fromJson(e));
    }).toList();
  }
}
