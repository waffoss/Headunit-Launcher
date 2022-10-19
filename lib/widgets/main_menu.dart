import 'package:flutter/material.dart';
import 'package:hl/models/menu_option_model.dart';
import 'package:hl/view_models/dashboard_view_model.dart';
import 'package:hl/widgets/menu_option.dart';
import 'package:hl/widgets/menu_option_edit.dart';
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

  void editMenuOption(int optionIndex) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Edit'),
            content: MenuOptionEdit(),
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
                      icon: IconData(item.iconCodePoint,
                          fontFamily: 'MaterialIcons'),
                      onLongPress: () => editMenuOption(index),
                    )
                  ],
                ),
              );
            })
      ],
    );
  }
}
