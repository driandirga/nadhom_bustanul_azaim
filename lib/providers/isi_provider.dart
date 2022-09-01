import 'dart:convert';

import 'package:flutter/services.dart';
import '../models/isi_model.dart';
import '../modules/db_instance.dart';

class IsiApiProvider {
  Future<List<IsiModel?>> getAllIsi() async {
    final String response =
        await rootBundle.loadString('assets/data/kategori_dt.json');

    final data = await json.decode(response);

    return (data as List).map((e) {
      DBProvider.db.createIsi(IsiModel.fromJson(e));
    }).toList();
  }
}
