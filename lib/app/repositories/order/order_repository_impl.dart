import 'dart:developer';

import '../../core/rest_client/rest_client.dart';
import '../../models/order.dart';
import '../../models/order_pix.dart';
import 'order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final RestClient _restClient;

  OrderRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<OrderPix> createOrder(Order order) async {
    final result = await _restClient.post('/order/', {
      'userId': order.userId,
      'cpf': order.cpf,
      'address': order.address,
      'items': order.items
          .map((shoppingcard) => {
                'quantity': shoppingcard.quantity,
                'productId': shoppingcard.product.id,
              })
          .toList()
    });

    if (result.hasError) {
      log(
        'Erro ao reslizar pedido ${result.statusCode}',
        error: result.statusText,
        stackTrace: StackTrace.current,
      );
      throw RestClientException('Erro ao reslizar pedido');
    }
    return OrderPix.fromMap(result.body);
  }
}
