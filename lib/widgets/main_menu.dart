import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:hl/models/menu_option_model.dart';
import 'package:hl/view_models/dashboard_view_model.dart';
import 'package:hl/widgets/menu_option.dart';
import 'package:provider/provider.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  void initState() {
    super.initState();
    // Future.microtask(() =>
    //     Provider.of<DashboardViewModel>(context, listen: false)
    //         .restoreDefaults());
    Future.microtask(() =>
        Provider.of<DashboardViewModel>(context, listen: false).fetchItems());
  }

  void _openApp(String packageName) {
    if (packageName.isNotEmpty) {
      DeviceApps.openApp(packageName);
    }
  }

  void _removeApp(int index) {
    Provider.of<DashboardViewModel>(context, listen: false).removeItem(index);
  }

  void _changeItemPosition(index, isPrev) {
    Provider.of<DashboardViewModel>(context, listen: false)
        .changeItemPosition(index, isPrev);
  }

  void _showContextMenu(BuildContext context, int itemIndex) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Move Left'),
                onPressed: () {
                  _changeItemPosition(itemIndex, true);
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Remove'),
                onPressed: () {
                  _removeApp(itemIndex);
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Move Right'),
                onPressed: () {
                  _changeItemPosition(itemIndex, false);
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    List<MenuOptionModel> menuItems =
        Provider.of<DashboardViewModel>(context).getMenuItems;

    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              gradient: RadialGradient(
                  radius: 1.2,
                  center: Alignment.bottomCenter,
                  colors: [Color.fromARGB(255, 128, 66, 0), Colors.black])),
        ),
        ListView.builder(
            padding: EdgeInsets.only(left: 30),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: menuItems.length,
            itemBuilder: (BuildContext context, int index) {
              MenuOptionModel item = menuItems[index];
              return Container(
                padding: const EdgeInsets.only(right: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MenuOption(
                      text: item.name,
                      base64Image: item.base64Image,
                      onPressed: () => _openApp(item.packageName),
                      onLongPress: () => _showContextMenu(context, index),
                    )
                  ],
                ),
              );
            })
      ],
    );
  }
}
