import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/homeButton.dart';

class signUpPage extends StatefulWidget {
  const signUpPage({ Key? key }) : super(key: key);

  @override
  State<signUpPage> createState() => _signUpPageState();
}

class _signUpPageState extends State<signUpPage> {
// 회원가입 페이지
  @override
  Widget build(BuildContext context) {
     String? stateCode= Get.arguments;
     // argument를 받는 부분 
    return Scaffold( 
      appBar: AppBar(
        title: Text("signUpPage"),  automaticallyImplyLeading: false,
      ),
      body: Center(child: Column(children: [
        Text("1"),
        Text("2"),
        SizedBox( 
          height: 25, 
        ), 
        Text("state: ${stateCode?? 'basic route'} ")
        ,    
        ElevatedButton(onPressed: (){
          Get.offAllNamed("/");
        }, child: Text("toHome")),
          homeButton(callfrom: "signUpPage")
      ]),)
      
    );
  }
}
