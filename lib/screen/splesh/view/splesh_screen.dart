import 'package:flutter/material.dart';

class SpleshScreen extends StatefulWidget {
  const SpleshScreen({super.key});

  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3),
    () {
         Navigator.pushReplacementNamed(context, 'home');
    },);
    return Image.network("https://i.pinimg.com/564x/02/98/2a/02982a558aeeea66ed96e3ab03675632.jpg");
  }
}
