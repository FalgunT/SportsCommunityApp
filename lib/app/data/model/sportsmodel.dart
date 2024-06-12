class SportsModel {
  late int id;
  late String name;

  SportsModel({required this.id, required this.name});

  factory SportsModel.fromMap(Map<dynamic, dynamic> json) {
    return SportsModel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}
