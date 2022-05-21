import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  bool isRememberPassword = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

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
                _logo(screenWidth / 2.4),
                const SizedBox(height: 90),
                _signInFacebookButton(screenWidth * 0.8, 56),
                const SizedBox(height: 20),
                _signInTwitterButton(screenWidth * 0.8, 56),
                const SizedBox(height: 20),
                _signUpButton(screenWidth * 0.8, 56),
                const SizedBox(height: 20),
                _signInButton(context)
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget _logo(double width) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Image.asset('assets/images/logo.png', width: width),
      const SizedBox(height: 8),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text('CONN',
              style: TextStyle(
                  color: Color(0xFFF6366A),
                  fontSize: 36,
                  fontWeight: FontWeight.w900)),
          Text('EXION',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.w900))
        ],
      ),
      const SizedBox(height: 4),
      const Text('Find and Meet people around \nyou to find LOVE',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w300))
    ],
  );
}

Widget _signInFacebookButton(double width, double height) {
  return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        fixedSize: Size(width, height),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: ShaderMask(
              blendMode: BlendMode.modulate,
              shaderCallback: (size) => _gradient.createShader(
                Rect.fromLTWH(0, 0, size.width, size.height),
              ),
              child: const Text(
                'Sign in with Facebook',
                style: TextStyle(
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
                    shaderCallback: (size) => _gradient.createShader(
                      Rect.fromLTWH(0, 0, size.width, size.height),
                    ),
                    child: Image.asset('assets/images/facebook.png', width: 25),
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

Widget _signInTwitterButton(double width, double height) {
  return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        fixedSize: Size(width, height),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: ShaderMask(
              blendMode: BlendMode.modulate,
              shaderCallback: (size) => _gradient.createShader(
                Rect.fromLTWH(0, 0, size.width, size.height),
              ),
              child: const Text(
                'Sign in with Twitter',
                style: TextStyle(
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
                    shaderCallback: (size) => _gradient.createShader(
                      Rect.fromLTWH(0, 0, size.width, size.height),
                    ),
                    child: Image.asset('assets/images/twitter.png', width: 25),
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

Widget _signUpButton(double width, double height) {
  return ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      primary: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      fixedSize: Size(width, height),
    ),
    child: ShaderMask(
      blendMode: BlendMode.modulate,
      shaderCallback: (size) => _gradient.createShader(
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

Widget _signInButton(BuildContext context) {
  return TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Text('ALREADY REGISTERED? SIGN IN',
          style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              decoration: TextDecoration.underline,
              decorationThickness: 1.5)));
}

const Gradient _gradient = LinearGradient(
  colors: [Color(0xFFFE7B43), Color(0xFFF53371)],
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
);
