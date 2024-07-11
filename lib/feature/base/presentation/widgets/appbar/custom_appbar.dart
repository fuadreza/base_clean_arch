import 'package:base_clean_arch/core/constants/color_constants.dart';
import 'package:base_clean_arch/feature/base/presentation/widgets/texts/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.iconData,
    this.trailing,
    this.leading,
  });

  final String title;
  final IconData? iconData;
  final Widget? trailing;
  final Widget? leading;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      backgroundColor: ColorConstants.white,
      iconTheme: const IconThemeData(
        color: ColorConstants.iconColor,
      ),
      title: CustomText(
        text: widget.title,
        fontWeight: FontWeight.w700,
        fontSize: 18.sp,
      ),
      leading: widget.leading,
      actions: [
        if (widget.iconData != null)
          IconButton(
            onPressed: () {},
            icon: Icon(
              widget.iconData,
              color: ColorConstants.iconColor,
            ),
          ),
        widget.trailing ?? const SizedBox.shrink(),
      ],
    );
  }
}
