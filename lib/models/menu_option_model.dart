import 'dart:convert';

import 'package:flutter/material.dart';

class MenuOptionModel {
  String name = '';
  String packageName = '';
  String base64Image = '';

  MenuOptionModel(this.name, this.packageName, this.base64Image);

  MenuOptionModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        packageName = json['packageName'],
        base64Image = json['base64Image'];

  static Map<String, dynamic> toMap(MenuOptionModel option) => {
        'name': option.name,
        'packageName': option.packageName,
        'base64Image': option.base64Image
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
