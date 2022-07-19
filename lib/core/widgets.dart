import 'package:flutter/material.dart';

class BackBox extends StatelessWidget {

  const BackBox({
    this.child,
    required this.width,
    required this.height,
    this.color,
    Key? key,
  }) : super(key: key);
  final double width;
  final double height;
  final Color? color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3f000000),
            blurRadius: 4,
            spreadRadius: 4,
            offset: Offset(0, 4),
          ),
          BoxShadow(
            color: Color(0x3f000000),
            blurRadius: 4,
            spreadRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
        color: color,
      ),
      child: child,
    );
  }
}

class SpecialText extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const SpecialText({
    this.size,
    required this.text,
  });
  final String text;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.w600,
          fontFamily: 'Josefin Sans',
          color: Colors.black45),
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({
    required this.controller,
    this.suffixicon,
    required this.obsecure,
    required this.hinttext,
    Key? key,
  }) : super(key: key);
  final String hinttext;
  final bool obsecure;
  final Widget? suffixicon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      height: 50,
      child: TextFormField(
        controller: controller,
        style: const TextStyle(color: Colors.black),
        obscureText: obsecure,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          suffixIcon: suffixicon,
          suffixIconColor: Colors.black,
          fillColor: const Color.fromRGBO(217, 217, 217, 0.7),
          filled: true,
          hintText: hinttext,
          hintTextDirection: TextDirection.ltr,
          hintStyle: const TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontFamily: 'Josefin Sans'),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(width: 1.0, color: Colors.black)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(width: 1.0, color: Colors.black),
          ),
        ),
      ),
    );
  }
}

class SpecialButton extends StatelessWidget {
  const SpecialButton({
    required this.text,
    Key? key,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 55,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          color: Color.fromRGBO(217, 217, 217, 1)),
      child: Padding(
        padding: const EdgeInsets.only(top: 13, left: 30),
        child: Text(text,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontFamily: 'Josefin Sans',
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}