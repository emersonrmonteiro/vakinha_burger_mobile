import 'package:get/instance_manager.dart';

import '../rest_client/rest_client.dart';
import '../services/shopping_card_service.dart';

class Applicationbinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => RestClient(),
      fenix: true,
    );
    Get.lazyPut(() => ShoppingCardService());
  }
}
