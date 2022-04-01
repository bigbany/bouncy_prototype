import 'package:flutter/material.dart';
import 'package:path/path.dart';

// class signUp extends StatefulWidget {
//   const signUp({ Key? key }) : super(key: key);

//   @override
//   State<signUp> createState() => _signUpState();
// }

// class _signUpState extends State<signUp> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//     );
//   }
// }

signUpTextFormField({
  // signUpTextFormField로 만든다.
  required String? label,
  required FormFieldSetter? onSaved,
  required FormFieldValidator? validator,
  required TextInputAction? textInputAction,
  required VoidCallback? onTapIconButton,
  required bool? obscureOption
}) {
  // obscureOption 여부를 다룰 변수

  // if (label == '비밀번호' || label == '비밀번호 확인') {
  //   obscureOption = true;
  // }


  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        label!.contains('비밀번호')
            ? Stack(
              children: <Widget>[
                SizedBox(
                  height: 80,
                  child: Center(
                    
                    child: TextFormField(
                      
                      // autofocus: label == '이메일' ? true : false,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 36, 104, 38),
                                  width: 2.0)),
                          enabledBorder: OutlineInputBorder(
                              // focused 안됬을때 style
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Colors.green, width: 1.0)),
                          labelText: label,
                          hintText: 'enter your ${label}'),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onSaved: onSaved,
                      validator: validator,
                      textInputAction: textInputAction,
                      // 키보드 밑에  아이콘? 다음 (next): done
                      obscureText: obscureOption!,
                    ),
                  ),
                ),
                Positioned(
                  top:12.5 ,
                  right: -5,
                  child: IconButton(onPressed: onTapIconButton 
                  , icon: Icon(Icons.lock)),
                )
              ])
            : TextFormField(
                autofocus: true,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                            color: const Color.fromARGB(255, 36, 104, 38),
                            width: 2.0)),
                    enabledBorder: OutlineInputBorder(
                        // focused 안됬을때 style
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            const BorderSide(color: Colors.green, width: 1.0)),
                    labelText: label,
                    hintText: 'enter your ${label}'),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onSaved: onSaved,
                validator: validator,
                textInputAction: textInputAction,
                // 키보드 밑에  아이콘? 다음 (next): done
                // obscureText: obscureOption ?? false,
              ),
      ],
    ),
  );
}

// TextFormField(
//         autofocus: label == '이메일' ? true : false,
//         decoration: InputDecoration(
//             fillColor: Colors.white,
//             focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8),
//                 borderSide: BorderSide(
//                     color: Color.fromARGB(255, 36, 104, 38), width: 2.0)),
//             enabledBorder: OutlineInputBorder(
//               // focused 안됬을때 style
//                 borderRadius: BorderRadius.circular(8),
//                 borderSide: BorderSide(color: Colors.green, width: 1.0)),
//             labelText: label,
//             hintText: 'enter your ${label}'),
//         autovalidateMode: AutovalidateMode.onUserInteraction,
//         onSaved: onSaved,
//         validator: validator,
//         textInputAction: textInputAction,
//         // 키보드 밑에  아이콘? 다음 (next): done
//         obscureText: obscureOption ?? false,
//       ),
