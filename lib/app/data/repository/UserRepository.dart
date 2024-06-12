import 'package:sportcommunityapp/app/data/model/usermodel.dart';

import '../local/db/DBHelper.dart';
import '../local/db/dbScript.dart';

class UserRepository {
  DBHelper dbHelper = DBHelper();

  Future<List<UsersModel>> getUser() async {
    var dbClient = await dbHelper.db;
    List<Map> maps =
        await dbClient.query(dbScript.UserTable);
    List<UsersModel> student = [];
    for (int i = 0; i < maps.length; i++) {
      student.add(UsersModel.fromMap(maps[i]));
    }
    return student;
  }

  Future<int> add(UsersModel studentModel) async {
    var dbClient = await dbHelper.db;
    return await dbClient.insert(dbScript.UserTable, studentModel.toMap());
  }

  Future<int> update(UsersModel studentModel) async {
    var dbClient = await dbHelper.db;
    return await dbClient.update(dbScript.UserTable, studentModel.toMap(),
        where: 'id = ?', whereArgs: [studentModel.id]);
  }

  Future<int> delete(int id) async {
    var dbClient = await dbHelper.db;
    return await dbClient
        .delete(dbScript.UserTable, where: 'id = ?', whereArgs: [id]);
  }
}
