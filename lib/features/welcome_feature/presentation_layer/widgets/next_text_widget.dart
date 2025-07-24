import 'package:reco_genie_task/core/utils/colors/colors.dart';
import 'package:reco_genie_task/core/utils/constants/ui_strings.dart';
import 'package:reco_genie_task/core/utils/text_styles/style_manager.dart';
import 'package:reco_genie_task/features/welcome_feature/presentation_layer/controllers/welcome_bloc/welcome_bloc.dart';
import 'package:flutter/material.dart';

class NextTextWidget extends StatelessWidget {
  const NextTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          WelcomeBloc.get(context).add(MoveToNextContentEvent());
        },
        child: Text(UiStrings.kNextWord,style: AppTextStyles.rubikRegular14(color: kGreyColor),));
  }
}
