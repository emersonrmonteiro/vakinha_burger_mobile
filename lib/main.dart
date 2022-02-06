import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/bindings/application_bindings.dart';
import 'package:vakinha_burger_mobile/app/core/ui/vakinha_ui.dart';
import 'package:vakinha_burger_mobile/app/routes/auth_routers.dart';

import 'app/routes/splash_routes.dart';

void main() {
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
      ],
    );
  }
}
