import 'package:bank_genie_task/core/utils/constants/color_constants.dart';
import 'package:bank_genie_task/presentation/authentication/auth_bloc/auth_bloc.dart';
import 'package:bank_genie_task/presentation/authentication/views/login_screen.dart';
import 'package:bank_genie_task/presentation/office_list/views/office_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (_, state) => state is UserLogedIn || state is UserSignedOut,
      listener: (context, state) {
        debugPrint(' ==SplashScreen===== $state ======= ');
        if (state is UserLogedIn) {
          Navigator.pushNamedAndRemoveUntil(context, OfficeListScreen.routeName, (route) => false);
        }else if(state is UserSignedOut){
          Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName, (route) => false);
        }
      },
      child: const Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'MY APP',
                style: TextStyle(
                  color: Palette.primaryColor,
                  fontSize: 28,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Loading...',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
