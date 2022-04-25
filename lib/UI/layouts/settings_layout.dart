import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      toolbarHeight: 40,
      actions: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('SETTINGS'),
          ],
        ),
      ],
    ));
  }
}
