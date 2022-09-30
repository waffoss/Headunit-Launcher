import 'package:flutter/material.dart';

class MenuOption extends StatelessWidget {
  const MenuOption(
      {Key? key,
      this.icon = Icons.car_rental,
      this.text = 'text',
      this.borderColor = Colors.white,
      this.onPressed,
      this.onLongPress})
      : super(key: key);

  final IconData icon;
  final String text;
  final Color borderColor;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GestureDetector(
      child: Card(
          color: Colors.transparent,
          shape: Border(
              right: BorderSide(color: Colors.grey, width: .3),
              left: BorderSide(color: Colors.grey, width: .3),
              bottom: BorderSide(color: borderColor, width: 6)),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 80,
                ),
                Text(
                  text,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
          )),
      onTap: onPressed,
      onLongPress: onLongPress,
    ));
  }
}
