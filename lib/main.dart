import 'package:flutter/material.dart';
import 'package:flutter_application_bouncy/signInPage.dart';
import 'package:flutter_application_bouncy/signUpAndIn/signUpPageAdditionalInfo.dart';
import 'package:flutter_application_bouncy/signUpPage.dart';
import 'package:flutter_application_bouncy/signedPage.dart';
import 'package:get/get.dart';
import 'unSignedPage.dart';

void main() => runApp(MyApp());
// 최초의 위젯 진입점

// 함수는 소문자로 위젯은 대문자로 시작
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // GetMaterialApp 으로 덮는다.
      title: 'Bouncy',
      theme: ThemeData(
        primarySwatch: Colors.green
        ),
      // home: UnSignedPage(), 
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: ()=> UnSignedPage(),transition: Transition.noTransition),
        GetPage(name: "/signedPage", page: ()=> signedPage(),
        transition: Transition.noTransition, popGesture: true),
        GetPage(name: "/signInPage", page: ()=> signInPage(),
        transition: Transition.noTransition,popGesture: true),
        GetPage(name: "/signUpPage", page: ()=> signUpPage(),
        transition: Transition.noTransition,popGesture: true),
        GetPage(name:"/signUpPage_2",page:()=>signUpPageAdditionalInfo(),
        transition: Transition.noTransition,popGesture: true),
        
      ] 


      );
    
  }
}