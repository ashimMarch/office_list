import 'package:bank_genie_task/core/utils/constants/color_constants.dart';
import 'package:bank_genie_task/presentation/authentication/auth_bloc/auth_bloc.dart';
import 'package:bank_genie_task/presentation/authentication/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OfficeListAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OfficeListAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is UserSignedOut || state is AuthError) {
          Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName, (route) => false);
        }
      },
      child: AppBar(
        centerTitle: true,
        title: const Text(
          'Office List',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Palette.primaryColor),
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) async {
              context.read<AuthBloc>().add(const SignOutUser());
            },
            itemBuilder: (context) {
              return const [
                PopupMenuItem<String>(
                  value: 'LOGOUT',
                  child: Text('Log out'),
                ),
              ];
            },
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, kTextTabBarHeight);
}
