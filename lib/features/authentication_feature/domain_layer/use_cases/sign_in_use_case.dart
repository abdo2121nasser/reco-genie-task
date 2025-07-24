import 'package:reco_genie_task/core/services/fire_base_failure_service.dart';
import 'package:reco_genie_task/features/authentication_feature/domain_layer/entities/sign_in_entity.dart';
import 'package:reco_genie_task/features/authentication_feature/domain_layer/repositories/base_authentication_repository.dart';
import 'package:either_dart/either.dart';

import 'package:either_dart/src/either.dart';

import '../../../../core/utils/usecase/base_usecase.dart';

class SignInUseCase extends BaseUseCase<String,SignInEntity> {
  final BaseAuthenticationRepository baseAuthenticationRepository;

  SignInUseCase({
    required this.baseAuthenticationRepository,
  });
  @override
  Future<Either<Failure,String>> call(SignInEntity object) async {

    return await baseAuthenticationRepository.signIn(
        signInEntity: object);
  }
}
