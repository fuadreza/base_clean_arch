import 'package:base_clean_arch/feature/base/domain/entities/login/login_params.dart';
import 'package:base_clean_arch/feature/base/presentation/modules/login/cubits/login_cubit.dart';
import 'package:base_clean_arch/feature/base/presentation/modules/login/widgets/buttons/login_button.dart';
import 'package:base_clean_arch/feature/base/presentation/modules/login/widgets/text_fields/login_email_text_field.dart';
import 'package:base_clean_arch/feature/base/presentation/modules/login/widgets/text_fields/login_password_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> isValidForm = ValueNotifier<bool>(false);
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  //#region FUNCTION

  void onTapLogin() {
    if (formKey.currentState?.validate() ?? false) {
      context.read<LoginCubit>().postLogin(
            LoginParam(
              controllerEmail.text,
              controllerPassword.text,
            ),
          );
    }
  }

  void onChangeEmailAndPassword() {
    isValidForm.value = controllerEmail.text.isNotEmpty && controllerPassword.text.isNotEmpty;
  }

  //#endregion FUNCTION

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key('login_form_container_key'),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LoginEmailTextField(
              controller: controllerEmail,
              onChanged: (value) {
                onChangeEmailAndPassword.call();
              },
            ),
            SizedBox(
              height: 17.h,
            ),
            LoginPasswordTextField(
              controller: controllerPassword,
              onChanged: (value) {
                onChangeEmailAndPassword.call();
              },
              onSubmitted: onTapLogin,
            ),
            SizedBox(
              height: 24.h,
            ),
            LoginButton(
              isValidForm: isValidForm,
            ),
          ],
        ),
      ),
    );
  }
}
