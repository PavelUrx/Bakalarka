import 'package:bakalarkaflutter/UI/widgets/appbar_item_widget.dart';
import 'package:flutter/widgets.dart';

class AppBarContent extends StatelessWidget {
  final AppBarItem appBarItem;
  const AppBarContent({Key? key, required this.appBarItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        appBarItem,
      ],
    );
  }
}
