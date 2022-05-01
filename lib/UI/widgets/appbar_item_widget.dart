import 'package:flutter/widgets.dart';

class AppBarItem extends StatelessWidget {
  final String itemText;
  const AppBarItem({Key? key, required this.itemText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(itemText);
  }
}
