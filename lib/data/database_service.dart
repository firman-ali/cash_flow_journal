import 'package:cash_flow_journal/model/cash_flow.dart';
import 'package:cash_flow_journal/model/chart.dart';
import 'package:path/path.dart' show join;
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static DatabaseService? _databaseHelper;
  static late Database _database;

  DatabaseService._internal() {
    _databaseHelper = this;
  }

  factory DatabaseService() => _databaseHelper ?? DatabaseService._internal();

  Future<Database> get database async {
    _database = await _initializeDb();
    return _database;
  }

  static const String _tableCashFlow = 'cash_flow';

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      join(path, 'cash_flow.db'),
      onCreate: (db, version) async {
        await db.execute(
          '''CREATE TABLE $_tableCashFlow (
               id TEXT PRIMARY KEY,
               cashFlowType TEXT, categoryType TEXT, amount REAL, description TEXT
             )''',
        );
      },
      version: 1,
    );
    return db;
  }

  Future<void> insertData(CashFlow cashFlowData) async {
    final Database db = await database;
    await db.insert(_tableCashFlow, cashFlowData.toJson());
  }

  Future<List<CashFlow>> getAllData() async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(_tableCashFlow);

    return results.map((res) => CashFlow.fromJson(res)).toList();
  }

  Future<void> deleteData(String id) async {
    final db = await database;

    await db.delete(
      _tableCashFlow,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<StatisticData>> getStatisticData() async {
    final Database db = await database;
    List<Map> result = await db.rawQuery(
        'SELECT cashFlowType,SUM(amount) as amount FROM $_tableCashFlow GROUP BY cashFlowType');

    return result
        .map((res) => StatisticData(
            cashFlowType: res['cashFlowType'], amount: res['amount']))
        .toList();
  }
}
