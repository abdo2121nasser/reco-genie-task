import 'package:reco_genie_task/core/services/fire_base_failure_service.dart';
import 'package:reco_genie_task/features/authentication_feature/domain_layer/entities/user_entity.dart';
import 'package:reco_genie_task/features/authentication_feature/domain_layer/repositories/base_user_repository.dart';
import 'package:either_dart/either.dart';

import 'package:either_dart/src/either.dart';

import '../../../../core/utils/usecase/base_usecase.dart';

class GetRemoteUserUseCase extends BaseUseCase<UserEntity, String> {
  final BaseUserRepository baseUserRepository;

  GetRemoteUserUseCase({
    required this.baseUserRepository,
  });
  @override
  Future<Either<Failure, UserEntity>> call(String object) async {
    return await baseUserRepository.getRemoteUser(userDocId: object);
  }
}
