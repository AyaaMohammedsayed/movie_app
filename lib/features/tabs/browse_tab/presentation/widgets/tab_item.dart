import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Color selectedForgroundColorItem;
  final Color selectedBackgroundColorItem;
  final Color unSelectedForgroundColorItem;
  final VoidCallback? onTap; 

  const TabItem({
    super.key,
    required this.title,
    required this.isSelected,
    required this.selectedBackgroundColorItem,
    required this.selectedForgroundColorItem,
    required this.unSelectedForgroundColorItem,
    this.onTap, 
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap, 
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        decoration: BoxDecoration(
          border: isSelected ? null : Border.all(color: unSelectedForgroundColorItem),
          color: isSelected ? selectedBackgroundColorItem : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: isSelected ? selectedForgroundColorItem : unSelectedForgroundColorItem,
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
    );
  }
}
