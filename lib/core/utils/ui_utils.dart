import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_app/core/app_theme.dart';

class UiUtils {
  static void showSuccessMessage(String message) => Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: AppTheme.green,
    textColor: AppTheme.white,
  );
  static void showErrorMessage(String? message) => Fluttertoast.showToast(
    msg: message ?? "Something Went Wrong",
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: AppTheme.red,
    textColor: AppTheme.white,
  );
}
