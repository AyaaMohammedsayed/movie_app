import 'package:flutter/material.dart';
import 'package:movie_app/profile/widgets/bottom_profile.dart';
import 'package:movie_app/shared/widgets/app_theme.dart';

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
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 17),
      padding: const EdgeInsets.all(19),
      decoration: BoxDecoration(
        color: AppTheme.grey,
        borderRadius: BorderRadius.circular(20),
      ),
      height: MediaQuery.of(context).size.height * 0.4,
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
