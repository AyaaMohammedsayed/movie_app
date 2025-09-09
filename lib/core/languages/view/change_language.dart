import 'package:flutter/material.dart';
import 'package:movie_app/core/app_theme.dart';
import 'package:movie_app/core/constants/constants.dart';
<<<<<<< HEAD
import 'package:movie_app/core/languages/view_model/languages_view_model.dart';
=======
import 'package:movie_app/core/languages/view_model/settings_provider.dart';
>>>>>>> 88daba2a7eca5ca477dad6c69e67ffc69aff99d1
import 'package:movie_app/core/languages/view/custom_circle_avatar.dart';

class ChangeLanguageWidget extends StatefulWidget {
  const ChangeLanguageWidget(this.languagesViewModel);

  final LanguagesViewModel languagesViewModel;

  @override
  State<ChangeLanguageWidget> createState() => _ChangeLanguageWidgetState();
}

class _ChangeLanguageWidgetState extends State<ChangeLanguageWidget> {
  final String arabicCode = 'ar';

  final String englishCode = 'en';

  late String selectedCode = widget.languagesViewModel.languageCode!;

  void changeLanguage(String val) {
    if (val == selectedCode) return;

    selectedCode = val;
    widget.languagesViewModel.changeLanguage(selectedCode);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.primary),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomCircleAvatar(
              iconName: AppImages.enIcon,
              tappedValue: englishCode == selectedCode,
              onTap: () => changeLanguage(englishCode),
            ),
            SizedBox(width: 20),
            CustomCircleAvatar(
              iconName: AppImages.egIcon,
              tappedValue: arabicCode == selectedCode,
              onTap: () => changeLanguage(arabicCode),
            ),
          ],
        ),
      ),
    );
  }
}
