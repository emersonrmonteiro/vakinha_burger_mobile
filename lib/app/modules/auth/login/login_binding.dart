import 'package:get/instance_manager.dart';
import 'package:vakinha_burger_mobile/app/repositories/auth/auth_repository.dart';
import 'package:vakinha_burger_mobile/app/repositories/auth/auth_repository_imp.dart';

import 'login_controller.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(
        restClient: Get.find(),
      ),
    );
    Get.lazyPut(
      () => LoginController(authRepository: Get.find()),
    );
  }
}
