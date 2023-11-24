part of 'page_routes.dart';

class MyRoute {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/' || LoginScreen.routeName:
        return MaterialPageRoute(
          builder: (context) {
            return const LoginScreen();
          },
          settings: settings,
        );
      case OfficeListScreen.routeName:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => sl<OfficeCubit>(),
              child: const OfficeListScreen(),
            );
          },
          settings: settings,
        );
      
      default:
        return null;
    }
  }
}
