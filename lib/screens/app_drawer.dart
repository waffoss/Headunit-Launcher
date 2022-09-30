import 'package:flutter/material.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:installed_apps/app_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  bool _isShowingSystemAppsInAppDrawer = false;

  @override
  void initState() {
    super.initState();
    _getShowingSystemAppsInAppDrawer();
  }

  void _getShowingSystemAppsInAppDrawer() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isShowingSystemAppsInAppDrawer =
          (prefs.getBool('isShowingSystemAppsInAppDrawer') ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Row(
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
                'Apps',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
              const Spacer()
            ],
          ),
          Expanded(
            child: FutureBuilder<List<AppInfo>>(
              future: InstalledApps.getInstalledApps(
                  _isShowingSystemAppsInAppDrawer, true),
              builder: (BuildContext context,
                  AsyncSnapshot<List<AppInfo>> snapshot) {
                return snapshot.connectionState == ConnectionState.done
                    ? snapshot.hasData
                        ? ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (iContext, index) {
                              AppInfo app = snapshot.data![index];
                              return Card(
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    child: Image.memory(app.icon!),
                                  ),
                                  title: Text(
                                    app.name!,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onTap: () =>
                                      InstalledApps.startApp(app.packageName!),
                                ),
                              );
                            })
                        : const Center(
                            child: Text(
                                "Error occurred while getting installed apps ...."))
                    : const Center(child: Text("Getting installed apps ...."));
              },
            ),
          )
        ],
      ),
    ));
  }
}
