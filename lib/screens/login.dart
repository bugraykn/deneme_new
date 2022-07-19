import 'package:flutter/material.dart';
import 'package:prototype_app/screens/profile_screen.dart';

import '../core/widgets.dart';
import '../services/auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(217, 217, 217, 1),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: AppBar(
          flexibleSpace: Padding(
            padding: _Paddings.specialPaddingTop + _Paddings.specialPaddingLeft,
            child: const SpecialText(
              text: 'Welcome',
              size: 50,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: _Paddings.SpecialPaddingBox,
              child: BackBox(
                width: 350,
                height: 558,
                color: Colors.white,
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    const Padding(
                      padding: _Paddings.specialPaddingTop,
                      child: SpecialText(
                        text: 'Login',
                        size: 35,
                      ),
                    ),
                    Padding(
                      padding: _Paddings.SpacialPaddingEvery * 2,
                      child: MyTextField(
                        controller: _emailController,
                        obsecure: false,
                        hinttext: 'Email',
                      ),
                    ),
                    Padding(
                      padding: _Paddings.SpacialPaddingEvery,
                      child: MyTextField(
                        controller: _passwordController,
                        suffixicon: const Icon(Icons.visibility_off,
                            color: Colors.black),
                        obsecure: true,
                        hinttext: 'Password',
                      ),
                    ),
                    Padding(
                      padding: _Paddings.SpacialPaddingEvery * 3,
                      child: InkWell(
                        onTap: () {
                          _authService
                              .signIn(_emailController.text,
                                  _passwordController.text)
                              .then(
                            (value) {
                              return Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => const ProfileScreen()),
                                ),
                                (Route<dynamic> route) => false
                              );
                            },
                          );
                        },
                        child: const SpecialButton(
                          text: 'Sign In',
                        ),
                      ),
                    ),
                     Padding(
                      padding: _Paddings.specialPaddingTop % 40,
                      child:  _TextButtonWidget(
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Josefin Sans',
                            fontWeight: FontWeight.bold),
                        text: 'Or Login With',
                      ),
                    ),
                    Padding(
                      padding: _Paddings.specialPaddingTop % 20,
                      child: Row(
                        children:  <Widget>[
                          const Padding(
                            padding: _Paddings.specialPaddingLeft2,
                            child: _CircularButton(),
                          ),
                          Padding(
                            padding: _Paddings.specialPaddingLeft2 + _Paddings.specialPaddingTop,
                            child: const _CircularButton(),
                          ),
                          const Padding(
                            padding: _Paddings.specialPaddingLeft2,
                            child: _CircularButton(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _TextButtonWidget extends StatelessWidget {
  const _TextButtonWidget({
    required this.style,
    required this.text,
    Key? key,
  }) : super(key: key);
  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}

class _CircularButton extends StatelessWidget {
  const _CircularButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}

class _Paddings {
  static const specialPaddingTop = EdgeInsets.only(
    top: 60,
  );
  static const specialPaddingLeft2 = EdgeInsets.only(left: 25);
  static const specialPaddingLeft = EdgeInsets.only(left: 100);
  // ignore: constant_identifier_names
  static const SpecialPaddingBox = EdgeInsets.symmetric(horizontal: 40);
  // ignore: constant_identifier_names
  static const SpacialPaddingEvery = EdgeInsets.only(top: 20);
}


  
