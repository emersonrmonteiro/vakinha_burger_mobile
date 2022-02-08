import 'package:get/get.dart';

import '../../../core/services/auth_service.dart';
import '../../../core/services/shopping_card_service.dart';
import '../../../models/order.dart';
import '../../../models/shopping_card_model.dart';
import '../../../repositories/order/order_repository.dart';
import '../../home/home_controller.dart';

class ShoppingCardController extends GetxController {
  final AuthService _authService;
  final ShoppingCardService _shoppingCardService;
  final OrderRepository _orderRepository;

  final _address = ''.obs;
  final _cpf = ''.obs;

  ShoppingCardController({
    required AuthService authService,
    required ShoppingCardService shoppingCardService,
    required OrderRepository orderRepository,
  })  : _authService = authService,
        _shoppingCardService = shoppingCardService,
        _orderRepository = orderRepository;

  List<ShoppingCardModel> get products => _shoppingCardService.products;

  double get totalValue => _shoppingCardService.totalValue;

  set address(String value) => _address.value = value;
  set cpf(String value) => _cpf.value = value;

  void addQuantityInProduct(ShoppingCardModel shoppingmodel) {
    _shoppingCardService.addAndRemoveProductInShoppingCard(
        shoppingmodel.product,
        quantity: shoppingmodel.quantity + 1);
  }

  void subtractQuantityInProduct(ShoppingCardModel shoppingmodel) {
    _shoppingCardService.addAndRemoveProductInShoppingCard(
        shoppingmodel.product,
        quantity: shoppingmodel.quantity - 1);
  }

  void clear() => _shoppingCardService.clear();

  Future<void> createOrder() async {
    final userid = _authService.getUserId();
    final order = Order(
      userId: userid!,
      cpf: _cpf.value,
      address: _address.value,
      items: products,
    );
    var orderPix = await _orderRepository.createOrder(order);
    orderPix = orderPix.copyWith(totalValue: totalValue);
    clear();
    Get.offNamed('/orders/finished', arguments: orderPix);
    Get.back(id: HomeController.NAVIGATOR_KEY);
  }
}
