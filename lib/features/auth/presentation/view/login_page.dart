import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:townteam_app/common/services/git_it_service.dart';
import 'package:townteam_app/features/auth/domain/repos/auth_repo.dart';
import 'package:townteam_app/features/auth/presentation/cuibts/signin_cubit/signin_cubit.dart';
import 'package:townteam_app/features/auth/presentation/widgets/signin_view_bloc_consumer.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'login_page';

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(
        getIt<AuthRepo>(),
      ),
      child: Scaffold(
        body: Builder(builder: (context) {
          return signinViewBlocConsumer();
        }),
      ),
    );
  }
}
