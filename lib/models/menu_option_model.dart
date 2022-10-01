import 'package:flutter/material.dart';

class MenuOptionModel {
  String name = '';
  String packageName = '';
  IconData? icon;
  Color? color;

  MenuOptionModel(name, packageName) {
    this.name = name;
    this.packageName = packageName;
  }

  MenuOptionModel.create(name, packageName, icon, color) {
    this.name = name;
    this.packageName = packageName;
    this.icon = icon;
    this.color = color;
  }
}
