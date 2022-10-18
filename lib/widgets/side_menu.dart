import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hl/screens/app_drawer.dart';
import 'dart:async';

import 'package:intl/intl.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  String? _timeString;

  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.black),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Row(children: [
        Text(
          _timeString!,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        GestureDetector(
          child: Icon(
            Icons.settings_applications_rounded,
            color: Colors.grey,
            size: 50,
          ),
          onTap: () => _openApps(context),
        ),
        GestureDetector(
          child: Icon(
            Icons.apps_rounded,
            color: Colors.grey,
            size: 50,
          ),
          onTap: () => _openApps(context),
        ),
      ]),
    );
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('hh:mm').format(dateTime);
  }

  _openApps(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const AppDrawer()));
  }
}
