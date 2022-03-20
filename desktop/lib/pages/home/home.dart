import 'package:desktop/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController middlenameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController studentIDController = TextEditingController();
  bool fieldsMissing = false;
  bool badRequest = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 227, 227),
      appBar: AppBar(
        elevation: 0,
        title: const Center(child: Text('User Registration')),
      ),
      body: Row(children: [
        SizedBox(
          height: double.infinity,
          width: MediaQuery.of(context).size.width / 3.2,
          child: Column(
            children: [
              customTextFeild(50, double.infinity, 'First name',
                  firstnameController, TextInputType.name, false),
              customTextFeild(50, double.infinity, 'Middle name',
                  middlenameController, TextInputType.name, false),
              customTextFeild(50, double.infinity, 'Last name',
                  lastnameController, TextInputType.name, false),
              customTextFeild(50, double.infinity, 'StudentID',
                  studentIDController, TextInputType.name, false),
              if (fieldsMissing)
                const Text(
                  'Some Required info is missing',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              if (badRequest)
                const Text(
                  'Bad Request check the data being posted',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: TextButton(
                  onPressed: () async {
                    var url = Uri.parse('http://127.0.0.1:8000/api/');

                    if (firstnameController.text.isNotEmpty &&
                        middlenameController.text.isNotEmpty &&
                        lastnameController.text.isNotEmpty &&
                        studentIDController.text.isNotEmpty) {
                      var response = await http.post(url, body: {
                        'firstname': firstnameController.text,
                        'middlename': middlenameController.text,
                        'lastname': lastnameController.text,
                        'studentID': studentIDController.text,
                        //TODO: send the fingerprint object here later
                      });
                      if (response.statusCode == 201) {
                        // ignore: deprecated_member_use
                        Scaffold.of(context).showSnackBar(const SnackBar(
                          content: Text('User Registration Successfull'),
                          duration: Duration(seconds: 1),
                          backgroundColor: Colors.green,
                        ));
                      }
                      if (response.statusCode != 201) {
                        setState(() {
                          badRequest = true;
                        });
                      }
                    }
                    if (firstnameController.text.isEmpty ||
                        middlenameController.text.isEmpty ||
                        lastnameController.text.isEmpty ||
                        studentIDController.text.isEmpty) {
                      setState(() {
                        fieldsMissing = true;
                      });
                    }
                  },
                  child: const Text(
                    'Register',
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
        SizedBox(
          height: double.infinity,
          width: MediaQuery.of(context).size.width / 2.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.grey,
                width: 250,
                height: 250,
                child: const Icon(
                  Icons.fingerprint,
                  size: 150,
                  color: Colors.green,
                ),
              ),
              Container(
                  width: 250,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Column(
                    children: [
                      Row(
                        children: const [Text('Status:'), Text('Sucess')],
                      ),
                      Row(
                        children: const [
                          Text('Output:'),
                          Text('Finger print scan done')
                        ],
                      ),
                    ],
                  )),
            ],
          ),
        )
      ]),
    );
  }
}
