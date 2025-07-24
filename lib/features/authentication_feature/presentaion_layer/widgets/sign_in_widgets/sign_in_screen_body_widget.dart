import 'package:reco_genie_task/core/utils/constants/images.dart';
import 'package:reco_genie_task/features/authentication_feature/domain_layer/entities/sign_in_entity.dart';
import 'package:reco_genie_task/features/authentication_feature/presentaion_layer/controllers/user_bloc/user_bloc.dart';
import 'package:reco_genie_task/features/authentication_feature/presentaion_layer/widgets/sign_in_widgets/sign_in_form_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../configuration/routes.dart';
import '../../../../../core/utils/component/local_image_assets_widget.dart';
import '../../../../../core/utils/enums/request_state_enum.dart';
import '../../../../../core/utils/values/app_size.dart';
import '../../controllers/sign_in_bloc/sign_in_bloc.dart';
import 'sign_in_multi_bloc_listener_widget.dart';
import 'sign_in_button_section_widget.dart';

class SignInScreenBodyWidget extends StatefulWidget {
  const SignInScreenBodyWidget({
    super.key,
  });

  @override
  State<SignInScreenBodyWidget> createState() => _SignInScreenBodyWidgetState();
}

class _SignInScreenBodyWidgetState extends State<SignInScreenBodyWidget> {
  final GlobalKey<FormState> _globalKey = GlobalKey();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: k20H),
      child: Column(
        children: [
          const SignInMultiBlocListenerWidget(),
          SizedBox(
            height: MediaQuery.maybeOf(context)!.size.height * 0.01,
          ),
          const LocalImageAssetsWidget(
            imagePath: kNawelImage,
          ),
          SignInFormWidget(
            globalKey: _globalKey,
            emailController: _emailController,
            passwordController: _passwordController,
          ),
          SizedBox(
            height: k20V,
          ),
          SignInButtonSectionWidget(
            validate: _validate,
            getSignInData: _getSignInData,
          )
        ],
      ),
    );
  }

  bool _validate() => _globalKey.currentState!.validate();

  SignInEntity _getSignInData() => SignInEntity(
      email: _emailController.text, password: _passwordController.text);
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
