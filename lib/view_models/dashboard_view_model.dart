import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/menu_option_model.dart';

class DashboardViewModel extends ChangeNotifier {
  List<MenuOptionModel> _menuItems = [];

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
                  prefs.setString('menuOptions', MenuOptionModel.encode([])),
                  _menuItems = [],
                },
          notifyListeners()
        });
  }

  void updateItem(int index, MenuOptionModel item) {
    _menuItems[index] = item;
    _save();
  }

  void addItem(MenuOptionModel item) {
    SharedPreferences.getInstance().then((prefs) => {
          _menuItems.add(item),
          prefs.setString('menuOptions', MenuOptionModel.encode(_menuItems)),
          notifyListeners()
        });
  }

  void removeItem(int index) {
    _menuItems.removeAt(index);
    _save();
  }

  void changeItemPosition(int index, bool isPrev) {
    if ((isPrev && index - 1 < 0) ||
        (!isPrev && index + 1 >= _menuItems.length)) {
      return;
    }
    MenuOptionModel item = _menuItems[index];
    MenuOptionModel flipItem = _menuItems[isPrev ? index - 1 : index + 1];
    _menuItems[isPrev ? index - 1 : index + 1] = item;
    _menuItems[index] = flipItem;

    _save();
  }

  void restoreDefaults() {
    SharedPreferences.getInstance()
        .then((prefs) => {prefs.remove('menuOptions')});
  }

  void _save() {
    SharedPreferences.getInstance().then((prefs) => {
          prefs.setString('menuOptions', MenuOptionModel.encode(_menuItems)),
          notifyListeners()
        });
  }
}
