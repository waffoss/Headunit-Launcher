import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hl/screens/settings.dart';
import 'package:hl/widgets/menu_option.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

enum MenuOptions { SETTINGS }

class _MainMenuState extends State<MainMenu> {
  void onMenuItemSelected(BuildContext context, MenuOptions option) {
    switch (option) {
      case MenuOptions.SETTINGS:
        {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const Settings()));
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Row(
            children: const [
              Expanded(
                  child: MenuOption(
                icon: Icons.navigation_rounded,
                text: "Navigation",
              )),
              Expanded(
                  child: MenuOption(
                icon: Icons.radio_outlined,
                text: "Radio",
              )),
              Expanded(
                  child: MenuOption(
                icon: Icons.music_note_rounded,
                text: "Media",
              )),
              Expanded(
                  child: MenuOption(
                icon: Icons.phone,
                text: "Telephone",
              )),
            ],
          ),
          Spacer(),
          Row(
            children: [
              Expanded(
                  child: MenuOption(
                icon: Icons.play_arrow_rounded,
                text: "Carplay",
              )),
              Expanded(
                  child: MenuOption(
                icon: Icons.credit_card,
                text: "TBA",
              )),
              Expanded(
                  child: MenuOption(
                icon: Icons.directions_car_outlined,
                text: "Vehicle",
              )),
              Expanded(
                  child: MenuOption(
                icon: Icons.settings,
                text: "Settings",
                onPressed: () =>
                    onMenuItemSelected(context, MenuOptions.SETTINGS),
              )),
            ],
          ),
          Spacer(),
        ]);
  }
}
