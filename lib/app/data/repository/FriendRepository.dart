import 'package:sportcommunityapp/app/data/model/friendmodel.dart';
import 'package:sportcommunityapp/app/data/model/usermodel.dart';

import '../local/db/DBHelper.dart';
import '../local/db/dbScript.dart';

class FriendRepository {
  DBHelper dbHelper = DBHelper();

  Future<List<FriendModel>> getFriends() async {
    var dbClient = await dbHelper.db;
    List<Map> maps = await dbClient
        .query(dbScript.FriendsTable, where: "isAccepted=?", whereArgs: [1]);
    List<FriendModel> student = [];
    for (int i = 0; i < maps.length; i++) {
      student.add(FriendModel.fromMap(maps[i]));
    }
    return student;
  }

  Future<List<FriendModel>> getPendingFriends(int uid) async {
    var dbClient = await dbHelper.db;
    List<Map> maps = await dbClient.query(dbScript.FriendsTable,
        where: "isAccepted=? and FriendUserID=?", whereArgs: [-1, uid]);
    List<FriendModel> student = [];
    for (int i = 0; i < maps.length; i++) {
      student.add(FriendModel.fromMap(maps[i]));
    }
    return student;
  }

  Future<FriendModel> getFriendbyId(int id) async {
    var dbClient = await dbHelper.db;
    List<Map> maps = await dbClient
        .query(dbScript.FriendsTable, where: "id = ?", whereArgs: [id]);
    FriendModel user = FriendModel.fromMap(maps[0]);
    return user;
  }

  Future<int> add(FriendModel studentModel) async {
    var dbClient = await dbHelper.db;
    return await dbClient.insert(dbScript.FriendsTable, studentModel.toMap());
  }

  Future<int> update(FriendModel studentModel) async {
    var dbClient = await dbHelper.db;
    return await dbClient.update(dbScript.FriendsTable, studentModel.toMap(),
        where: 'id = ?', whereArgs: [studentModel.id]);
  }

  Future<int> delete(int id) async {
    var dbClient = await dbHelper.db;
    return await dbClient
        .delete(dbScript.FriendsTable, where: 'id = ?', whereArgs: [id]);
  }
}
