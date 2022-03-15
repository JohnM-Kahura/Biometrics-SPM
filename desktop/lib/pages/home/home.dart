import 'package:desktop/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController studentIDController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 227, 227),
      appBar: AppBar(
        elevation: 0,
      ),
      body: Row(children: [
        Container(
          // color: Colors.red,
          height: double.infinity,
          width: MediaQuery.of(context).size.width / 3.2,
          child: Column(
            children: [
              customTextFeild(50, double.infinity, 'First name',
                  firstnameController, TextInputType.name),
              customTextFeild(50, double.infinity, 'Last name',
                  lastnameController, TextInputType.name),
              customTextFeild(50, double.infinity, 'StudentID',
                  studentIDController, TextInputType.name),
            ],
          ),
        ),
        Container(
          // color: Colors.amber,
          height: double.infinity,
          width: MediaQuery.of(context).size.width / 2.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.grey,
                width: 250,
                height: 250,
                child: const  Icon(
                  Icons.fingerprint,
                  size: 150,
                  color: Colors.green,
                ),
              ),
              Container(
                width: 250,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),
                child: Column(children: [
                Row(children: [Text('Status:'),Text('Sucess')],),
                Row(children: [Text('Output:'),Text('Finger print scan done')],),
              ],)),
            ],
          ),
        )
      ]),
    );
  }
}
