import 'package:base_clean_arch/core/constants/color_constants.dart';
import 'package:base_clean_arch/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Custom Button
/// - There are two types and two styles
/// .
/// For two button in a row use, please wrap this widget with Expanded Widget

enum ButtonType { small, large }

enum ButtonStyles { filled, outlined }

class CustomButton extends StatelessWidget {
  final ButtonType? type;
  final ButtonStyles? style;
  final String? label;
  final Widget? icon;
  final Function()? onPressed;
  final bool enable;
  final bool? rounded;
  final Color? outlineColor;
  final Color? textColor;
  final Color? backgroundColor;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;

  const CustomButton({
    super.key,
    this.type = ButtonType.small,
    this.style = ButtonStyles.filled,
    this.label,
    this.icon,
    this.onPressed,
    this.enable = true,
    this.rounded = true,
    this.outlineColor,
    this.textColor,
    this.backgroundColor,
    this.child,
    this.padding,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    bool isMobile = context.isMobile();
    switch (type) {
      case ButtonType.small:
        if (style == ButtonStyles.filled) {
          return displayButtonSmallFilled(isMobile);
        } else {
          return displayButtonSmallOutlined(isMobile);
        }
      case ButtonType.large:
        if (style == ButtonStyles.filled) {
          return displayButtonLargeFilled(isMobile);
        } else {
          return displayButtonLargeOutlined(isMobile);
        }
      default:
        return const SizedBox();
    }
  }

  Widget displayButtonSmallFilled(bool isMobile) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: padding ?? EdgeInsets.symmetric(horizontal: 24.r, vertical: 14.r),
        backgroundColor: enable ? (backgroundColor ?? ColorConstants.primary) : ColorConstants.shadowCardColor,
        shape: rounded == true
            ? RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        )
            : const StadiumBorder(),
        foregroundColor: Colors.white,
        elevation: 0.0,
      ),
      onPressed: enable ? onPressed : null,
      child: child != null
          ? child!
          : icon == null && label != null
          ? Text(
        label!,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: fontSize ?? 14.sp,
          fontWeight: FontWeight.w600,
          color: textColor ?? Colors.white,
        ),
      )
          : icon != null && label != null
          ? Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon!,
          SizedBox(
            width: 10.r,
          ),
          Text(
            label!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: fontSize ?? 14.sp,
              fontWeight: FontWeight.w600,
              color: textColor ?? Colors.white,
            ),
          ),
        ],
      )
          : Center(child: icon!),
    );
  }

  Widget displayButtonSmallOutlined(bool isMobile) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: padding ?? EdgeInsets.symmetric(horizontal: 24.r, vertical: 14.r),
        shape: rounded == true
            ? RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        )
            : const StadiumBorder(),
        side: BorderSide(
          color: outlineColor ?? ColorConstants.shadowCardColor,
          width: 1,
        ),
        foregroundColor: Colors.white,
      ),
      onPressed: enable ? onPressed : null,
      child: child != null
          ? child!
          : icon == null && label != null
          ? Text(
        label!,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: fontSize ?? 14.sp,
          fontWeight: FontWeight.w600,
          color: textColor ?? (enable ? ColorConstants.primary : ColorConstants.shadowCardColor),
        ),
      )
          : icon != null && label != null
          ? Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon!,
          SizedBox(
            width: 10.r,
          ),
          Text(
            label!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: fontSize ?? 14.sp,
              fontWeight: FontWeight.w600,
              color: textColor ?? (enable ? ColorConstants.primary : ColorConstants.shadowCardColor),
            ),
          ),
        ],
      )
          : Center(child: icon!),
    );
  }

  Widget displayButtonLargeFilled(bool isMobile) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: padding ?? EdgeInsets.symmetric(horizontal: 24.r, vertical: 14.r),
          backgroundColor: enable ? (backgroundColor ?? ColorConstants.primary) : (backgroundColor ?? ColorConstants.shadowCardColor),
          shape: rounded == true
              ? RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )
              : const StadiumBorder(),
          foregroundColor: ColorConstants.white,
          elevation: 0.0,
          side: BorderSide(
            color: outlineColor ?? ColorConstants.shadowCardColor,
            width: 1,
          ),
        ),
        onPressed: enable ? onPressed : null,
        child: child != null
            ? child!
            : icon == null && label != null
            ? Text(
          label!,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: fontSize ?? 14.sp,
            fontWeight: FontWeight.w600,
            color: textColor ?? Colors.white,
          ),
        )
            : icon != null && label != null
            ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon!,
            SizedBox(
              width: 10.r,
            ),
            Text(
              label!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: fontSize ?? 14.sp,
                fontWeight: FontWeight.w600,
                color: textColor ?? Colors.white,
              ),
            ),
          ],
        )
            : Center(child: icon!),
      ),
    );
  }

  Widget displayButtonLargeOutlined(bool isMobile) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: padding ?? EdgeInsets.symmetric(horizontal: 24.r, vertical: 14.r),
          shape: rounded == true
              ? RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )
              : const StadiumBorder(),
          side: BorderSide(
            color: outlineColor ?? ColorConstants.shadowCardColor,
            width: 1,
          ),
          foregroundColor: ColorConstants.outlineColor,
        ),
        onPressed: enable ? onPressed : null,
        child: child != null
            ? child!
            : icon == null && label != null
            ? Text(
          label!,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: fontSize ?? 14.sp,
            fontWeight: FontWeight.w500,
            color: textColor ?? (enable ? ColorConstants.primary : ColorConstants.shadowCardColor),
          ),
        )
            : icon != null && label != null
            ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon!,
            SizedBox(
              width: 10.r,
            ),
            Text(
              label!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: textColor ?? (enable ? ColorConstants.primary : ColorConstants.shadowCardColor),
              ),
            ),
          ],
        )
            : Center(child: icon!),
      ),
    );
  }
}
