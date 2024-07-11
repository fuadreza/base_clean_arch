import 'package:base_clean_arch/core/constants/color_constants.dart';
import 'package:base_clean_arch/core/utils/responsive.dart';
import 'package:base_clean_arch/feature/base/presentation/modules/login/widgets/forms/login_form.dart';
import 'package:base_clean_arch/feature/base/presentation/widgets/containers/card_background_container.dart';
import 'package:base_clean_arch/feature/base/presentation/widgets/texts/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(24.r),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 104.w,
                  ),
                  CustomText(
                    text: 'Selamat datang',
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                  CustomText(
                    text: 'Masukan email dan password untuk masuk',
                    fontSize: 16.sp,
                    maxLines: 2,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  const Divider(
                    color: Colors.black45,
                    thickness: 0.2,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  const LoginForm(),
                ],
              ),
            ),
          ),
        ),
      ),
      tablet: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: Container(
                    color: ColorConstants.blueBackground,
                    child: Column(
                      children: [
                        CardBackgroundContainer(
                          body: Center(
                            child: SingleChildScrollView(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 0.4.sh),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                      text: 'Selamat datang',
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                    CustomText(
                                      text: 'Masukan email dan password untuk masuk',
                                      fontSize: 16.sp,
                                      maxLines: 2,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                    SizedBox(
                                      height: 24.h,
                                    ),
                                    const Divider(
                                      color: Colors.black45,
                                      thickness: 0.2,
                                    ),
                                    SizedBox(
                                      height: 24.h,
                                    ),
                                    const LoginForm(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
