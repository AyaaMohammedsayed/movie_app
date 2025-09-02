import 'package:flutter/material.dart';
import 'package:movie_app/profile/widgets/bottom_profile.dart';

import 'package:movie_app/profile/widgets/shared_button.dart';
import 'package:movie_app/shared/widgets/app_theme.dart';

class UpdateProfile extends StatefulWidget {
  static const String routeName = '/update_profile';

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  TextEditingController userName = TextEditingController();

  TextEditingController userPhone = TextEditingController();
  int profile = 1;
  int selectedItem = -1;
  @override
  Widget build(BuildContext context) {
    TextTheme textStyle = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text('Pick Avatar', style: textStyle.titleMedium)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 37),
        child: Column(
          children: [
            Image.asset(
              'assets/images/avatar$profile.png',
              width: 150,
              height: 150,
              fit: BoxFit.fill,
              alignment: Alignment.center,
            ),
            SizedBox(height: 35),
            TextField(
              controller: userName,
              decoration: InputDecoration(
                labelText: 'John Safwat',
                prefixIcon: Image.asset(
                  'assets/images/user.png',
                  width: 30,
                  height: 30,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: userPhone,
              decoration: InputDecoration(
                labelText: '01200000000',
                prefixIcon: Image.asset(
                  'assets/images/phone.png',
                  width: 30,
                  height: 30,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Reset Password',

                style: textStyle.titleSmall?.copyWith(color: AppTheme.white),
              ),
            ),
            Spacer(),
            SharedButton(
              text: 'Delete Account',
              color: AppTheme.red,
              onPressed: () {},
              textColor: AppTheme.white,
            ),
            SizedBox(height: 19),
            SharedButton(
              text: 'Update Data',
              color: AppTheme.primary,
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (context) {
                    return Container(
                      margin: EdgeInsets.only(left: 16, right: 16, bottom: 17),
                      padding: EdgeInsets.all(19),
                      decoration: BoxDecoration(
                        color: AppTheme.grey,
                        borderRadius: BorderRadius.circular(
                          20,
                        ), 
                      ),
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: GridView.builder(
                        itemCount: 9,
                        itemBuilder: (context, index) {
                          return BottomProfile(
                            imageName: index == 11 ? 10 : index + 2,

                            onTap: () {
                              setState(() {
                                selectedItem = index;
                           
                                profile = index == 11 ? 10 : index + 2;
                              });
                            },
                            isSelected: selectedItem == index,
                          );
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                      ),
                    );
                 
                 
                  },
                );
              },
              textColor: AppTheme.blackPrimary,
            ),
          ],
        ),
      ),
    );
  }

  void buildView() {}

  void updateImage() {}
}
