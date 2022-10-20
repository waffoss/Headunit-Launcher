import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';

class MenuOption extends StatelessWidget {
  const MenuOption(
      {Key? key,
      this.base64Image = '',
      this.text = 'text',
      this.borderColor = Colors.white,
      this.onPressed,
      this.onLongPress})
      : super(key: key);

  final String base64Image;
  final String text;
  final Color borderColor;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        onLongPress: onLongPress,
        child: Container(
          width: 250,
          padding: EdgeInsets.all(10),
          foregroundDecoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              backgroundBlendMode: BlendMode.saturation),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 2, color: Color.fromARGB(255, 204, 116, 0)))),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                color: Colors.transparent,
                child: Container(
                    width: 150,
                    height: 150,
                    child: base64Image.isNotEmpty
                        ? Image.memory(
                            base64Decode(base64Image),
                            fit: BoxFit.fill,
                          )
                        : Container()),
              ),
              RichText(
                overflow: TextOverflow.ellipsis,
                strutStyle: StrutStyle(fontSize: 30),
                text: TextSpan(text: text, style: TextStyle(fontSize: 30)),
              )
            ],
          ),
        ));
  }
}
