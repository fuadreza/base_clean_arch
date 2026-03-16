import 'package:base_clean_arch/core/constants/color_constants.dart';
import 'package:base_clean_arch/feature/base/presentation/widgets/buttons/custom_button.dart';
import 'package:base_clean_arch/feature/base/presentation/widgets/texts/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAlertDialogContent extends StatelessWidget {
  const CustomAlertDialogContent({
    super.key,
    required this.title,
    required this.content,
    this.listContent,
    this.contentWidget,
    this.icons,
    this.titleNegativeButton,
    this.titlePositiveButton,
    this.footer,
    required this.isMobile,
    this.hidePositiveButton = false,
    this.hideNegativeButton = false,
  });

  final String title;
  final String content;
  final List<String>? listContent;
  final Widget? contentWidget;
  final Widget? icons;
  final String? titleNegativeButton;
  final String? titlePositiveButton;
  final String? footer;
  final bool isMobile;
  final bool hidePositiveButton;
  final bool hideNegativeButton;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isMobile) ...[
            Container(
              margin: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: title,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 1,
              thickness: 1,
              color: ColorConstants.divider,
            ),
          ],
          Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (icons != null) icons!,
                SizedBox(
                  height: 12.h,
                ),
                CustomText(
                  text: title,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(
                  height: 12.h,
                ),
                CustomText(
                  text: content,
                  maxLines: 3,
                  textAlign: (listContent ?? []).isNotEmpty ? TextAlign.start : TextAlign.center,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: ColorConstants.black.withValues(alpha: 0.52),
                ),
                if (contentWidget != null) contentWidget!,
                if ((listContent ?? []).isNotEmpty)
                  Container(
                    margin: EdgeInsets.only(top: 12.h),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: listContent?.length ?? 0,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        if (listContent![index].isNotEmpty) {
                          return CustomText(
                            text: '• ${listContent![index]}',
                            fontSize: 16.sp,
                            maxLines: 10,
                            textAlign: TextAlign.start,
                            fontWeight: FontWeight.w400,
                            color: ColorConstants.black.withValues(alpha: 0.52),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
                  ),
                if ((footer ?? '').isNotEmpty)
                  Container(
                    margin: EdgeInsets.only(top: 12.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomText(
                            text: footer,
                            fontSize: 16.sp,
                            maxLines: 10,
                            textAlign: TextAlign.start,
                            fontWeight: FontWeight.w400,
                            color: ColorConstants.outline,
                          ),
                        ),
                      ],
                    ),
                  ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (!hideNegativeButton)
                      Expanded(
                        child: CustomButton(
                          label: titleNegativeButton ?? 'Batal',
                          onPressed: () {
                            Navigator.pop(context, false);
                          },
                          outlineColor: ColorConstants.shadowCardColor,
                          rounded: true,
                          style: ButtonStyles.outlined,
                          type: ButtonType.large,
                          textColor: ColorConstants.black,
                        ),
                      ),
                    SizedBox(
                      width: !(hideNegativeButton || hidePositiveButton) ? 12.w : 0,
                    ),
                    if (!hidePositiveButton)
                      Expanded(
                        child: CustomButton(
                          label: titlePositiveButton ?? 'Ya',
                          onPressed: () {
                            Navigator.pop(context, true);
                          },
                          outlineColor: ColorConstants.shadowCardColor,
                          rounded: true,
                          style: ButtonStyles.filled,
                          type: ButtonType.large,
                          textColor: ColorConstants.white,
                        ),
                      ),
                  ],
                ),
                if (isMobile)
                  SizedBox(
                    height: 12.h,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
