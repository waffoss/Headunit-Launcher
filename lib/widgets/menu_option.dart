import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';

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
    return GestureDetector(
        onTap: onPressed,
        onLongPress: onLongPress,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.transparent,
              child: GlowIcon(
                icon,
                color: Colors.white,
                glowColor: Colors.red,
                size: 120,
              ),
            ),
            GlowText(
              text,
              style: TextStyle(fontSize: 30),
              glowColor: Colors.red,
            ),
          ],
        ));
  }
}
