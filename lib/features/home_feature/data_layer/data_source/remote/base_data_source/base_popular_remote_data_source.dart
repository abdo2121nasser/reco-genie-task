import 'package:reco_genie_task/features/home_feature/domain_layer/entities/popular_entity.dart';

import '../../../../domain_layer/entities/service_entity.dart';

abstract class BasePopularRemoteDataSource{
  Future<List<PopularEntity>> getPopulars();

}