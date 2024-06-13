import 'package:sqflite/sqflite.dart';

class dbScript {
  static const String SportsTable = 'Sports';
  static const String UserTable = 'Users';
  static const String UserSportsTable = 'Users_Sports';
  static const String FriendsTable = 'Friends';
  static const String EventsTable = 'Events';

  runScript(Database db) {
    //creation of table
    db.execute("CREATE TABLE $SportsTable (id INTEGER PRIMARY KEY, name TEXT)");
    db.execute(
        "CREATE TABLE $UserTable (id INTEGER PRIMARY KEY AUTOINCREMENT, Name TEXT, Age INTEGER, Gender TEXT, Address TEXT,ContactNo TEXT)");
    db.execute(
        "CREATE TABLE $UserSportsTable (id INTEGER PRIMARY KEY AUTOINCREMENT, UserID INTEGER, SportsID INTEGER)");

    db.execute(
        "CREATE TABLE $FriendsTable (id INTEGER PRIMARY KEY AUTOINCREMENT, UserID INTEGER, FriendUserID INTEGER, isInvited BOOLEAN, isAccepted INTEGER)");

    db.execute(
        "CREATE TABLE $EventsTable (id INTEGER PRIMARY KEY AUTOINCREMENT, EventName TEXT,EventDesc TEXT, EventAddress TEXT, EventTime BIGINT, CreatedBy INTEGER,CreatedDate BIGINT)");

    //insert defaults
    //sports
    db.execute("INSERT INTO  $SportsTable (name) VALUES ( 'Football');");
    db.execute("INSERT INTO  $SportsTable (name) VALUES ( 'Cricket');");
    db.execute("INSERT INTO  $SportsTable (name) VALUES ( 'Tennis');");
    db.execute("INSERT INTO  $SportsTable (name) VALUES ( 'Hockey');");
    db.execute("INSERT INTO  $SportsTable (name) VALUES ( 'Badminton');");

    db.execute(
        "INSERT INTO  $UserTable (Name, Age,Gender,Address,ContactNo) VALUES ('Adam',21,'M','593 Imogene Via, West Jorge, ND 73892-6395','');");
    db.execute(
        "INSERT INTO  $UserTable (Name, Age,Gender,Address,ContactNo) VALUES ('Amy',25,'F','Suite 229 721 Will Landing, Lake Tayna, AR 13807-5063','');");
    db.execute(
        "INSERT INTO  $UserTable (Name, Age,Gender,Address,ContactNo) VALUES ('Angela',23,'F','Suite 872 696 Kassulke Manor, South Helaine, MO 79141-6153','');");
    db.execute(
        "INSERT INTO  $UserTable (Name, Age,Gender,Address,ContactNo) VALUES ('Benjamin',21,'M','Apt. 381 4660 Hagenes Forest, New Elden, WV 94799','');");
    db.execute(
        "INSERT INTO  $UserTable (Name, Age,Gender,Address,ContactNo) VALUES ('Cameron',22,'M','15680 Christiane Trail, Kohlerside, MN 96332','');");
    db.execute(
        "INSERT INTO  $UserTable (Name, Age,Gender,Address,ContactNo) VALUES ('Dan',23,'M','582 Zemlak Summit, East Lena, PA 82963-0512','');");
    db.execute(
        "INSERT INTO  $UserTable (Name, Age,Gender,Address,ContactNo) VALUES ('Emily',23,'F','Apt. 677 23184 Stanton Corners, Kihnton, OR 93982','');");
    db.execute(
        "INSERT INTO  $UserTable (Name, Age,Gender,Address,ContactNo) VALUES ('Ryan',25,'M','751 Simonis Squares, Port Mason, FL 27362-3392','');");
    db.execute(
        "INSERT INTO  $UserTable (Name, Age,Gender,Address,ContactNo) VALUES ('Tim',27,'M','Suite 786 89263 Ankunding River, Garthfurt, KS 90225-9427','');");
    db.execute(
        "INSERT INTO  $UserTable (Name, Age,Gender,Address,ContactNo) VALUES ('Una',21,'F','Apt. 129 23192 Danis Corners, Kihnton, OR 93982','');");

    db.execute(
        "INSERT INTO  $UserSportsTable (UserID,SportsID) VALUES ( 1,2);");
    db.execute(
        "INSERT INTO  $UserSportsTable (UserID,SportsID) VALUES ( 1,3);");
    db.execute(
        "INSERT INTO  $UserSportsTable (UserID,SportsID) VALUES ( 2,2);");
    db.execute(
        "INSERT INTO  $UserSportsTable (UserID,SportsID) VALUES ( 2,1);");
    db.execute(
        "INSERT INTO  $UserSportsTable (UserID,SportsID) VALUES ( 3,4);");

    db.execute(
        "INSERT INTO  $FriendsTable (UserID,FriendUserID,isInvited,isAccepted) VALUES ( 1,2,true,1);");
    db.execute(
        "INSERT INTO  $FriendsTable (UserID,FriendUserID,isInvited,isAccepted) VALUES ( 1,3,true,-1);");
    db.execute(
        "INSERT INTO  $FriendsTable (UserID,FriendUserID,isInvited,isAccepted) VALUES ( 1,4,true,0);");
    db.execute(
        "INSERT INTO  $FriendsTable (UserID,FriendUserID,isInvited,isAccepted) VALUES ( 1,5,true,-1);");
    db.execute(
        "INSERT INTO  $FriendsTable (UserID,FriendUserID,isInvited,isAccepted) VALUES ( 1,6,true,1);");
    db.execute(
        "INSERT INTO  $FriendsTable (UserID,FriendUserID,isInvited,isAccepted) VALUES ( 9,1,true,-1);");
    db.execute(
        "INSERT INTO  $FriendsTable (UserID,FriendUserID,isInvited,isAccepted) VALUES ( 8,1,true,-1);");
    db.execute(
        "INSERT INTO  $FriendsTable (UserID,FriendUserID,isInvited,isAccepted) VALUES ( 7,1,true,-1);");
    db.execute(
        "INSERT INTO  $FriendsTable (UserID,FriendUserID,isInvited,isAccepted) VALUES ( 10,1,true,-1);");

    db.execute(
        "INSERT INTO  $EventsTable (EventName,EventDesc,EventAddress,EventTime,CreatedBy,CreatedDate) "
        "VALUES ( 'Football Practice','Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century.'"
        ",'15680 Christiane Trail, Kohlerside, MN 960023',1719233460000,1,1718283003502)");
    db.execute(
        "INSERT INTO  $EventsTable (EventName,EventDesc,EventAddress,EventTime,CreatedBy,CreatedDate) "
        "VALUES ( 'Football Practice','Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century.'"
        ",'15680 Christiane Trail, Kohlerside, MN 960023',1719319860000,1,1718283003502)");
    db.execute(
        "INSERT INTO  $EventsTable (EventName,EventDesc,EventAddress,EventTime,CreatedBy,CreatedDate) "
        "VALUES ( 'Football Practice','Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century.'"
        ",'15680 Christiane Trail, Kohlerside, MN 960023',1719406260000,1,1718283003502)");

    //creation of indexes
    //insert defaults
  }
}
