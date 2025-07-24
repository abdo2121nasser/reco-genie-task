import 'dart:async';
import 'package:reco_genie_task/core/utils/enums/request_state_enum.dart';
import 'package:reco_genie_task/features/home_feature/domain_layer/entities/service_entity.dart';
import 'package:reco_genie_task/features/home_feature/domain_layer/use_cases/get_services_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'service_event.dart';
part 'service_state.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  static ServiceBloc get(context) => BlocProvider.of(context);
  final GetServicesUseCase getServicesUseCase;
  ServiceBloc({required this.getServicesUseCase})
      : super(const ServiceState()) {
    on<GetServicesEvent>(_getServices);
  }

  Future<void> _getServices(event, emit) async {
    emit( state.copyWith(getServicesState: RequestStateEnum.loading));
    final result = await getServicesUseCase(null);

    result.fold(
      (failure) {
        emit(state.copyWith(getServicesState: RequestStateEnum.error,error: failure.userMessage));
      },
      (services) {
        emit(state.copyWith(
          getServicesState: RequestStateEnum.success,
          services: services,

        ));
      },
    );
  }
}
