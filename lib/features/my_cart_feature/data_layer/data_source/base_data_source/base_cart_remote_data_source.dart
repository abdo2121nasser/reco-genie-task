import 'package:reco_genie_task/features/shopping_feature/domain_layer/entities/product_entity.dart';

abstract class BaseCartRemoteDataSource {
  Future<void> addProduct(ProductEntity item);
  Future<void> removeProduct(ProductEntity item);
  Future<List<ProductEntity>> getMyCartProducts();
}
