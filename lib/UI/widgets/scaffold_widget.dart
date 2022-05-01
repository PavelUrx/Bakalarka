import 'package:flutter/material.dart';

class MenuScaffold extends StatelessWidget {
  final AppBar appBar;
  final Widget body;
  const MenuScaffold({Key? key, required this.appBar, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
    );
  }
}
