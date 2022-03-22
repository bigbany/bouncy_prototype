import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/homeButton.dart';

class signInPage extends StatelessWidget {
  const signInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("signInPage"),
          automaticallyImplyLeading: false,
        ),
        body: Center( 
          child: Column(children: [
            Text("1"),
            Text("2"),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.offNamed("/signUpPage", arguments: "from signIn");
                },
                child: Text("goto sign up")),
            homeButton(callfrom: "signInPage")
            
          ]),
        ));
  }
} 

