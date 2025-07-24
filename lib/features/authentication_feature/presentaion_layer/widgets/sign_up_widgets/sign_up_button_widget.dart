import 'package:reco_genie_task/core/utils/constants/ui_strings.dart';
import 'package:reco_genie_task/features/authentication_feature/domain_layer/entities/sign_in_entity.dart';
import 'package:reco_genie_task/features/authentication_feature/presentaion_layer/controllers/sign_in_bloc/sign_in_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/services/services_locator.dart';
import '../../../../../core/utils/colors/colors.dart';
import '../../../../../core/utils/component/general_button_widget.dart';
import '../../../../../core/utils/text_styles/style_manager.dart';
import '../../../domain_layer/entities/sign_up_entity.dart';
import '../../controllers/sign_up_bloc/sign_up_bloc.dart';

class SignUpButtonWidget extends StatelessWidget {
  const SignUpButtonWidget({
    super.key,
    required this.validate,
    required this.getSignUpData,
  });
  final bool Function() validate;
  final SignUpEntity Function() getSignUpData;

  @override
  Widget build(BuildContext context) {
    return GeneralButtonWidget(
        label: UiStrings.kSignUpWord,
        function: () {
          if (validate()) {
            SignUpEntity signUpEntity = getSignUpData();
            SignUpBloc.get(context)
                .add(SignUpProcessEvent(signUpEntity: signUpEntity));
          }
        },
        textStyle: AppTextStyles.dmSansMedium14(color: kWhiteColor));
  }
}
