import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/ui/widgets/icon_badge.dart';
import '../../core/ui/widgets/vakinha_appbar.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppbar(),
      bottomNavigationBar: Obx(
        () {
          return BottomNavigationBar(
            onTap: (value) => controller.tabIndex = value,
            currentIndex: controller.tabIndex,
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'Produtos',
              ),
              BottomNavigationBarItem(
                icon: IconBadge(
                    number: controller.totalProductsInshoppingCard,
                    icon: Icons.shopping_cart),
                label: 'Carrinho',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.exit_to_app),
                label: 'Sair',
              ),
            ],
          );
        },
      ),
      body: Navigator(
        initialRoute: '/menu',
        key: Get.nestedKey(HomeController.NAVIGATOR_KEY),
        onGenerateRoute: controller.onGenerateRouter,
      ),
    );
  }
}
