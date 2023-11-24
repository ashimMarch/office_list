import 'package:bank_genie_task/core/router/page_routes.dart';
import 'package:bank_genie_task/core/services/injection_container.dart';
import 'package:bank_genie_task/core/utils/constants/color_constants.dart';
import 'package:bank_genie_task/presentation/authentication/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependancy();
  runApp(const BankGenieTaskApp());
}

class BankGenieTaskApp extends StatelessWidget {
  const BankGenieTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => sl<AuthBloc>(),
      child: MaterialApp(
        title: 'MY APP',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Palette.primaryColor),
          useMaterial3: true,
        ),
        onGenerateRoute: MyRoute.generateRoute,
      ),
    );
  }
}
