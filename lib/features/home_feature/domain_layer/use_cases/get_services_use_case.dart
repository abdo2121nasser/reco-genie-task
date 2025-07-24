import 'package:reco_genie_task/core/services/fire_base_failure_service.dart';
import 'package:reco_genie_task/core/utils/usecase/base_usecase.dart';
import 'package:reco_genie_task/features/home_feature/domain_layer/reposities/base_service_repository.dart';
import 'package:either_dart/src/either.dart';

import '../entities/service_entity.dart';

class GetServicesUseCase extends BaseUseCase<List<ServiceEntity>,void>{
  final BaseServiceRepository baseServiceRepository;

  GetServicesUseCase({required this.baseServiceRepository});
  @override
  Future<Either<Failure, List<ServiceEntity>>> call(void object) async {
   return await baseServiceRepository.getServices();
  }

}