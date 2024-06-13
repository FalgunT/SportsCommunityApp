class EventModel {
  /*id INTEGER PRIMARY KEY AUTOINCREMENT, EventName TEXT,EventDesc TEXT, EventAddress TEXT, EventTime DATETIME, CreatedBy INTEGER,CreatedDate DATETIME*/
  late int id;
  late String EventName;
  late String EventAddress;
  late DateTime EventTime;
  late int CreatedBy; //user id will come here
  late DateTime CreatedDate;
  EventModel.empty();
  EventModel(
      {required this.id,
      required this.EventName,
      required this.EventAddress,
      required this.EventTime,
      required this.CreatedBy,
      required this.CreatedDate});

  factory EventModel.fromMap(Map<dynamic, dynamic> json) {
    return EventModel(
      id: json['id'],
      EventName: json['EventName'],
      EventAddress: 'EventAddress',
      EventTime: json['EventTime'],
      CreatedBy: json['CreatedBy'],
      CreatedDate: json['CreatedDate'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'EventName': EventName,
      'EventAddress': EventAddress,
      'EventTime': EventTime,
      'CreatedBy': CreatedBy,
      'CreatedDate': CreatedDate,
    };
  }
}
