import 'dart:convert';

List<BookmarkModel> isiFromJson(String str) => List<BookmarkModel>.from(
    json.decode(str).map((x) => BookmarkModel.fromJson(x)));

String isiToJson(List<BookmarkModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BookmarkModel {
  int? idBookmark;
  String? idIsi;

  BookmarkModel({this.idBookmark, this.idIsi});

  factory BookmarkModel.fromJson(Map<String, dynamic> json) {
    return BookmarkModel(
      idBookmark: json['id_bookmark'],
      idIsi: json['id_isi'].toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id_bookmark': idBookmark,
        'id_isi': idIsi,
      };
}
