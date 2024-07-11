import 'package:base_clean_arch/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight = FontWeight.w400,
    this.color = ColorConstants.black,
    this.maxLines,
    this.textAlign,
    this.isUnderline = false,
    this.textOverflow = TextOverflow.ellipsis,
  });

  final String? text;
  final double? fontSize;
  final FontWeight fontWeight;
  final Color color;
  final int? maxLines;
  final TextAlign? textAlign;
  final bool isUnderline;
  final TextOverflow textOverflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      maxLines: maxLines,
      textAlign: textAlign,
      softWrap: false,
      style: TextStyle(
        fontSize: fontSize ?? 12.sp,
        fontWeight: fontWeight,
        color: color,
        overflow: textOverflow,
        decoration: isUnderline ? TextDecoration.underline : null,
      ),
    );
  }
}
