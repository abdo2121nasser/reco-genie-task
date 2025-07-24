import 'package:reco_genie_task/core/services/fire_base_failure_service.dart';
import 'package:reco_genie_task/features/home_feature/domain_layer/entities/service_entity.dart';
import 'package:either_dart/either.dart';

abstract class BaseSliderRepository{
  Future<Either<Failure,List<String>>> getImages();
}