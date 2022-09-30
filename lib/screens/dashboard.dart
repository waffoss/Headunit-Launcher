import 'package:flutter/material.dart';
import '../widgets/menu_option.dart';
import './settings.dart';
import './app_drawer.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  onAppsPress(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const AppDrawer()));
  }

  onSettingsPress(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const Settings()));
  }

  onOptionPress(BuildContext context) {}

  onOptionLongPress(BuildContext context) {
    const List<String> list = <String>['One', 'Two', 'Three', 'Four'];
    String dropdownValue = list.first;
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
              height: 200,
              child: Column(
                children: [
                  DropdownButton(
                    value: dropdownValue,
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                  )
                ],
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: MenuOption(
                      icon: Icons.radio_rounded,
                      text: "Radio",
                      borderColor: Colors.yellow,
                      onLongPress: () => onOptionLongPress(context),
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: MenuOption(
                      icon: Icons.music_note_rounded,
                      text: "Media",
                      borderColor: Colors.yellow,
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: MenuOption(
                      icon: Icons.phone_android_rounded,
                      text: "Phone",
                      borderColor: Colors.brown,
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: MenuOption(
                      icon: Icons.navigation_rounded,
                      text: "Navigation",
                      borderColor: Colors.lightBlueAccent,
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                      child: MenuOption(
                    icon: Icons.play_arrow_rounded,
                    text: "Carplay",
                    borderColor: Colors.green,
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: MenuOption(
                    icon: Icons.directions_car,
                    text: "Vehicle",
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: MenuOption(
                    icon: Icons.apps,
                    text: "Apps",
                    onPressed: () => onAppsPress(context),
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: MenuOption(
                    icon: Icons.settings,
                    text: "Settings",
                    onPressed: () => onSettingsPress(context),
                  ))
                ],
              ))
            ],
          )),
    );
  }
}
