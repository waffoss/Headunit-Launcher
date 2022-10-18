import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/menu_option_model.dart';

class DashboardViewModel extends ChangeNotifier {
  List<MenuOptionModel> _menuItems = [];
  final List<MenuOptionModel> _defaultMenuItems = [
    MenuOptionModel('Radio', 'as', Icons.radio),
    MenuOptionModel('Navigation', 'as', Icons.navigation),
    MenuOptionModel('AC', 'as', Icons.ac_unit),
    MenuOptionModel('Settings', 'as', Icons.settings),
    MenuOptionModel('Vehicle', 'as', Icons.car_rental),
    MenuOptionModel('Carplay', 'as', Icons.play_arrow),
    MenuOptionModel('Telephone', 'as', Icons.phone),
    MenuOptionModel('Satellite', 'as', Icons.satellite_alt),
  ];

  List<MenuOptionModel> get getMenuItems {
    return _menuItems;
  }

  void fetchItems() {
    SharedPreferences.getInstance().then((prefs) => {
          prefs.getString('menuOptions') != null
              ? {
                  _menuItems =
                      MenuOptionModel.decode(prefs.getString('menuOptions')!),
                }
              : {
                  prefs.setString(
                      'menuOptions', MenuOptionModel.encode(_defaultMenuItems)),
                  _menuItems = _defaultMenuItems,
                },
          notifyListeners()
        });

    print("in");
  }

  void updateItem(int index, MenuOptionModel item) {
    SharedPreferences.getInstance().then((prefs) => {
          _menuItems[index] = item,
          prefs.setString('menuOptions', MenuOptionModel.encode(_menuItems)),
          notifyListeners()
        });
  }

  void addItem(MenuOptionModel item) {
    SharedPreferences.getInstance().then((prefs) => {
          _menuItems.add(item),
          prefs.setString('menuOptions', MenuOptionModel.encode(_menuItems)),
          notifyListeners()
        });
  }

  void restoreDefaults() {
    SharedPreferences.getInstance()
        .then((prefs) => {prefs.remove('menuOptions')});
  }
}
