import 'package:flutter/material.dart';
import 'package:get/get.dart';

class homeButton extends StatelessWidget {
  final String? callfrom;
  // 호출되는 위치
  const homeButton({ Key? key, @required this.callfrom }) : super(key: key);
// requied 키워드를 통해서 지정해야한다. 
  

  @override
    Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      Get.offAllNamed("/");
      print("homeButton is clicked from ${callfrom??"empty"}");
    },
     child: Text('Home Button'),
     style: ElevatedButton.styleFrom(
       primary: Color.fromARGB(235, 214, 18, 18),
       shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
       elevation: 0.0
     ),);  }
}