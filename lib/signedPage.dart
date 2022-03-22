import 'package:flutter/material.dart';
import 'package:flutter_application_bouncy/components/homeButton.dart';
import 'package:get/get.dart';

class signedPage extends StatelessWidget {
  const signedPage({ Key? key }) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("signedPage"), 
        automaticallyImplyLeading: false,
    ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              Get.offAllNamed("/");
            }, child: Text("tohome")),
            homeButton(callfrom: "alreadySigned")
          ]),)  );
  }
  
}
