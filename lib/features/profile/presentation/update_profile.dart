import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/constants/constants.dart';
import 'package:movie_app/core/widgets/custom_elevated_button.dart';
import 'package:movie_app/features/profile/widgets/modal_bottom_sheet.dart';
import 'package:movie_app/core/app_theme.dart';

class UpdateProfile extends StatefulWidget {
  static const String routeName = '/update_profile';

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  TextEditingController userName = TextEditingController(text: 'John Safwat');

  TextEditingController userPhone = TextEditingController(text: '01200000000');
  int profile = 1;
  int selectedItem = -1;
  @override
  Widget build(BuildContext context) {
    TextTheme textStyle = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppTexts.pickAvatar, style: textStyle.titleMedium),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 37.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context) {
                      return ModalBottomSheet(
                        selectedItem: selectedItem,
                        onSelect: (newProfile, newIndex) {
                          setState(() {
                            profile = newProfile;
                            selectedItem = newIndex;
                          });
                        },
                      );
                    },
                  );
                },
                child: Image.asset(
                  'assets/images/avatar$profile.png',
                  width: 150.w,
                  height: 150.h,
                  fit: BoxFit.fill,
                  alignment: Alignment.center,
                ),
              ),
              SizedBox(height: 35.h),
              TextField(
                controller: userName,
                style: TextStyle(fontSize: 20.sp, color: AppTheme.white),
                decoration: InputDecoration(
                  prefixIcon: Image.asset(
                    AppImages.userImage,
                    width: 30.w,
                    height: 30.h,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              TextField(
                style: TextStyle(fontSize: 20.sp, color: AppTheme.white),
                controller: userPhone,
                decoration: InputDecoration(
                  prefixIcon: Image.asset(
                    AppImages.phoneImage,
                    width: 30.w,
                    height: 30.h,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(AppTexts.restPass, style: textStyle.titleLarge),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.25.h),
              CustomElevatedButton(
                foregroundColor: AppTheme.white,
                onTap: () {},
                color: AppTheme.red,
                child: Text(AppTexts.deleteAccount),
              ),
              SizedBox(height: 19.h),
              CustomElevatedButton(
                child: Text(AppTexts.updataAccount),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
