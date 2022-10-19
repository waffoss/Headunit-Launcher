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
