import 'package:desktop/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  TextEditingController emailController= TextEditingController();
  TextEditingController passwordController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const  Color.fromARGB(255, 240, 230, 230),
      body: Center(
        child: SizedBox(
        
            
          height: 500,
          width: MediaQuery.of(context).size.width / 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            customTextFeild(50, double.infinity, 'Email', emailController, TextInputType.emailAddress,false),
            customTextFeild(50, double.infinity, 'Password', passwordController, TextInputType.visiblePassword,true),
            Container(
                margin: const EdgeInsets.only(top: 30),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      
                    });
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                ),
              ),
          ],),
        ),
      ),
    );
  }
}
