import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/services/auth_service.dart';
import '../../core/services/shopping_card_service.dart';
import '../menu/menu_bindings.dart';
import '../menu/menu_page.dart';
import '../order/shopping_card/shopping_card_bindings.dart';
import '../order/shopping_card/shopping_card_page.dart';

class HomeController extends GetxController {
  static const NAVIGATOR_KEY = 1;
  final ShoppingCardService _shoppingCardService;
  HomeController({
    required ShoppingCardService shoppingCardService,
  }) : _shoppingCardService = shoppingCardService;

  final _tabIndex = 0.obs;
  final _tabs = ['/menu', '/order/shopping_card', '/exit'];

  int get tabIndex => _tabIndex.value;

  int get totalProductsInshoppingCard => _shoppingCardService.totalProducts;

  set tabIndex(int index) {
    _tabIndex(index);
    if (_tabs[index] == '/exit') {
      Get.find<AuthService>().logout();
    } else {
      Get.toNamed(_tabs[index], id: NAVIGATOR_KEY);
    }
  }

  Route? onGenerateRouter(RouteSettings settings) {
    if (settings.name == '/menu') {
      return GetPageRoute(
        settings: settings,
        page: () => const MenuPage(),
        binding: MenuBindings(),
        transition: Transition.fadeIn,
      );
    }
    if (settings.name == '/order/shopping_card') {
      return GetPageRoute(
        settings: settings,
        page: () => ShoppingCardPage(),
        binding: ShoppingCardBindings(),
        transition: Transition.fadeIn,
      );
    }
    if (settings.name == '/exit') {}
  }
}
