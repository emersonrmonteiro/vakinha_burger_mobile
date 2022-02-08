import 'package:get/get.dart';

import '../modules/order/finished/finished_page.dart';
import '../modules/order/pix/pix_page.dart';

class OrdersRouter {
  OrdersRouter._();
  static final routers = <GetPage>[
    GetPage(
      name: '/orders/finished',
      page: () => FinishedPage(),
    ),
    GetPage(
      name: '/orders/pix',
      page: () => PixPage(),
    ),
  ];
}
