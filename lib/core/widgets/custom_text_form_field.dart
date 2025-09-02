import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/app_theme.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String prefixIconName;
  final String? Function(String?)? validator;

  final bool isPassword;
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.prefixIconName,
    this.isPassword = false,
    this.controller,
    this.onChanged,
    this.validator,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool isObscure = widget.isPassword;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: AppTheme.white,
      ),
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ).copyWith(left: 20, right: 5),
          child: SvgPicture.asset(widget.prefixIconName, width: 24, height: 24),
        ),
        suffixIcon:
            widget.isPassword
                ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon: Icon(
                    isObscure ? Icons.visibility : Icons.visibility_off,
                    size: 24,
                  ),
                )
                : null,
        hintText: widget.hintText,
      ),
      cursorColor: AppTheme.white,
      validator: widget.validator,
      obscureText: isObscure,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
    );
  }
}
