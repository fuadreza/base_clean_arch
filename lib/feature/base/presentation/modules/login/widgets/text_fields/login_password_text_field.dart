import 'dart:developer';

import 'package:base_clean_arch/core/configs/themes/styles.dart';
import 'package:base_clean_arch/core/constants/color_constants.dart';
import 'package:base_clean_arch/feature/base/presentation/widgets/texts/custom_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPasswordTextField extends StatefulWidget {
  const LoginPasswordTextField({
    super.key,
    required this.controller,
    required this.onChanged,
    this.onSubmitted,
  });

  final TextEditingController controller;
  final ValueChanged<String?> onChanged;
  final VoidCallback? onSubmitted;

  @override
  State<LoginPasswordTextField> createState() => _LoginPasswordTextFieldState();
}

class _LoginPasswordTextFieldState extends State<LoginPasswordTextField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: 'Password',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            SizedBox(
              height: 8.h,
            ),
            TextButton(
              child: CustomText(
                text: 'Lupa password ?',
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: ColorConstants.primary,
              ),
              onPressed: () {
                if (kDebugMode) {
                  log('goto lupa password');
                }
              },
            ),
          ],
        ),
        TextFormField(
          key: const Key('login_password_input_key'),
          controller: widget.controller,
          keyboardType: TextInputType.text,
          obscureText: !isPasswordVisible,
          style: FormStyle.normalTextStyle.copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400),
          decoration: FormStyle.inputDecorationStyle.copyWith(
            hintText: 'Masukan password',
            hintStyle: FormStyle.normalTextStyle.copyWith(fontSize: 14.sp),
            contentPadding: EdgeInsets.only(left: 8.r, right: 8.r),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: ColorConstants.shadowCardColor),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                size: 24.r,
              ),
              onPressed: () {
                setState(() {
                  isPasswordVisible = !isPasswordVisible;
                });
              },
            ),
          ),
          textInputAction: TextInputAction.send,
          onFieldSubmitted: (value) {
            widget.onSubmitted?.call();
          },
          onChanged: (value) {
            widget.onChanged.call(value);
          },
          validator: (password) {
            if (password!.isEmpty || password == '') {
              return 'Password tidak boleh kosong';
            }
            return null;
          },
        ),
      ],
    );
  }
}
