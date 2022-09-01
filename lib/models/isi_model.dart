import 'dart:convert';

List<IsiModel> isiFromJson(String str) =>
    List<IsiModel>.from(json.decode(str).map((x) => IsiModel.fromJson(x)));

String isiToJson(List<IsiModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class IsiModel {
  int? idIsi;
  String? isiDt;
  String? idKategori;

  IsiModel({this.idIsi, this.isiDt, this.idKategori});

  factory IsiModel.fromJson(Map<String, dynamic> json) {
    return IsiModel(
      idIsi: json['id_isi'],
      isiDt: json['isi_dt'],
      idKategori: json['id_kategori'].toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id_isi': idIsi,
        'isi_dt': isiDt,
        'id_kategori': idKategori,
      };
}
