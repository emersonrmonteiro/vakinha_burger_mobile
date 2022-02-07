import 'package:get/instance_manager.dart';

import '../../../repositories/auth/auth_repository.dart';
import '../../../repositories/auth/auth_repository_imp.dart';
import 'register_controller.dart';

class RegisterBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(
        restClient: Get.find(),
      ),
    );
    Get.lazyPut(
      () => RegisterController(authRepository: Get.find()),
    );
  }
}
