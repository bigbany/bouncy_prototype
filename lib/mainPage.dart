
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_bouncy/VerifyEmailPage.dart';
import 'package:flutter_application_bouncy/loggedPage.dart';
import 'package:flutter_application_bouncy/unSignedPage.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
      
        builder: (context, snapshot) {
            //snapshot stream의 결과물

          if(snapshot.hasData){
              return VerifyEmailPage();
              // return loggedPage();
              // 만약 email 없어도 넘어가게 할려면 위에 껄로
          }else{
        return UnSignedPage();
          }
        }
        )
      
    );
  }
}