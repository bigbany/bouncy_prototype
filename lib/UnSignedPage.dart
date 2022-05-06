import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'loggedPage.dart';

class UnSignedPage extends StatelessWidget {
  const UnSignedPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      
      title: Text("UnSigendPage"),
      
    ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              Get.toNamed("/loggedPage");
            }, child: Text("already signed in")),
            ElevatedButton(onPressed: (){
              Get.toNamed("signInPage");
            }, child: Text("sign in")),
            ElevatedButton(onPressed: (){
              Get.toNamed("/signUpPage");
            }, child: Text("sign up")),
            
          ]),)  );
  }
}