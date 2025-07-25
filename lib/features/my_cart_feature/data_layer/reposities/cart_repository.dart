import 'package:either_dart/either.dart';
import 'package:reco_genie_task/features/my_cart_feature/data_layer/data_source/base_data_source/base_cart_remote_data_source.dart';
import 'package:reco_genie_task/features/my_cart_feature/domain_layer/reposities/base_cart_repository.dart';
import 'package:reco_genie_task/features/shopping_feature/domain_layer/entities/product_entity.dart';

import '../../../../core/services/fire_base_failure_service.dart';

class CartRepository extends BaseCartRepository {
  final BaseCartRemoteDataSource baseCartRemoteDataSource;

  CartRepository({required this.baseCartRemoteDataSource});

  @override
  Future<Either<Failure, void>> addProduct(
      {required ProductEntity item}) async {
    try {
      await baseCartRemoteDataSource.addProduct(item);
      return const Right(null);
    } catch (e) {
      final failure = FirebaseFailure.fromException(
          e is Exception ? e : Exception(e.toString()));
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getMyCartProducts() async {
    try {
      var result = await baseCartRemoteDataSource.getMyCartProducts();
      return Right(result);
    } catch (e) {
      final failure = FirebaseFailure.fromException(
          e is Exception ? e : Exception(e.toString()));
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, void>> removeProduct(ProductEntity item) async {
    try {
      await baseCartRemoteDataSource.removeProduct(item);
      return const Right(null);
    } catch (e) {
      final failure = FirebaseFailure.fromException(
          e is Exception ? e : Exception(e.toString()));
      return Left(failure);
    }
  }
}
