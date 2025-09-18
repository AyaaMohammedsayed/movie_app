
import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {

  String title;
  bool isSelected;
  Color selectedForgroundColorItem;
  Color selectedBackgroundColorItem;
  Color unSelectedForgroundColorItem;
  TabItem({required this.title,required this.isSelected,required this.selectedBackgroundColorItem,required this.selectedForgroundColorItem,required this.unSelectedForgroundColorItem});

  @override
  Widget build(BuildContext context) {
    return Container(
padding: EdgeInsets.symmetric(vertical: 12,horizontal: 15),
      decoration: BoxDecoration(
        border: isSelected?null:Border.all(
          
          color: unSelectedForgroundColorItem),
        color: isSelected?selectedBackgroundColorItem:Colors.transparent,
        borderRadius: BorderRadius.circular(16)),
      child:      Text(title,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(color: isSelected?selectedForgroundColorItem:unSelectedForgroundColorItem,fontWeight: FontWeight.w700),
      
      )
    );
  }
}
