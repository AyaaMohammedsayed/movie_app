import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/profile/widgets/modal_bottom_sheet.dart';
import 'package:movie_app/profile/widgets/shared_button.dart';
import 'package:movie_app/shared/widgets/app_theme.dart';

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
      appBar: AppBar(title: Text('Pick Avatar', style: textStyle.titleMedium)),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 37.h),
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
                    'assets/images/user.png',
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
                    'assets/images/phone.png',
                    width: 30.w,
                    height: 30.h,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Reset Password',

                  style: textStyle.titleSmall?.copyWith(color: AppTheme.white),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.25.h),
              SharedButton(
                text: 'Delete Account',
                color: AppTheme.red,
                onPressed: () {},
                textColor: AppTheme.white,
              ),
              SizedBox(height: 19.h),
              SharedButton(
                text: 'Update Data',
                color: AppTheme.yellow,

                textColor: AppTheme.blackPrimary,
                onPressed: () {
                
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
