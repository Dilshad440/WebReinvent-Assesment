import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_assesment/core/theme/app_colors.dart';

class CommonUtils {
  static void showSuccessToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: AppColors.teal,
      textColor: AppColors.white,
    );
  }

  static void showErrorToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: AppColors.red,
      textColor: AppColors.white,
    );
  }
}
