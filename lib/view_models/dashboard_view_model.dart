import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/menu_option_model.dart';

class DashboardViewModel extends ChangeNotifier {
  List<MenuOptionModel> _menuItems = [];
  final List<MenuOptionModel> _defaultMenuItems = [
    MenuOptionModel('Radio', 'as', Icons.radio.codePoint),
    MenuOptionModel('Navigation', 'as', Icons.navigation.codePoint),
    MenuOptionModel('AC', 'as', Icons.ac_unit.codePoint),
    MenuOptionModel('Settings', 'as', Icons.settings.codePoint),
    MenuOptionModel('Vehicle', 'as', Icons.car_rental.codePoint),
    MenuOptionModel('Carplay', 'as', Icons.play_arrow.codePoint),
    MenuOptionModel('Telephone', 'as', Icons.phone.codePoint),
    MenuOptionModel('Satellite', 'as', Icons.satellite_alt.codePoint),
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
