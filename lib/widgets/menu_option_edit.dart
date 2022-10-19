import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MenuOptionEdit extends StatelessWidget {
  const MenuOptionEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [TextField(), TextField(), Spacer()],
    );
  }
}
