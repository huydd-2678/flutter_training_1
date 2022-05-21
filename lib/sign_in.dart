import 'package:flutter/material.dart';
import 'package:training_1/sign_up.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {
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
                    _logo(screenWidth / 2.4),
                    const SizedBox(height: 20),
                    _signInTitle(),
                    const SizedBox(height: 40),
                    _inputField('Enter Email', false),
                    const SizedBox(height: 40),
                    _inputField('Password', true),
                    const SizedBox(height: 15),
                    _rememberPassword(),
                    const SizedBox(height: 15),
                    _signInButton(screenWidth * 0.8, 56),
                    const SizedBox(height: 20),
                    _socialSignIn(),
                    const SizedBox(height: 5),
                    _forgotPassword()
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Container(
                  width: screenWidth,
                  height: 60,
                  color: const Color(0xFFCB1F51),
                  child: _signUp(context),
                ),
              )
            ],
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

Widget _signInTitle() {
  return const Text(
    'SIGN IN',
    style: TextStyle(
        color: Colors.white, fontSize: 24, fontWeight: FontWeight.w900),
  );
}

Widget _inputField(String hint, bool isPassword) {
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
    keyboardType:
        isPassword ? TextInputType.visiblePassword : TextInputType.emailAddress,
    cursorColor: Colors.white,
    style: const TextStyle(color: Colors.white, fontSize: 16),
  );
}

Widget _rememberPassword() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      Transform.scale(
          scale: 0.85,
          child: Checkbox(
              value: true,
              onChanged: (bool? value) {},
              activeColor: const Color(0xFFFD7849))),
      const Text('Remember Password',
          style: TextStyle(color: Colors.white, fontSize: 12))
    ],
  );
}

Widget _signInButton(double width, double height) {
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
        'GET STARTED',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 18,
        ),
      ),
    ),
  );
}

Widget _socialSignIn() {
  return Container(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              primary: Colors.white,
              fixedSize: const Size(60, 60),
            ),
            child: ShaderMask(
              blendMode: BlendMode.srcATop,
              shaderCallback: (size) => _gradient.createShader(
                Rect.fromLTWH(0, 0, size.width, size.height),
              ),
              child: Image.asset('assets/images/facebook.png', width: 25),
            ),
            onPressed: () {},
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              primary: Colors.white,
              fixedSize: const Size(60, 60),
            ),
            child: ShaderMask(
              blendMode: BlendMode.srcATop,
              shaderCallback: (size) => _gradient.createShader(
                Rect.fromLTWH(0, 0, size.width, size.height),
              ),
              child: Image.asset('assets/images/twitter.png', width: 25),
            ),
            onPressed: () {},
          ),
        ],
      ));
}

Widget _forgotPassword() {
  return TextButton(
      onPressed: () {},
      child: const Text('FORGOT PASSWORD?',
          style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              decoration: TextDecoration.underline,
              decorationThickness: 1.5)));
}

Widget _signUp(BuildContext context) {
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

const Gradient _gradient = LinearGradient(
  colors: [Color(0xFFFE7B43), Color(0xFFF53371)],
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
);