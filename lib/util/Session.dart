import '../app/data/model/usermodel.dart';

class Session {
  static final Session obj = Session._internal();

  factory Session() {
    return obj;
  }

  var user = UsersModel.empty();

  Session._internal();
}
