import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:sportcommunityapp/app/bindings/repository_bindings.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    RepositoryBindings().dependencies();
  }
}
