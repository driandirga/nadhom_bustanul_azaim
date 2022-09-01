import 'dart:convert';

List<KategoriModel> kategoriFromJson(String str) => List<KategoriModel>.from(
    json.decode(str).map((x) => KategoriModel.fromJson(x)));

String kategoriToJson(List<KategoriModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KategoriModel {
  int? idKategori;
  String? namaKategori;

  KategoriModel({this.idKategori, this.namaKategori});

  factory KategoriModel.fromJson(Map<String, dynamic> json) {
    return KategoriModel(
      idKategori: json['id_kategori'],
      namaKategori: json['nama_kategori'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id_kategori": idKategori,
        "nama_kategori": namaKategori,
      };
}
