import 'package:get/get.dart';

import '../../core/services/auth_service.dart';

class Splashcontroller extends GetxController {
  void checkLogged() {
    Get.putAsync(() => AuthService().init());
  }
}
