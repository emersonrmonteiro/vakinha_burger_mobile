import '../../../models/products_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> findAll();
}
