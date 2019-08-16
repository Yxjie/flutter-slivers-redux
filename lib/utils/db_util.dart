import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'util_index.dart';

///数据库 工具类
class DBUtil {
  static final String tag = 'DBUtil';

  ///判断数据库是否存在 true：存在 false：不存在
  static Future<bool> isDBExist(String dbName) async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, dbName);

    Database db = await openDatabase(path);
    return db != null;
  }

  ///创建数据库
  static createDB(String dbName, int dbVersion, String createdTable) async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, dbName);

    await openDatabase(path, version: dbVersion,
        onUpgrade: (Database base, int oldVersion, int newVersion) {
      DebugLogUtil.printLog('数据库升级：旧版本=$oldVersion,新版本=$newVersion', tag: tag);
    }, onCreate: (Database db, int version) async {
      await db.execute(createdTable);
      await db.close();
      DebugLogUtil.printLog('数据库创建成功：\n数据库路径：$path,\n数据库版本：$dbVersion',
          tag: tag);
    });
  }

  ///插入数据
  static add(String dbName, String sql) async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, dbName);

    Database db = await openDatabase(path);
    await db.transaction((txn) async {
      int count = await txn.rawInsert(sql);
      if (count > 0) {
        DebugLogUtil.printLog('插入数据成功！', tag: tag);
      }
    });
    await db.close();
  }

  ///删除数据
  static delete(String dbName, String sql) async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, dbName);

    Database db = await openDatabase(path);
    int count = await db.rawDelete(sql);
    await db.close();
    if (count > 0) {
      DebugLogUtil.printLog('删除数据成功！sql条件对应删除数目：$count', tag: tag);
    } else {
      DebugLogUtil.printLog('删除数据失败！sql语句：$sql', tag: tag);
    }
  }

  ///更新数据
  static update(String dbName, String sql, List arg) async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, dbName);

    Database db = await openDatabase(path);
    int count = await db.rawUpdate(sql, arg); //修改条件，对应参数值
    await db.close();
    if (count > 0) {
      DebugLogUtil.printLog('更新数据成功！sql条件对应删除数目：$count', tag: tag);
    } else {
      DebugLogUtil.printLog('更新数据失败！sql语句：$sql', tag: tag);
    }
  }

  ///查询数据
  static Future<List<Map>> query(String dbName, String sql) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, dbName);

    Database db = await openDatabase(path);
    List<Map> list = await db.rawQuery(sql);
    await db.close();
    if (list != null && list.length != 0) {
      DebugLogUtil.printLog('查询数据成功：$list', tag: tag);
    } else {
      DebugLogUtil.printLog('查询数据失败！sql语句：$sql', tag: tag);
    }
    return list;
  }
}
