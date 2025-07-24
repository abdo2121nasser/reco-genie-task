import 'package:reco_genie_task/core/utils/colors/colors.dart';
import 'package:reco_genie_task/core/utils/constants/images.dart';
import 'package:reco_genie_task/core/utils/text_styles/style_manager.dart';
import 'package:reco_genie_task/features/welcome_feature/presentation_layer/controllers/welcome_bloc/welcome_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/constants/ui_strings.dart';
import '../widgets/title_and_sub_title_widget.dart';
import '../../../../core/utils/component/local_image_assets_widget.dart';
import '../widgets/welcome_screen_body_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => WelcomeBloc(),
        child: const WelcomeScreenBodyWidget(),
      ),
    );
  }
}



