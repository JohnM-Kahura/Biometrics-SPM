import 'dart:io';
import 'package:desktop/container/container.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:desktop_window/desktop_window.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(!kIsWeb&& Platform.isMacOS||Platform.isWindows||Platform.isLinux){
 await  DesktopWindow.setMinWindowSize(const Size(600,800));

  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alter Tech Biometrics',
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const AppContainer(),
    );
  }
}

