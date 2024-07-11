import 'package:base_clean_arch/core/constants/color_constants.dart';
import 'package:base_clean_arch/core/constants/enums/user_state/user_state_enum.dart';
import 'package:base_clean_arch/core/utils/responsive.dart';
import 'package:base_clean_arch/feature/base/presentation/modules/home/home_page.dart';
import 'package:base_clean_arch/feature/base/presentation/modules/login/cubits/login_cubit.dart';
import 'package:base_clean_arch/feature/base/presentation/modules/login/cubits/login_state.dart';
import 'package:base_clean_arch/feature/base/presentation/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.isValidForm,
    this.onTap,
  });

  final ValueNotifier<bool> isValidForm;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    bool isMobile = Responsive.isMobile(context);
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (ctx, state) {
        if (state is LoginStateSuccess) {
          if (state.userStateEntities == null) {
            Navigator.pushAndRemoveUntil(
              context,
              HomePage.route(),
              (Route<dynamic> route) => false,
            );
          } else {
            if (state.userStateEntities == UserStateEnum.loggedIn) {
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
        } else if (state is LoginStateFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (ctx, state) {
        if (state is LoginStateLoading) {
          return SizedBox(
            width: double.infinity,
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(
                  horizontal: 24.w,
                  vertical: isMobile ? 12.h : 14.h,
                ),
                backgroundColor: ColorConstants.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
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
          return ValueListenableBuilder(
            valueListenable: isValidForm,
            builder: (context, value, child) {
              return CustomPrimaryButton(
                label: 'Masuk',
                enable: value,
                rounded: true,
                onPressed: () {
                  onTap?.call();
                },
                type: ButtonType.large,
                style: ButtonStyles.filled,
              );
            },
          );
        }
      },
    );
  }
}
