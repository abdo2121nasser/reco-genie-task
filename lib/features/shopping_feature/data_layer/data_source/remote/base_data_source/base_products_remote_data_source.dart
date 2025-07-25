import 'package:reco_genie_task/features/shopping_feature/domain_layer/entities/product_entity.dart';

abstract class BaseProductsRemoteDataSource {
  Future<List<ProductEntity>> getAllProducts();
}
