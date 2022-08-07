import 'package:base_clean_arch/core/configs/themes/styles.dart';
import 'package:base_clean_arch/core/constants/color_constants.dart';
import 'package:base_clean_arch/core/utils/responsive.dart';
import 'package:base_clean_arch/core/utils/validation.dart';
import 'package:base_clean_arch/feature/base/domain/entities/login/login_params.dart';
import 'package:base_clean_arch/feature/base/domain/entities/login/login_state.dart';
import 'package:base_clean_arch/feature/base/domain/entities/user_state/user_state_entities.dart';
import 'package:base_clean_arch/feature/base/presentation/modules/home/home_page.dart';
import 'package:base_clean_arch/feature/base/presentation/modules/login/login_cubit.dart';
import 'package:base_clean_arch/feature/base/presentation/widgets/card_background_tablet.dart';
import 'package:base_clean_arch/feature/base/presentation/widgets/custom_button.dart';
import 'package:base_clean_arch/feature/base/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false;

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
                  NormalText(
                    text: 'Selamat datang',
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                  NormalText(
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
                  _emailPasswordWidget(),
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
                        CardBackgroundTablet(
                          body: Center(
                            child: SingleChildScrollView(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 0.4.sh),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    NormalText(
                                      text: 'Selamat datang',
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                    NormalText(
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
                                    _emailPasswordWidget(),
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

  Widget _emailPasswordWidget() {
    bool isMobile = Responsive.isMobile(context);
    return Container(
      key: const Key('emailPass'),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _emailInput(),
            SizedBox(
              height: 17.h,
            ),
            _passwordInput(),
            SizedBox(
              height: 24.h,
            ),
            BlocConsumer<LoginCubit, LoginState>(
              listener: (ctx, state) {
                if (state is LoginSuccess) {
                  if (state.userStateEntities == null) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      HomePage.route(),
                      (Route<dynamic> route) => false,
                    );
                  } else {
                    if (state.userStateEntities == UserStateEntities.loggedIn) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        HomePage.route(),
                        (Route<dynamic> route) => false,
                      );
                    } else {
                      if (state.locationName == null) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          HomePage.route(),
                          (Route<dynamic> route) => false,
                        );
                      } else {
                        Navigator.pushAndRemoveUntil(
                          context,
                          HomePage.route(),
                          (Route<dynamic> route) => false,
                        );
                      }
                    }
                  }
                } else if (state is LoginFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              builder: (ctx, state) {
                if (state is LoginLoading) {
                  return SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: isMobile ? 12.h : 14.h),
                        backgroundColor: ColorConstants.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        primary: Colors.white,
                        elevation: 0.0,
                      ),
                      onPressed: null,
                      child: SizedBox(
                        width: 20.r,
                        height: 20.r,
                        child: Padding(
                          padding: EdgeInsets.all(2.r),
                          child: const CircularProgressIndicator(
                            strokeWidth: 1.5,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return CustomPrimaryButton(
                    label: 'Masuk',
                    enable: _emailController.text.isEmpty || _passwordController.text.isEmpty ? false : true,
                    rounded: true,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ctx.read<LoginCubit>().postLogin(LoginParam(_emailController.text, _passwordController.text));
                      }
                    },
                    type: ButtonType.large,
                    style: ButtonStyles.filled,
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _emailInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NormalText(
          text: 'Email',
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        SizedBox(
          height: 8.h,
        ),
        TextFormField(
          key: const Key('emailInput'),
          controller: _emailController,
          autofocus: false,
          keyboardType: TextInputType.emailAddress,
          style: FormStyle.normalTextStyle.copyWith(fontSize: 14.sp),
          decoration: FormStyle.inputDecorationStyle.copyWith(
            hintText: 'Masukan email',
            hintStyle: FormStyle.normalTextStyle.copyWith(fontSize: 14.sp),
            contentPadding: EdgeInsets.only(left: 8.r, right: 8.r),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: ColorConstants.shadowCardColor),
            ),
          ),
          textInputAction: TextInputAction.next,
          validator: (email) => Validation().validateEmail(email!),
        ),
      ],
    );
  }

  Widget _passwordInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NormalText(
              text: 'Password',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            SizedBox(
              height: 8.h,
            ),
            TextButton(
              child: NormalText(
                text: 'Lupa password ?',
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: ColorConstants.primary,
              ),
              onPressed: () => print('goto lupa password'),
            ),
          ],
        ),
        TextFormField(
          key: const Key('passInput'),
          controller: _passwordController,
          keyboardType: TextInputType.text,
          obscureText: !_passwordVisible,
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
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
                size: 24.r,
              ),
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            ),
          ),
          textInputAction: TextInputAction.send,
          onFieldSubmitted: (value) {
            if (_formKey.currentState!.validate()) {
              context.read<LoginCubit>().postLogin(LoginParam(_emailController.text, _passwordController.text));
            }
          },
          onChanged: (value) {
            setState(() {});
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
