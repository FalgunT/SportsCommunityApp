class FriendModel {
  late int id, UserID, FriendUserID;
  late bool isInvited;
  late int isAccepted;

  FriendModel(
      {required this.id,
      required this.UserID,
      required this.FriendUserID,
      required this.isInvited,
      required this.isAccepted});

  factory FriendModel.fromMap(Map<dynamic, dynamic> json) {
    return FriendModel(
      id: json['id'],
      UserID: json['UserID'],
      FriendUserID: json['FriendUserID'],
      isInvited: json['isInvited']== 1 ? true : false,
      isAccepted: json['isAccepted'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'UserID': UserID,
      'FriendUserID': FriendUserID,
      'isInvited': isInvited,
      'isAccepted': isAccepted,
    };
  }
}
