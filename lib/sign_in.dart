import 'package:flutter/material.dart';
import 'package:training_1/logo.dart';
import 'package:training_1/sign_up.dart';
import 'package:training_1/enums.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {
  bool? isRememberPassword = true;

  final Gradient gradient = const LinearGradient(
    colors: [Color(0xFFFE7B43), Color(0xFFF53371)],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    // bool? isRememberPassword = true;

    Widget signInTitle() {
      return const Text(
        'SIGN IN',
        style: TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.w900),
      );
    }

    Widget inputField(InputFieldType type) {
      String hint =
          type == InputFieldType.email ? 'Enter Email' : 'Enter Password';
      bool obscure = type == InputFieldType.email ? false : true;
      return TextField(
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.white),
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            border: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            isDense: true,
            contentPadding: const EdgeInsets.only(bottom: 6)),
        cursorColor: Colors.white,
        style: const TextStyle(color: Colors.white, fontSize: 16),
        obscureText: obscure,
      );
    }

    Widget rememberPassword() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Transform.scale(
              scale: 0.85,
              child: Checkbox(
                  value: isRememberPassword,
                  onChanged: (bool? value) {
                    setState(() {
                      isRememberPassword = value;
                    });
                  },
                  side: const BorderSide(
                    color: Colors.white, //your desire colour here
                    width: 1.5,
                  ),
                  activeColor: const Color(0xFFFD7849))),
          const Text('Remember Password',
              style: TextStyle(color: Colors.white, fontSize: 12))
        ],
      );
    }

    Widget signInButton(double width, double height) {
      return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          fixedSize: Size(width, height),
          onPrimary: const Color(0xFFFA5C57),
        ),
        child: ShaderMask(
          blendMode: BlendMode.modulate,
          shaderCallback: (size) => gradient.createShader(
            Rect.fromLTWH(0, 0, size.width, size.height),
          ),
          child: const Text(
            'GET STARTED',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
        ),
      );
    }

    Widget socialSignInButton(SocialType type) {
      String imgSource = type == SocialType.facebook
          ? 'assets/images/facebook.png'
          : 'assets/images/twitter.png';
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          primary: Colors.white,
          fixedSize: const Size(60, 60),
          onPrimary: const Color(0xFFFA5C57),
        ),
        child: ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (size) => gradient.createShader(
            Rect.fromLTWH(0, 0, size.width, size.height),
          ),
          child: Image.asset(imgSource, width: 25),
        ),
        onPressed: () {},
      );
    }

    Widget socialSignIn() {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              socialSignInButton(SocialType.facebook),
              socialSignInButton(SocialType.twitter),
            ],
          ));
    }

    Widget forgotPassword() {
      return TextButton(
          onPressed: () {},
          style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent)),
          child: const Text('FORGOT PASSWORD?',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  decoration: TextDecoration.underline,
                  decorationThickness: 1.5)));
    }

    Widget signUp(BuildContext context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('DON\'T HAVE ACCOUNT ? ',
              style: TextStyle(
                  color: Color(0xFFE85D4E),
                  fontSize: 12,
                  fontWeight: FontWeight.w700)),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpScreen()),
                );
              },
              style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent)),
              child: const Text('SIGN UP',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                      decorationThickness: 1.5)))
        ],
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: Stack(
        children: <Widget>[
          Container(
            height: screenHeight,
            width: screenWidth,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFFE7B43), Color(0xFFF53371)])),
          ),
          Stack(
            children: [
              Container(
                height: screenHeight,
                width: screenWidth,
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 60),
                    Logo(width: screenWidth / 2.4),
                    const SizedBox(height: 20),
                    signInTitle(),
                    const SizedBox(height: 40),
                    inputField(InputFieldType.email),
                    const SizedBox(height: 40),
                    inputField(InputFieldType.password),
                    const SizedBox(height: 15),
                    rememberPassword(),
                    const SizedBox(height: 15),
                    signInButton(screenWidth * 0.8, 56),
                    const SizedBox(height: 20),
                    socialSignIn(),
                    const SizedBox(height: 5),
                    forgotPassword()
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Container(
                  width: screenWidth,
                  height: 60,
                  color: const Color(0xFFCB1F51),
                  child: signUp(context),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
