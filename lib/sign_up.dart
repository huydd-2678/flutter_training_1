import 'package:flutter/material.dart';
import 'package:training_1/logo.dart';
import 'package:training_1/enums.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final Gradient gradient = const LinearGradient(
    colors: [Color(0xFFFE7B43), Color(0xFFF53371)],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    Widget socialSignInButton(double width, double height, SocialType type) {
      String title = type == SocialType.facebook
          ? 'Sign in with Facebook'
          : 'Sign in with Twitter';
      String imgSource = type == SocialType.facebook
          ? 'assets/images/facebook.png'
          : 'assets/images/twitter.png';
      return ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            fixedSize: Size(width, height),
            onPrimary: const Color(0xFFFA5C57),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: ShaderMask(
                  blendMode: BlendMode.modulate,
                  shaderCallback: (size) => gradient.createShader(
                    Rect.fromLTWH(0, 0, size.width, size.height),
                  ),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ShaderMask(
                        blendMode: BlendMode.srcATop,
                        shaderCallback: (size) => gradient.createShader(
                          Rect.fromLTWH(0, 0, size.width, size.height),
                        ),
                        child: Image.asset(imgSource, width: 25),
                      ),
                      const SizedBox(
                        height: 30,
                        child: VerticalDivider(
                          color: Color(0xFFF53371),
                          thickness: 1,
                        ),
                      ),
                    ],
                  )),
            ],
          ));
    }

    Widget signUpButton(double width, double height) {
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
            'Sign Up',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
        ),
      );
    }

    Widget signInButton(BuildContext context) {
      return TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent)),
          child: const Text('ALREADY REGISTERED? SIGN IN',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  decoration: TextDecoration.underline,
                  decorationThickness: 1.5)));
    }

    return Scaffold(
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
          Container(
            height: screenHeight,
            width: screenWidth,
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                Logo(width: screenWidth / 2.4),
                const SizedBox(height: 90),
                socialSignInButton(screenWidth * 0.8, 56, SocialType.facebook),
                const SizedBox(height: 20),
                socialSignInButton(screenWidth * 0.8, 56, SocialType.twitter),
                const SizedBox(height: 20),
                signUpButton(screenWidth * 0.8, 56),
                const SizedBox(height: 20),
                signInButton(context)
              ],
            ),
          )
        ],
      ),
    );
  }
}
