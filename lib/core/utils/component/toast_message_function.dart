
import 'package:reco_genie_task/core/utils/colors/colors.dart';
import 'package:reco_genie_task/core/utils/text_styles/font_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToastMessage({required String message}){
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      textColor: kWhiteColor,
      backgroundColor: kPurpleColor,
      fontSize: FontSize.s14
  );
}