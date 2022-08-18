import 'dart:io';
import 'package:desktop/container/container.dart';
import 'package:desktop/pages/auth/auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:desktop_window/desktop_window.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
//   if(!kIsWeb&& Platform.isMacOS||Platform.isWindows||Platform.isLinux){
//  await  DesktopWindow.setMinWindowSize(const Size(900,500));

//   }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isAuthenticated=false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alter Tech Biometrics',
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: !isAuthenticated? Auth():AppContainer(),
    );
  }
}

