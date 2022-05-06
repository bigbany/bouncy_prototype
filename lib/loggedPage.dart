import 'package:flutter/material.dart';
import 'package:flutter_application_bouncy/components/homeButton.dart';
import 'package:flutter_application_bouncy/components/logOutButton.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class loggedPage extends StatefulWidget {
  const loggedPage({ Key? key }) : super(key: key);

@override
  State<loggedPage> createState() => loggedPageState();}

class loggedPageState extends State<loggedPage> {
  final authenticationLogged = FirebaseAuth.instance;
  User? loggedUser;
  String? UserEmail;

  @override
  void initState(){
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser(){
    try{
      final user = authenticationLogged.currentUser;
      if(user !=null){
        loggedUser = user;
        print(loggedUser!.email);
        UserEmail= loggedUser!.email;
        }
      }catch(e){
        print(e);
      }
    }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("signedPage"), 
        automaticallyImplyLeading: false,
    ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Text('${UserEmail}님 환영합니다.'),
            ),
            logOutButton(),

            ElevatedButton(onPressed: (){
             Get.toNamed("/toolAndWorkerPage"); 
            }, child: Text("공구& 사원확인"))
            ,
            ElevatedButton(onPressed: (){
              Get.toNamed('/nfcTestPage');

            }, child: Text('NFC TEST')),
            ElevatedButton(onPressed: (){
              Get.offAllNamed("/");
            }, child: Text("tohome")),
            homeButton(callfrom: "alreadySigned")
          ]),)  );
  }
}
