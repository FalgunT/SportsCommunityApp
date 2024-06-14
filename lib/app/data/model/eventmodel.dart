class EventModel {
  /*id INTEGER PRIMARY KEY AUTOINCREMENT, EventName TEXT,EventDesc TEXT, EventAddress TEXT, EventTime DATETIME, CreatedBy INTEGER,CreatedDate DATETIME*/
  int? id;
  late String EventName;
  late String EventAddress;
  late String EventDesc;
  late int EventTime;
  late int CreatedBy; //user id will come here
  late int CreatedDate;

  EventModel.empty();

  EventModel(
      {this.id,
      required this.EventName,
      required this.EventDesc,
      required this.EventAddress,
      required this.EventTime,
      required this.CreatedBy,
      required this.CreatedDate});

  factory EventModel.fromMap(Map<dynamic, dynamic> json) {
    return EventModel(
      id: json['id'],
      EventName: json['EventName'],
      EventDesc: json['EventDesc'],
      EventAddress: json['EventAddress'],
      EventTime: json['EventTime'],
      CreatedBy: json['CreatedBy'],
      CreatedDate: json['CreatedDate'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'EventName': EventName,
      'EventDesc': EventDesc,
      'EventAddress': EventAddress,
      'EventTime': EventTime,
      'CreatedBy': CreatedBy,
      'CreatedDate': CreatedDate,
    };
  }
}
