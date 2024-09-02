import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../kcolors.dart';

class CapelaniaButton extends StatelessWidget {
  final String label;
  final Function() onPress;
  final Color? color;
  final Color? colorBtnVoltar;
  final bool? borderSide;
  final double size;
  final Color? backgroundColor;
  final IconData? iconData;

  const CapelaniaButton({
    super.key,
    required this.label,
    required this.onPress,
    this.color,
    this.colorBtnVoltar,
    this.borderSide,
    required this.size,
    this.backgroundColor,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? Kolors.kRed,
        padding: EdgeInsets.symmetric(
          vertical: 10.sp,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      onPressed: onPress,
      child: Text(
        label.toUpperCase(),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Kolors.kWhite,
          fontSize: size,
        ),
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