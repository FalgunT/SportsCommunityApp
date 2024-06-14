import 'package:sportcommunityapp/app/data/model/eventmodel.dart';
import 'package:sportcommunityapp/app/data/model/friendmodel.dart';
import 'package:sportcommunityapp/app/data/model/usermodel.dart';

import '../local/db/DBHelper.dart';
import '../local/db/dbScript.dart';

class EventRepository {
  DBHelper dbHelper = DBHelper();

  Future<List<EventModel>> getAllEvent() async {
    var dbClient = await dbHelper.db;
    List<Map> maps = await dbClient.query(dbScript.EventsTable,orderBy: 'EventTime' );
    List<EventModel> student = [];
    for (int i = 0; i < maps.length; i++) {
      student.add(EventModel.fromMap(maps[i]));
    }
    return student;
  }

  Future<List<EventModel>> getAllEventByUserId(int uid) async {
    var dbClient = await dbHelper.db;
    List<Map> maps = await dbClient
        .query(dbScript.EventsTable, where: "CreatedBy=? ", whereArgs: [uid]);
    List<EventModel> student = [];
    for (int i = 0; i < maps.length; i++) {
      student.add(EventModel.fromMap(maps[i]));
    }
    return student;
  }

  Future<int> add(EventModel event) async {
    var dbClient = await dbHelper.db;
    return await dbClient.insert(dbScript.EventsTable, event.toMap());
  }

  Future<int> update(EventModel studentModel) async {
    var dbClient = await dbHelper.db;
    return await dbClient.update(dbScript.EventsTable, studentModel.toMap(),
        where: 'id = ?', whereArgs: [studentModel.id]);
  }

  Future<int> delete(int id) async {
    var dbClient = await dbHelper.db;
    return await dbClient
        .delete(dbScript.EventsTable, where: 'id = ?', whereArgs: [id]);
  }
}
