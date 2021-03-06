import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vakinha_burger_mobile/app/routes/orders_router.dart';

import 'app/core/bindings/application_bindings.dart';
import 'app/core/ui/vakinha_ui.dart';
import 'app/routes/auth_routers.dart';
import 'app/routes/home_routers.dart';
import 'app/routes/product_routers.dart';
import 'app/routes/splash_routes.dart';

void main() async {
  await GetStorage.init();
  runApp(const VakinhaBurgerMainApp());
}

class VakinhaBurgerMainApp extends StatelessWidget {
  const VakinhaBurgerMainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Vakinha Burger',
      theme: VakinhaUI.theme,
      initialBinding: Applicationbinding(),
      getPages: [
        ...SplashRouters.routers,
        ...AuthRouters.routers,
        ...HomeRouters.routers,
        ...ProductRouters.routers,
        ...OrdersRouter.routers,
      ],
    );
  }
}
