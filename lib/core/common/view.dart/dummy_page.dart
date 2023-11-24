import 'package:flutter/material.dart';

class DummyPage extends StatelessWidget {
  const DummyPage({required this.content, super.key});
  final String content;
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: kPrimaryColor,
      alignment: Alignment.center,
      child: Text(content),
    );
  }
}
