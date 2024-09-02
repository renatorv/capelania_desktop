import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../kcolors.dart';

class CapelaniaInputtext extends StatelessWidget {
  final String label;
  final TextInputType? keyBoardType;
  final bool? obscureText;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? mask;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final Color? colorInput;
  final Function(String)? onChanged;
  final int? maxLines;
  final bool? focus;
  final TextCapitalization? capitalization;

  const CapelaniaInputtext({
    super.key,
    required this.label,
    this.keyBoardType,
    this.obscureText = false,
    this.suffixIcon,
    this.mask,
    this.controller,
    this.validator,
    this.focusNode,
    this.textInputAction,
    this.maxLength,
    this.colorInput,
    this.onChanged,
    this.maxLines,
    this.focus = false,
    this.capitalization = TextCapitalization.none,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: capitalization!,
      autofocus: focus!,
      maxLines: maxLines,
      onChanged: onChanged,
      maxLength: maxLength,
      textInputAction: textInputAction,
      focusNode: focusNode,
      inputFormatters: mask,
      controller: controller,
      keyboardType: keyBoardType,
      validator: validator,
      obscureText: obscureText!,
      style: TextStyle(
        color: colorInput,
      ),
      cursorColor: Kolors.kRed,
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Kolors.kRed,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Kolors.kRed,
          ),
        ),
        labelText: label,
        labelStyle: TextStyle(
          fontSize: 20.sp,
          color: Kolors.kRed,
        ),
        suffixIcon: suffixIcon,
        suffixIconColor: Kolors.kRed,
      ),
    );
  }
}

  // final phoneMask = MaskTextInputFormatter(
  //   mask: '(##) #####-####',
  //   type: MaskAutoCompletionType.lazy,
  // );

  //                   mask: [controller.phoneMask],
  //                 inputType: TextInputType.number,
  //                 autofocus: true,  