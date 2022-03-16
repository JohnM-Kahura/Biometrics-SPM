import 'package:desktop/config/style.dart';
import 'package:flutter/material.dart';

class BottomTab extends StatefulWidget {
  const BottomTab({Key? key}) : super(key: key);

  @override
  State<BottomTab> createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  bool scannerConnected=true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      color: Colors.blue,
      child: Row(
        children: [
          const Icon(
            Icons.person,
            size: 40,
            color: Colors.white,
          ),
          Container(
            margin: const EdgeInsets.only(left: 0, top: 20, bottom: 20),
            child: Row(
              children: [
                Text(
                  "Logged in as:",
                  style: bottomTabLeading,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: Text(
                    "Admin",
                    style: bottomTabUserInfo,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Text(
                    "Email:",
                    style: bottomTabLeading,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    "johnmungai392@gmail.com",
                    style: bottomTabUserInfo,
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Logout',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
            ),
          ),
          Container(
            padding:const  EdgeInsets.all(10),
            margin: EdgeInsets.only(left:MediaQuery.of(context).size.width-800),
            decoration: BoxDecoration(

            color:scannerConnected? Colors.green:Colors.red,
            borderRadius: BorderRadius.circular(10)
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right:10.0),
                  child: Text('Scanner:' ,style: bottomTabLeading,),
                ),
                Text(scannerConnected?'Connected':'Could not detect scanner'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
