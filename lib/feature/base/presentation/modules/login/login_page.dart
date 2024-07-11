import 'package:base_clean_arch/core/constants/enums/user_state/user_state_enum.dart';
import 'package:base_clean_arch/feature/base/presentation/modules/home/home_page.dart';
import 'package:base_clean_arch/feature/base/presentation/modules/login/cubits/login_cubit.dart';
import 'package:base_clean_arch/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
    this.userStateEnum,
  });

  final UserStateEnum? userStateEnum;

  static Route route({UserStateEnum? userStateEnum}) {
    return MaterialPageRoute<void>(
      builder: (_) => LoginPage(userStateEnum: userStateEnum),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di<LoginCubit>(),
        ),
      ],
      child: getPage(userStateEnum),
    );
  }

  Widget getPage(UserStateEnum? userStateEnum) {
    switch (userStateEnum) {
      case UserStateEnum.loggedIn:
        return const HomePage();
      case UserStateEnum.priceChecker:
        return const HomePage();
      case UserStateEnum.cashier:
        return const HomePage();
      default:
        return const HomePage();
    }
  }
}
