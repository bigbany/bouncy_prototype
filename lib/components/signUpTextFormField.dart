// import 'package:flutter/material.dart';
// import 'package:flutter_application_bouncy/style/signUpTextFormFieldDecoration.dart';
// import 'package:flutter_application_bouncy/style/style.dart';
// import 'package:path/path.dart';

// signUpTextFormField(
//     {
//     // signUpTextFormField로 만든다.
//     required String? label,
//     required FormFieldSetter? onSaved,
//     required FormFieldValidator? validator,
//     required TextInputAction? textInputAction,
//     required VoidCallback? onTapIconButton,
//     required bool? obscureOption}) {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: label!.contains('비밀번호')
//         ? Stack(children: <Widget>[
//             Container(
//               margin: EdgeInsets.only(top: 2),
//               height: 80,
//               child: TextFormField(
//                 showCursor: false,
//                 decoration: signUpTextFormFieldDecoration(label),
//                 autovalidateMode: AutovalidateMode.onUserInteraction,
//                 onSaved: onSaved,
//                 validator: validator,
//                 textInputAction: textInputAction,
//                 // 키보드 밑에  아이콘? 다음 (next): done
//                 obscureText: obscureOption!,
//               ),
//             ),
//             Positioned(
//               top: 12.5,
//               right: -5,
//               child: IconButton(
//                   onPressed: onTapIconButton,
//                   icon: obscureOption
//                       ? Icon(Icons.lock)
//                       : Icon(Icons.remove_red_eye)),
//             )
//           ])
//         : TextFormField(
//             autofocus: true,
//             showCursor: false,
//             decoration: signUpTextFormFieldDecoration(label),
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             onSaved: onSaved,
//             validator: validator,
//             textInputAction: textInputAction,
//             // 키보드 밑에  아이콘? 다음 (next): done
//             // obscureText: obscureOption ?? false,
//           ),
//   );
// }
