import 'package:desktop/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                SideMenu(),
                // home page
                // have to check if is authenticated
              ],
            ),
          ),
          Container(
            height: 60,
            width: double.infinity,
            color: Colors.blue,
            child: BottomTab(),
          ),
        ],
      ),
    );
  }
}
