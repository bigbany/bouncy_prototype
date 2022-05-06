import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class logOutButton extends StatelessWidget {
  const logOutButton({ Key? key}) : super(key: key);

Future  signOut () async{

  try{
      await FirebaseAuth.instance.signOut();
        Get.offAllNamed('/');
  }catch(e){
print(e);
  }
}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(child: Text('log out'),
      onPressed: signOut
      ),
      
    );
  }
}