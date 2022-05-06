import 'package:flutter/material.dart';
import 'package:flutter_application_bouncy/style/style.dart';

InputDecoration signUpTextFormFieldDecorationEmail(String label ) {
  return InputDecoration(
      fillColor: white_1,
      focusedBorder: OutlineInputBorder(
          //focused 되었을때 스타일
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: blue_600, width: 2.0)),
      enabledBorder: OutlineInputBorder(
          // focused 안됬을때 스타일
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: blue_400, width: 1.0)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          // focused 되었을때 에러 스타일
          borderSide: const BorderSide(color: blue_600, width: 2.0)),
      errorBorder: OutlineInputBorder(
        // focused 해제된 에러스타일
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: blue_600, width: 2.0)),
      errorStyle: TextStyle(color: blue_400),
      // 에러 텍스트 스타일
      labelText: label,
      labelStyle: TextStyle(color: blue_500),
      hintText: 'enter your ${label}',
      hintStyle: TextStyle(color: blue_500)
      // 힌트 텍스트 및 스타일
      );
}

InputDecoration signUpTextFormFieldDecorationPassword(String label, bool obscureOption, VoidCallback obscureOptionSwitch  ) {
  return InputDecoration(
      fillColor: white_1,
      focusedBorder: OutlineInputBorder(
          //focused 되었을때 스타일
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: blue_600, width: 2.0)),
      enabledBorder: OutlineInputBorder(
          // focused 안됬을때 스타일
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: blue_400, width: 1.0)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          // focused 되었을때 에러 스타일
          borderSide: const BorderSide(color: blue_600, width: 2.0)),
      errorBorder: OutlineInputBorder(
        // focused 해제된 에러스타일
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: blue_600, width: 2.0)),
      errorStyle: TextStyle(color: blue_400),
      // 에러 텍스트 스타일
      labelText: label,
      labelStyle: TextStyle(color: blue_500),
      hintText: 'enter your ${label}',
      hintStyle: TextStyle(color: blue_500),
      suffixIcon:  IconButton(
        onPressed: obscureOptionSwitch,
        color: blue_500,
        icon: obscureOption ? Icon(Icons.lock) : Icon(Icons.remove_red_eye))
      // 힌트 텍스트 및 스타일
      );
}
