import 'package:reco_genie_task/features/authentication_feature/presentaion_layer/controllers/sign_in_bloc/sign_in_bloc.dart';
import 'package:reco_genie_task/features/authentication_feature/presentaion_layer/controllers/user_bloc/user_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/services_locator.dart';
import '../controllers/sign_up_bloc/sign_up_bloc.dart';
import '../widgets/sign_up_widgets/sign_up_screen_body_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(providers: [
        BlocProvider(create: (context) => sl<SignUpBloc>()),
        BlocProvider(create: (context) => sl<UserBloc>()),
      ], child: const SingleChildScrollView(child: SignUpScreenBodyWidget())),
    );
  }
}
