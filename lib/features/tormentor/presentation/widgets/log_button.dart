import 'package:flutter/material.dart';
import 'package:warded/config/app_layout.dart';

class LogButton extends StatelessWidget {
  final IconData iconData;
  final Color color;
  final void Function() onPressed;
  const LogButton(
      {Key? key,
      required this.iconData,
      required this.onPressed,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppLayout.cardRadius),
          bottomLeft: Radius.circular(AppLayout.cardRadius),
        ),
      ),
      padding: const EdgeInsets.all(8),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          iconData,
          color: color,
          size: 56,
        ),
      ),
    );
  }
}
