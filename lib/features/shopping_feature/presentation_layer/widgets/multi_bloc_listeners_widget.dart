import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultiBlocListenersWidget extends StatelessWidget {
  const MultiBlocListenersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(listeners: [], child: SizedBox.shrink());
  }
}
