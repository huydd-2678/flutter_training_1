import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double width;
  const Logo({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
