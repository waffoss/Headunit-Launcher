import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<bool> _isShowingSystemAppsInAppDrawer;

  @override
  void initState() {
    super.initState();
    _isShowingSystemAppsInAppDrawer = _prefs.then((SharedPreferences prefs) {
      if (!prefs.containsKey('isShowingSystemAppsInAppDrawer')) {
        prefs.setBool('isShowingSystemAppsInAppDrawer', false);
      }
      return prefs.getBool('isShowingSystemAppsInAppDrawer') ?? false;
    });
  }

  Future<void> _setShowingSystemAppsInAppDrawer(bool value) async {
    final SharedPreferences prefs = await _prefs;

    setState(() {
      _isShowingSystemAppsInAppDrawer = prefs
          .setBool('isShowingSystemAppsInAppDrawer', value)
          .then((bool success) {
        return value;
      });
    });
  }

  void _aboutDialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("About"),
            content: Column(children: const [
              Text('Headunit Launcher'),
              Text('App version 0.0.0'),
              Text("Thu 29 Sep"),
              Text("Developed by Tsvetomir Tsvetkov"),
              Text("2022")
            ]),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 30),
        child: Column(
          children: [
            Container(
              color: Colors.black,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back,
                      size: 50,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    'Settings',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                  const Spacer()
                ],
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                const ListTile(
                  title: Text(
                    'Dashboard',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  shape: Border(bottom: BorderSide(color: Colors.white)),
                ),
                ListTile(
                    title: const Text(
                      'isShowingSystemAppsInAppDrawer',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    shape:
                        const Border(bottom: BorderSide(color: Colors.white)),
                    trailing: FutureBuilder<bool>(
                      future: _isShowingSystemAppsInAppDrawer,
                      builder:
                          (BuildContext ctx, AsyncSnapshot<bool> snapshot) {
                        return snapshot.hasData
                            ? Switch(
                                value: snapshot.data!,
                                activeColor: Colors.yellowAccent,
                                onChanged: (value) =>
                                    _setShowingSystemAppsInAppDrawer(value),
                              )
                            : const Text('Error');
                      },
                    )),
                ListTile(
                  title: const Text(
                    'About',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  shape: const Border(bottom: BorderSide(color: Colors.white)),
                  onTap: () => _aboutDialog(context),
                )
              ],
            ))
          ],
        ),
      ),
    ));
  }
}
