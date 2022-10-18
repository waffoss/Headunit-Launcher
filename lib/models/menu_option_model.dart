import 'dart:convert';

import 'package:flutter/material.dart';

class MenuOptionModel {
  String name = '';
  String packageName = '';
  int iconCodePoint = 0;

  MenuOptionModel(name, packageName, IconData icon) {
    this.name = name;
    this.packageName = packageName;
    this.iconCodePoint = icon.codePoint;
  }

  MenuOptionModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        packageName = json['packageName'],
        iconCodePoint = json['iconCodePoint'];

  static Map<String, dynamic> toMap(MenuOptionModel option) => {
        'name': option.name,
        'packageName': option.packageName,
        'iconCodePoint': option.iconCodePoint
      };

  static String encode(List<MenuOptionModel> menuUptions) => json.encode(
        menuUptions
            .map<Map<String, dynamic>>(
                (option) => MenuOptionModel.toMap(option))
            .toList(),
      );

  static List<MenuOptionModel> decode(String menuOptionModelString) =>
      (json.decode(menuOptionModelString) as List<dynamic>)
          .map<MenuOptionModel>((option) => MenuOptionModel.fromJson(option))
          .toList();
}
