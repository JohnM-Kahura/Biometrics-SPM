import 'package:desktop/config/style.dart';
import 'package:desktop/pages/home/home.dart';
import 'package:desktop/pages/settings/settings.dart';
import 'package:desktop/pages/verify/verify.dart';
import 'package:desktop/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AppContainer extends StatefulWidget {
  const AppContainer({Key? key}) : super(key: key);

  @override
  State<AppContainer> createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  int selectedIndex = 0;
bool isAuthenticated=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
             
                NavigationRail(
                  extended: true,
                  leading: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset(
                          'assets/team_logo.png',
                          height: 60,
                          width: 180,
                          color: Colors.white,
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                    ],
                  ),
                  selectedIconTheme: const IconThemeData(
                    color: Colors.white,
                 
                  ),
                  backgroundColor: const Color.fromARGB(255, 11, 11, 61),
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (index) => setState(() {
                    selectedIndex = index;
                  }),
                  destinations: [
                    NavigationRailDestination(
                      icon: const  Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Register user',
                        style: sideMenuText,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    NavigationRailDestination(
                        icon: const  Icon(Icons.verified, color: Colors.white),
                        label: Text(
                          'Verification',
                          style: sideMenuText,
                          overflow: TextOverflow.ellipsis,
                        )),
                    NavigationRailDestination(
                        icon: const Icon(Icons.settings,color: Colors.white,),
                        label: Text(
                          'Settings',
                          style: sideMenuText,
                          overflow: TextOverflow.ellipsis,
                        )),
                  ],
                ),
                Expanded(
                  child: buildPages(),
                ), 
              ],
            ),
          ),
          Container(
            height: 60,
            width: double.infinity,
            color: Colors.blue,
            child: const  BottomTab(),
          ),
        ],
      ),
    );
  }

  buildPages() {
    switch (selectedIndex) {
      case 0:
        return const  Home();
      case 1:
        return const  UserVerification();
      case 2:
        return const  Settings();
    }
  }
}
