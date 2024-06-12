import '../local/db/dbScript.dart';

class UsersModel {
  late int id;
  late String Name;
  late int Age;
  late String Gender;
  late String Address;
  late String ContactNo;

  UsersModel(
      {required this.id,
      required this.Name,
      required this.Age,
      required this.Gender,
      required this.Address,
      required this.ContactNo});

  factory UsersModel.fromMap(Map<dynamic, dynamic> json) {
    return UsersModel(
      id: json['id'],
      Name: json['Name'],
      Age: json['Age'],
      Gender: json['Gender'],
      Address: json['Address'],
      ContactNo: json['ContactNo'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'Name': Name,
      'Age': Age,
      'Gender': Gender,
      'Address': Address,
      'ContactNo': ContactNo,
    };
  }
}
