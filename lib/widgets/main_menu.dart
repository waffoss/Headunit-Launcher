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

  @override
  Widget build(BuildContext context) {
    List<MenuOptionModel> menuItems =
        Provider.of<DashboardViewModel>(context).getMenuItems;

    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.black, Color.fromARGB(255, 0, 92, 167)])),
      child: GridView.count(
        padding: const EdgeInsets.only(top: 50),
        crossAxisCount: 2,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: List.generate(menuItems.length, (index) {
          MenuOptionModel item = menuItems[index];
          return MenuOption(
            text: item.name,
            icon: IconData(item.iconCodePoint, fontFamily: 'MaterialIcons'),
          );
        }),
      ),
    );
  }
}
 

//   // void onMenuItemSelected(BuildContext context, MenuOptions option) {
//   //   switch (option) {
//   //     case MenuOptions.SETTINGS:
//   //       {
//   //         Navigator.of(context)
//   //             .push(MaterialPageRoute(builder: (context) => const Settings()));
//   //       }
//   //       break;
//   //   }
//   // }

//   // void onLongItemPress(BuildContext context, MenuOptions option) {
//   //   showDialog(
//   //       context: context,
//   //       builder: (BuildContext context) => AlertDialog(
//   //             title: Text('Set app'),
//   //             content: Text("asd"),
//   //             actions: [
//   //               TextButton(onPressed: () => {}, child: Text('Save')),
//   //               TextButton(onPressed: () => {}, child: Text('Cancel'))
//   //             ],
//   //           ));
//   // }

 
// }
