import 'package:desktop/config/style.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: 250,
      color: const Color.fromARGB(255, 26, 24, 24),
      height: double.infinity,
      child: Column(
        children:   [
          Row(
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
          ListTile(leading: const Icon(Icons.home,color: Colors.white,),title: Text('Register users',style: sideMenuText,overflow: TextOverflow.ellipsis,),),
          ListTile(leading: const Icon(Icons.verified,color: Colors.white,),title: Text('Verify users',style: sideMenuText,overflow: TextOverflow.ellipsis,),),
          // ListTile(leading: const Icon(Icons.person),title: Text('Account',style: TextStyle(color: Colors.white,),overflow: TextOverflow.ellipsis,),),
          ListTile(leading: const Icon(Icons.settings,color: Colors.white,),title: Text('Settings',style: sideMenuText,overflow: TextOverflow.ellipsis,),),
          

        ],
      ),
    );
  }
}
