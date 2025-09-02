import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/profile/widgets/bottom_profile.dart';
import 'package:movie_app/core/app_theme.dart';

class ModalBottomSheet extends StatefulWidget {
  final int selectedItem;
  final Function(int profile, int index) onSelect;

  const ModalBottomSheet({
    Key? key,
    required this.selectedItem,
    required this.onSelect,
  }) : super(key: key);

  @override
  State<ModalBottomSheet> createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  late int currentSelected;

  @override
  void initState() {
    super.initState();
    currentSelected = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 17.h),
      padding: EdgeInsets.all(19.r),
      decoration: BoxDecoration(
        color: AppTheme.grey,
        borderRadius: BorderRadius.circular(20),
      ),
      height: MediaQuery.of(context).size.height * 0.4.h,
      child: GridView.builder(
        itemCount: 9,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) {
          final currentImage = index == 11 ? 10 : index + 2;
          return BottomProfile(
            imageName: currentImage,
            isSelected: currentSelected == index,
            onTap: () {
              setState(() {
                currentSelected = index;
              });
              widget.onSelect(currentImage, index);
            },
          );
        },
      ),
    );
  }
}
