import 'package:desktop/container/container.dart';
import 'package:desktop/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';


class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool loginError = false;
  bool feildEmpty=false;
//   saveData(String username) async{
// // final prefs = await SharedPreferences.getInstance();
// await prefs.setString('username', username);


//   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 230, 230),
      body: Center(
        child: SizedBox(
          height: 500,
          width: MediaQuery.of(context).size.width / 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customTextFeild(50, double.infinity, 'Username',
                  usernameController, TextInputType.emailAddress, false),
              customTextFeild(50, double.infinity, 'Password',
                  passwordController, TextInputType.visiblePassword, true),
                  if(feildEmpty)
                  const  Text('Fill in the login fields above',style: TextStyle(
                color: Colors.red,fontWeight: FontWeight.bold,
              ),),
                  if(loginError)
                  const  Text('No active account found with the given credentials.Try Again',style: TextStyle(
                color: Colors.red,fontWeight: FontWeight.bold,
              ),),
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: TextButton(
                  onPressed: () async {
                    var url = Uri.parse('http://127.0.0.1:8000/api/token/');
                    if (usernameController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty) {
                      var response = await http.post(url, body: {
                        'username': usernameController.text,
                        'password': passwordController.text
                      });
                      if (response.statusCode == 200) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AppContainer()));

                                // saveData(usernameController.text);
                      }
                      if (response.statusCode != 200) {
                        setState(() {
                          loginError = true;
                        });
                      }
                      print('Response status: ${response.statusCode}');
                      print('Response body: ${response.body}');
                    }
                    if (usernameController.text.isEmpty ||
                        passwordController.text.isEmpty) {
setState(() {
  feildEmpty=true;
});
                        }
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
             
            ],
          
          ),
        ),
      ),
    );
  }
}
