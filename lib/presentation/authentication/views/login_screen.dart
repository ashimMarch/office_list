import 'package:bank_genie_task/core/common/widgets/custom_textfield.dart';
import 'package:bank_genie_task/core/utils/constants/assets_constant.dart';
import 'package:bank_genie_task/core/utils/constants/color_constants.dart';
import 'package:bank_genie_task/presentation/authentication/auth_bloc/auth_bloc.dart';
import 'package:bank_genie_task/presentation/office_list/views/office_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const routeName = '/login-screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _userNameCtrl;
  late TextEditingController _passwordCtrl;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _userNameCtrl = TextEditingController();
    _passwordCtrl = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Spacer(flex: 2),
            Image.asset(
              AssetsImage.loginBg,
              height: 300,
            ),
            const Spacer(flex: 2),

            BlocConsumer<AuthBloc, AuthState>(
              listenWhen: (_, state) => state is AuthError || state is UserLogedIn,
              listener: (context, state) {
                if (state is UserLogedIn) {
                  Navigator.pushNamedAndRemoveUntil(context, OfficeListScreen.routeName, (route) => false);
                }else if(state is AuthError){
                  _showPopupMessage(context, state.message);
                }
              },
              buildWhen: (_, state) => state is AuthError || state is AuthLoading, 
              builder: (context, state) {
                return Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomTextField(
                        controller: _userNameCtrl,
                        hintText: 'Username',
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Enter user name';
                          }
                          return null;
                        },
                        readOnly: state is AuthLoading,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        controller: _passwordCtrl,
                        hintText: 'Password',
                        keyboardType: TextInputType.phone,
                        obscureText: true,
                        readOnly: state is AuthLoading,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Enter password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 32),
                      state is! AuthLoading 
                        ? ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(SignInUser(
                              userName: _userNameCtrl.text,
                              password: _passwordCtrl.text,
                            ));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(220, 60),
                          backgroundColor: Palette.primaryColor,
                        ),
                        child: Text(
                          'Login',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                        ),
                      )
                      : const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  ),
                );
              },
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }

  Future<dynamic> _showPopupMessage(BuildContext context, String message) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _userNameCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }
}
