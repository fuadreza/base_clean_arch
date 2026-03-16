import 'package:base_clean_arch/core/extensions/context_extension.dart';
import 'package:base_clean_arch/feature/base/presentation/widgets/contents/custom_alert_dialog_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAlertDialog {
  static Future<bool?> show({
    required BuildContext context,
    String title = '',
    String content = '',
    List<String>? listContent,
    Widget? contentWidget,
    Widget? icons,
    String? titleNegativeButton,
    String? titlePositiveButton,
    String? footer,
    bool dismissible = true,
    double? dialogWidth,
    bool hidePositiveButton = false,
    bool hideNegativeButton = false,
  }) async {
    final bool isMobile = context.isMobile();
    if (isMobile) {
      return await showModalBottomSheet<bool?>(
        isScrollControlled: true,
        context: context,
        isDismissible: dismissible,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
          ),
        ),
        builder: (BuildContext context) {
          return AnimatedPadding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            duration: const Duration(milliseconds: 100),
            curve: Curves.decelerate,
            child: CustomAlertDialogContent(
              title: title,
              content: content,
              listContent: listContent,
              contentWidget: contentWidget,
              icons: icons,
              titleNegativeButton: titleNegativeButton,
              titlePositiveButton: titlePositiveButton,
              footer: footer,
              isMobile: isMobile,
              hidePositiveButton: hidePositiveButton,
              hideNegativeButton: hideNegativeButton,
            ),
          );
        },
      );
    } else {
      return await showDialog<bool?>(
        barrierDismissible: dismissible,
        context: context,
        builder: (context) {
          return Dialog(
            child: StatefulBuilder(
              builder: (context, setState) {
                return Wrap(
                  children: [
                    SizedBox(
                      width: dialogWidth ?? 0.38.sw,
                      child: Padding(
                        padding: EdgeInsets.all(24.r),
                        child: CustomAlertDialogContent(
                          title: title,
                          content: content,
                          listContent: listContent,
                          contentWidget: contentWidget,
                          icons: icons,
                          titleNegativeButton: titleNegativeButton,
                          titlePositiveButton: titlePositiveButton,
                          footer: footer,
                          isMobile: isMobile,
                          hidePositiveButton: hidePositiveButton,
                          hideNegativeButton: hideNegativeButton,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      );
    }
  }
}
