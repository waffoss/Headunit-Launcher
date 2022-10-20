import 'dart:convert';

import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hl/models/menu_option_model.dart';
import 'package:hl/view_models/dashboard_view_model.dart';
import 'package:provider/provider.dart';
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
            child: FutureBuilder<List<Application>>(
              future: DeviceApps.getInstalledApplications(
                  includeSystemApps: _isShowingSystemAppsInAppDrawer,
                  includeAppIcons: true,
                  onlyAppsWithLaunchIntent: true),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Application>> snapshot) {
                return snapshot.connectionState == ConnectionState.done
                    ? snapshot.hasData
                        ? GridView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (iContext, index) {
                              ApplicationWithIcon app =
                                  snapshot.data![index] as ApplicationWithIcon;
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Image.memory(app.icon!),
                                ),
                                title: Text(
                                  app.appName,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                onTap: () =>
                                    DeviceApps.openApp(app.packageName!),
                                onLongPress: () => addAppToDrawer(context, app),
                              );
                            },
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200,
                                    childAspectRatio: 4 / 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10),
                          )
                        : const Center(
                            child: Text(
                                "Error occurred while getting installed apps ...."))
                    : const Center(
                        child: SpinKitFadingFour(
                        color: Colors.orange,
                        size: 50,
                      ));
              },
            ),
          )
        ],
      ),
    ));
  }

  addAppToDrawer(BuildContext context, ApplicationWithIcon app) {
    Provider.of<DashboardViewModel>(context, listen: false).addItem(
        MenuOptionModel(app.appName ?? "", app.packageName ?? "",
            base64Encode(List.from(app.icon!))));
  }
}
