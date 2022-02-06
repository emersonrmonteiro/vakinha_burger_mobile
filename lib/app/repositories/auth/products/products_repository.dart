import 'package:vakinha_burger_mobile/app/models/products_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> findAll();
}
