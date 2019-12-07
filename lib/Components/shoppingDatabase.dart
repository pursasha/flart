import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

import 'Deal.dart';

class DealDB {
  DealDB._();
  static final DealDB db = DealDB._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await openDB();
    return _database;
  }

  Future<Database> openDB() async {
    var databasesPath = await getDatabasesPath();
    return await openDatabase(
      join(databasesPath, 'deals.db'),
      onOpen: (db) async {},
      onCreate: (db, version) async {
        var batch = db.batch();
        _createDealTable(batch);

        await batch.commit(noResult: true);
      },
      version: 1,
    );
  }

  void _createDealTable(Batch batch) {
    batch.execute('DROP TABLE IF EXISTS deals');
    batch.execute('''
    CREATE TABLE deals (
      id INTEGER PRIMARY KEY AUTOINCREMENT, 
      store TEXT,
      have INTEGER,
      item TEXT,
      coupon TEXT
    )''');
  }

  Future<int> insertDeal(Deal deal) async {
    final Database db = await openDB();

    if (deal.store == '' || deal == null) {
      return 402;
    }
    await db.insert('deals', deal.toMap());

    return 200;
  }

  Future<List<Deal>> deals() async {
    final Database db = await openDB();

    final List<Map<String, dynamic>> maps = await db.query('deals');

    return List.generate(maps.length, (i) {
      List<Coupon> coupons = [];
      // print(maps[i]['coupon']);
      maps[i]['coupon'].toString().split(',').forEach((coupon) {
        coupon.split('title: ').forEach((coupon) {
          // print(coupon);
          if (coupon == '' || coupon == '[' || coupon == ']') {
          } else {
            if (coupon != " ") coupons.add(Coupon(coupon));
          }
        });
      });
      return Deal(maps[i]['store'], (maps[i]['have'] == 1 ? true : false),
          Item(maps[i]['item'], coupons), maps[i]['id']);
    });
  }

  void haveDeal(int id, bool have) async {
    final db = await openDB();

    await db.update('deals', {'have': (have == true ? 1 : 0)},
        where: "id = ?", whereArgs: [id]);
  }

  Future<void> deleteDeal(String store) async {
    final db = await openDB();

    await db.delete("deals", where: "store = ?", whereArgs: [store]);
  }

  void removeAllDeals() async {
    final db = await openDB();

    await db.execute("DELETE FROM deals");
  }
}
