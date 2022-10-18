import 'package:flutter/material.dart';
import 'package:hl/models/menu_option_model.dart';
import 'package:hl/screens/vehicle.dart';
import 'package:hl/widgets/main_menu.dart';
import '../widgets/menu_option.dart';
import '../widgets/side_menu.dart';
import './settings.dart';
import './app_drawer.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Column(children: const [
              Expanded(
                child: MainMenu(),
              ),
              SideMenu(),
            ])));
  }
}

// const List<String> list = <String>['red', 'blue', 'green', 'yellow'];
// List<MenuOptionModel> menuOptions = <MenuOptionModel>[];

// enum MenuOptions {
//   RADIO,
//   MEDIA,
//   PHONE,
//   NAVIGATION,
//   CARPLAY,
//   VEHICLE,
//   APPS,
//   SETTINGS
// }

// class _DashboardState extends State<Dashboard> {
  // @override
  // void initState() {
  //   super.initState();
  // }

  // onOptionPress(BuildContext context, MenuOptions option) {
  //   switch (option) {
  //     case MenuOptions.APPS:
  //       {
  //         Navigator.of(context)
  //             .push(MaterialPageRoute(builder: (context) => const AppDrawer()));
  //       }
  //       break;
  //     case MenuOptions.SETTINGS:
  //       {
  //         Navigator.of(context)
  //             .push(MaterialPageRoute(builder: (context) => const Settings()));
  //       }
  //       break;
  //     case MenuOptions.VEHICLE:
  //       {
  //         Navigator.of(context).push(
  //             MaterialPageRoute(builder: (context) => const VehicleScreen()));
  //       }
  //       break;
  //     case MenuOptions.RADIO:
  //       // TODO: Handle this case.
  //       break;
  //     case MenuOptions.MEDIA:
  //       // TODO: Handle this case.
  //       break;
  //     case MenuOptions.PHONE:
  //       // TODO: Handle this case.
  //       break;
  //     case MenuOptions.NAVIGATION:
  //       // TODO: Handle this case.
  //       break;
  //     case MenuOptions.CARPLAY:
  //       // TODO: Handle this case.
  //       break;
  //   }
  // }

  // onOptionLongPress(BuildContext context) {
    // String dropdownValue = '';
    // setState(() {
    //   dropdownValue = list.first;
    // });
    // showModalBottomSheet<void>(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return Container(
    //           padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
    //           height: 200,
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.start,
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               DropdownButton(
    //                 value: dropdownValue,
    //                 items: list.map<DropdownMenuItem<String>>((String value) {
    //                   return DropdownMenuItem<String>(
    //                     value: value,
    //                     child: Text(value),
    //                   );
    //                 }).toList(),
    //                 onChanged: (String? value) {
    //                   dropdownValue = value!;
    //                 },
    //               ),
    //               TextField()
    //             ],
    //           ));
    //     });
  // }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//             body: Row(children: const [
//       SideMenu(),
//       Expanded(
//         child: MainMenu(),
//       )
//     ])));
//   }
// }


// Column(
//             children: [
//               Expanded(
//                 child: Row(
//                   children: [
//                     Expanded(
//                         child: MenuOption(
//                       icon: Icons.radio_rounded,
//                       text: "Radio",
//                       borderColor: Colors.yellow,
//                       onLongPress: () => onOptionLongPress(context),
//                     )),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Expanded(
//                         child: MenuOption(
//                       icon: Icons.music_note_rounded,
//                       text: "Media",
//                       borderColor: Colors.yellow,
//                     )),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Expanded(
//                         child: MenuOption(
//                       icon: Icons.phone_android_rounded,
//                       text: "Phone",
//                       borderColor: Colors.brown,
//                     )),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Expanded(
//                         child: MenuOption(
//                       icon: Icons.navigation_rounded,
//                       text: "Navigation",
//                       borderColor: Colors.lightBlueAccent,
//                     ))
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Expanded(
//                   child: Row(
//                 children: [
//                   Expanded(
//                       child: MenuOption(
//                     icon: Icons.play_arrow_rounded,
//                     text: "Carplay",
//                     borderColor: Colors.green,
//                   )),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Expanded(
//                       child: MenuOption(
//                     icon: Icons.directions_car,
//                     text: "Vehicle",
//                     onPressed: () =>
//                         onOptionPress(context, MenuOptions.VEHICLE),
//                   )),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Expanded(
//                       child: MenuOption(
//                     icon: Icons.apps,
//                     text: "Apps",
//                     onPressed: () => onOptionPress(context, MenuOptions.APPS),
//                   )),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Expanded(
//                       child: MenuOption(
//                     icon: Icons.settings,
//                     text: "Settings",
//                     onPressed: () =>
//                         onOptionPress(context, MenuOptions.SETTINGS),
//                   ))
//                 ],
//               ))
//             ],
//           )


// GridView.count(
//         crossAxisCount: 4,
//         children: List.generate(menuOptions.length, (index) {
//           print(menuOptions[index].name);
//           return Container(
//             child: Text(
//               menuOptions[index].name,
//               style: TextStyle(fontSize: 30),
//             ),
//           );
//         }),
//       ),