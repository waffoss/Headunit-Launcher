import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hl/screens/app_drawer.dart';
import 'dart:async';

import 'package:intl/intl.dart';
import 'package:nowplaying/nowplaying.dart';
import 'package:provider/provider.dart';

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
    NowPlaying.instance.isEnabled().then((bool isEnabled) async {
      if (!isEnabled) {
        final shown = await NowPlaying.instance.requestPermissions();
        print('MANAGED TO SHOW PERMS PAGE: $shown');
      }
    });
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
        StreamProvider<NowPlayingTrack>.value(
          value: NowPlaying.instance.stream,
          initialData: NowPlayingTrack(title: ''),
          child: Consumer<NowPlayingTrack>(builder: (context, track, _) {
            if (track == null) return Container();
            return Text(track.title ?? '');
          }),
        ),
        Spacer(),
        GestureDetector(
          child: Icon(
            Icons.settings_rounded,
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
