import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String buttonText;
  const MenuButton(
      {Key? key, required this.onPressed, required this.buttonText})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: TextButton(onPressed: onPressed, child: Text(buttonText)),
    );
  }
}

class GameIconButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final Icon icon;
  const GameIconButton({Key? key, required this.onPressed, required this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
    );
  }
}
