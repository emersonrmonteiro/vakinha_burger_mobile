import 'package:get/get.dart';

import '../../repositories/auth/products/products_repository.dart';
import '../../repositories/auth/products/products_repository_impl.dart';
import 'menu_controller.dart';

class MenuBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductRepository>(
        () => ProductRepositoryImpl(restClient: Get.find()));
    Get.put(MenuController(productRepository: Get.find()));
  }
}
