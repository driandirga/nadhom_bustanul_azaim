import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/bookmark_model.dart';
import '../models/isi_model.dart';
import '../models/kategori_model.dart';

class DBProvider {
  static final DBProvider db = DBProvider._();
  static Database? _database;

  DBProvider._();

  final String _databaseName = 'bustanul.db';
  final int _databaseVersion = 1;

  //tb_kategori
  final String tbKategori = 'tb_kategori';
  final String idKategori = 'id_kategori';
  final String namaKategori = 'nama_kategori';

  //tb_kategori_detail
  final String tbIsi = 'tb_isi';
  final String idIsi = 'id_isi';
  final String isiDt = 'isi_dt';
  final String idKategoriFk = 'id_kategori';

  //tb_bookmark
  final String tbBookmark = 'tb_bookmark';
  final String idBookmark = 'id_bookmark';
  final String idIsiFk = 'id_isi';

  Future<Database> get database async {
    // If database exists, return database
    if (_database != null) return _database!;

    // If database don't exists, create one
    _database = await _initDatabase();

    return _database!;
  }

  Future _initDatabase() async {
    Directory docDirectory = await getApplicationDocumentsDirectory();
    String path = p.join(docDirectory.path, _databaseName);
    return openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  //CREATE TABLE
  Future _onCreate(Database db, int version) async {
    final dynamic cSqlKategori =
        'CREATE TABLE $tbKategori ($idKategori INTEGER PRIMARY KEY, $namaKategori TEXT NOT NULL)';
    final dynamic cSqlIsi =
        'CREATE TABLE $tbIsi ($idIsi INTEGER PRIMARY KEY, $isiDt TEXT NOT NULL, $idKategoriFk INTEGER NOT NULL, FOREIGN KEY ($idKategoriFk) REFERENCES $tbKategori ($idKategoriFk))';
    final dynamic cSqlBookmark =
        'CREATE TABLE $tbBookmark ($idBookmark INTEGER PRIMARY KEY, $idIsiFk INTEGER NULL, FOREIGN KEY ($idIsiFk) REFERENCES $tbIsi ($idIsiFk))';

    await db.execute(cSqlKategori);
    await db.execute(cSqlIsi);
    await db.execute(cSqlBookmark);
  }

  //CREATE
  Future<int> createKategori(KategoriModel newKategori) async {
    await deleteKategori();
    final res = await _database!.insert(tbKategori, newKategori.toJson());
    return res;
  }

  Future<int> createIsi(IsiModel newIsi) async {
    await deleteIsi();
    final res = await _database!.insert(tbIsi, newIsi.toJson());
    return res;
  }

  Future<int> createBookmark(Map<String, dynamic> row) async {
    final res = await _database!.insert(tbBookmark, row);
    return res;
  }

  //READ
  Future<List<KategoriModel>> getAllKategori() async {
    final db = await database;
    final res = await db.rawQuery('SELECT * FROM $tbKategori');

    List<KategoriModel> list = res.isNotEmpty
        ? res.map((c) => KategoriModel.fromJson(c)).toList()
        : [];
    return list;
  }

  Future<List<IsiModel>> getAllIsi(String newId) async {
    final db = await database;
    final res = await db.rawQuery('SELECT * FROM $tbIsi WHERE $idIsi=$newId');

    List<IsiModel> list =
        res.isNotEmpty ? res.map((c) => IsiModel.fromJson(c)).toList() : [];
    return list;
  }

  Future<List<BookmarkModel>> getAllBookmark() async {
    final dynamic sql = 'SELECT * FROM $tbBookmark';
    final data = await _database!.rawQuery(sql);

    List<BookmarkModel> list = data.isNotEmpty
        ? data.map((c) => BookmarkModel.fromJson(c)).toList()
        : [];
    return list;
  }

  Future<List<KategoriModel>> getGblBookmark() async {
    final dynamic sql =
        'SELECT K.$namaKategori FROM $tbBookmark B,$tbIsi I,$tbKategori K WHERE B.$idIsiFk=I.$idIsi AND K.$idKategori=I.$idKategoriFk';
    final data = await _database!.rawQuery(sql);

    List<KategoriModel> list = data.isNotEmpty
        ? data.map((c) => KategoriModel.fromJson(c)).toList()
        : [];
    return list;
  }

  //DELETE
  Future<int> deleteKategori() async {
    final dynamic sql = 'DELETE FROM $tbKategori';
    final query = await _database!.rawDelete(sql);
    return query;
  }

  Future<int> deleteIsi() async {
    final dynamic sql = 'DELETE FROM $tbIsi';
    final query = await _database!.rawDelete(sql);
    return query;
  }

  Future<int> deleteBookmark() async {
    final dynamic sql = 'DELETE FROM $tbBookmark';
    final query = await _database!.rawDelete(sql);
    return query;
  }

  Future<int> deleteDtlBookmark(String newId) async {
    final dynamic sql = 'DELETE FROM $tbBookmark WHERE $idBookmark=$newId';
    final query = await _database!.rawDelete(sql);
    return query;
  }

  Future<int> deleteIsiBookmark(String newId) async {
    final dynamic sql = 'DELETE FROM $tbBookmark WHERE $idIsi=$newId';
    final query = await _database!.rawDelete(sql);
    return query;
  }

  Future<void> deleteDatabase() async {
    Directory docDirectory = await getApplicationDocumentsDirectory();
    String path = p.join(docDirectory.path, _databaseName);
    databaseFactory.deleteDatabase(path);
  }
}
