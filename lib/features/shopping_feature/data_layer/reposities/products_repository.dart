import 'package:either_dart/either.dart';
import 'package:reco_genie_task/features/shopping_feature/data_layer/data_source/remote/base_data_source/base_products_remote_data_source.dart';
import 'package:reco_genie_task/features/shopping_feature/domain_layer/entities/product_entity.dart';
import 'package:reco_genie_task/features/shopping_feature/domain_layer/reposities/base_product_repository.dart';

import '../../../../core/services/fire_base_failure_service.dart';

class ProductsRepository extends BaseProductRepository {
  final BaseProductsRemoteDataSource baseProductsRemoteDataSource;

  ProductsRepository({required this.baseProductsRemoteDataSource});
  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      final result = await baseProductsRemoteDataSource.getAllProducts();
      return Right(result);
    } catch (e) {
      final failure = FirebaseFailure.fromException(
          e is Exception ? e : Exception(e.toString()));
      return Left(failure);
    }
  }


}
