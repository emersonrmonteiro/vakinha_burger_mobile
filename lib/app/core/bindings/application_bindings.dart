import 'package:get/instance_manager.dart';
import 'package:vakinha_burger_mobile/app/core/rest_client/rest_client.dart';

class Applicationbinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => RestClient(),
      fenix: true,
    );
  }
}
