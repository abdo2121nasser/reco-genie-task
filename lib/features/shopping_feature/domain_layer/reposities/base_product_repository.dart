import 'package:reco_genie_task/core/services/fire_base_failure_service.dart';
import 'package:reco_genie_task/features/home_feature/domain_layer/entities/service_entity.dart';
import 'package:either_dart/either.dart';
import 'package:reco_genie_task/features/shopping_feature/domain_layer/entities/product_entity.dart';

abstract class BaseProductRepository{
  Future<Either<Failure,List<ProductEntity>>> getProducts();
}