import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reco_genie_task/features/home_feature/presentation_layer/bodies/home_body.dart';
import 'package:reco_genie_task/features/my_cart_feature/presentation_layer/bodies/my_cart_body.dart';
import 'package:reco_genie_task/features/shopping_feature/presentation_layer/bodies/shopping_body.dart';

part 'bottom_navigation_bar_event.dart';
part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarBloc
    extends Bloc<BottomNavigationBarEvent, BottomNavigationBarState> {
  static BottomNavigationBarBloc get(context) => BlocProvider.of(context);

  BottomNavigationBarBloc()
      : super(const ChangeBodyState(body: HomeBody(), currentIndex: 0)) {
    on<BottomNavigationBarEvent>(_changeCurrentBody);
  }

  final List<Widget> _bodies = [
    const HomeBody(),
    const ShoppingBody(),
    const MyCartBody(),
    const Placeholder(),
    const Placeholder(),
  ];

  FutureOr<void> _changeCurrentBody(event, emit) {
    emit(
        ChangeBodyState(body: _bodies[event.index], currentIndex: event.index));
  }
}
