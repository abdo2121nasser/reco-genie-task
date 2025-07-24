import 'package:reco_genie_task/core/utils/constants/ui_strings.dart';
import 'package:reco_genie_task/features/authentication_feature/domain_layer/entities/sign_in_entity.dart';
import 'package:reco_genie_task/features/authentication_feature/presentaion_layer/controllers/sign_in_bloc/sign_in_bloc.dart';
import 'package:reco_genie_task/features/authentication_feature/presentaion_layer/controllers/user_bloc/user_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/services/services_locator.dart';
import '../../../../../core/utils/colors/colors.dart';
import '../../../../../core/utils/component/general_button_widget.dart';
import '../../../../../core/utils/text_styles/style_manager.dart';

class SignInButtonWidget extends StatelessWidget {
  const SignInButtonWidget({
    super.key,
    required this.validate,
    required this.getSignInData,
  });
  final bool Function() validate;
  final SignInEntity Function() getSignInData;

  @override
  Widget build(BuildContext context) {
    return GeneralButtonWidget(
        label: UiStrings.kSignInWord,
        function: () {
    if(validate()){
      SignInEntity signInEntity=getSignInData();
      SignInBloc.get(context).add(SignInProcessEvent(signInEntity: signInEntity));

    }
        },
        textStyle: AppTextStyles.dmSansMedium14(color: kWhiteColor));
  }
}
