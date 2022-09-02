import 'package:flutter/material.dart';

import '../constatnts.dart';

Widget movieList({title, poster,released}) {
  return ListTile(
    title: Text(title),
    subtitle: Text(released),
    leading: Image.network(poster),
  );
}

Widget myDivider() {
  return Divider(
    color: MyColor,
    indent: 15,
    endIndent: 15,
  );
}

Widget defaultButton({
  double wid = double.infinity,
  double r = 10.0,
  required String text,
  bool isUpper = true,
  Color color = Colors.blue,
  required function,
}) =>
    Container(
      width: wid,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(
          r,
        ),
      ),
      child: FlatButton(
        onPressed: function,
        child: Text(
          isUpper ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

Widget defaultFormField({
  //Validation is not correct
  //required Function validate,
  @required controller,
  @required label,
  @required prefix,
  enable,
  @required type,
  suffix,
  suffixPressed,
  hint = '',
  onTap,
  onSubmit,
  onChange,
  isPassword = false,
}) =>
    Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          20.0,
        ),
        border: Border.all(
          color: MyColor,
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      child: TextFormField(
        enabled: enable,
        cursorColor: MyColor,
        //Validation is not correct
        //validator:validate ,
        onFieldSubmitted: onSubmit,
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        onChanged: onChange,
        onTap: onTap,
        decoration: InputDecoration(
          label: Text(
            label,
            style: TextStyle(color: MyColor),
          ),
          prefixIcon: Icon(
            prefix,
            color: MyColor,
          ),
          hintText: hint,
          border: InputBorder.none,
          suffixIcon: IconButton(
            icon: Icon(
              suffix,
              color: MyColor,
            ),
            onPressed: suffixPressed,
          ),
        ),
      ),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateToAndReplacement(context, widget) => Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void printFullText(text) {
  final pattern = RegExp('.{1.800}');
  pattern.allMatches(text).forEach((element) {
    print(element.group(0));
  });
}
