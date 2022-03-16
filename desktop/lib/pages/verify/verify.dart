import 'package:desktop/config/style.dart';
import 'package:flutter/material.dart';

class UserVerification extends StatefulWidget {
  const UserVerification({Key? key}) : super(key: key);

  @override
  State<UserVerification> createState() => _UserVerificationState();
}

class _UserVerificationState extends State<UserVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title:  const Center(child: Text('User verification')),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          SizedBox(
            height: double.infinity,
            // width: MediaQuery.of(context).size.width / 2.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)),
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
          ),
          Container(
            // height: 200,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(children: [
              const Icon(Icons.person, size: 50),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Text(
                        'Name:',
                        style: titleStyle,
                      ),
                    ),
                    Text(
                      'John Mungai Fanga',
                      style: bottomTabUserInfo,
                    )
                  ],
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Text(
                        'StudentID:',
                        style: titleStyle,
                      ),
                    ),
                    Text(
                      'SJTD@2010',
                      style: bottomTabUserInfo,
                    )
                  ],
                ),
              ),
              const Icon(
                Icons.verified,
                size: 50,
                color: Colors.green,
              )
            ]),
          ),
        ],
      ),
    );
  }
}
