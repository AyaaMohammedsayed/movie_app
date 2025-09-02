import 'package:flutter/material.dart';

class SharedButton extends StatelessWidget {
  Color color;
  String text;
  Color textColor;
  void Function() onPressed;
   SharedButton({required this.color , required this.text, required this.textColor, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    TextTheme textStyle = Theme.of(context).textTheme;
    return Container(
      height:MediaQuery.of(context).size.height*0.06 ,
      width: double.infinity,
      child: ElevatedButton(
        
        style: ElevatedButton.styleFrom(
          
          backgroundColor: color,
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15))
        ),
        onPressed: onPressed,
        child: Text(text, style: textStyle.titleSmall?.copyWith(color: textColor)),
      ),
    );
  }
}
