import 'package:base_clean_arch/core/configs/themes/styles.dart';
import 'package:base_clean_arch/core/constants/color_constants.dart';
import 'package:base_clean_arch/core/utils/validation.dart';
import 'package:base_clean_arch/feature/base/presentation/widgets/texts/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginEmailTextField extends StatelessWidget {
  const LoginEmailTextField({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  final TextEditingController controller;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: 'Email',
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        SizedBox(
          height: 8.h,
        ),
        TextFormField(
          key: const Key('login_email_input_key'),
          controller: controller,
          autofocus: false,
          keyboardType: TextInputType.emailAddress,
          style: FormStyle.normalTextStyle.copyWith(fontSize: 14.sp),
          decoration: FormStyle.inputDecorationStyle.copyWith(
            hintText: 'Masukan email',
            hintStyle: FormStyle.normalTextStyle.copyWith(fontSize: 14.sp),
            contentPadding: EdgeInsets.only(left: 8.r, right: 8.r),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(
                color: ColorConstants.shadowCardColor,
              ),
            ),
          ),
          textInputAction: TextInputAction.next,
          validator: (email) => Validation().validateEmail(email ?? ''),
        ),
      ],
    );
  }
}
