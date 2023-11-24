import 'package:flutter/material.dart';

class UnimplementedScreen extends StatelessWidget {
  const UnimplementedScreen({super.key});
  static const routeName = '/unimplemented-screen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'Unimplemented Page',
          style: TextStyle(fontSize: 20, color: Colors.black54),
        ),
      ),
    );
  }
}
