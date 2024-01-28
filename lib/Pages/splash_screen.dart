import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_internshala_1/Pages/home_page_three.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => ThreeHomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(
          255, 238, 240, 241), // Set the background color of your splash screen
      body: Center(
        child: Image.asset(
          'assets/companyLogo.png', // Replace with your company's logo image asset
          width: 200, // Adjust the width as needed
          height: 200, // Adjust the height as needed
          fit: BoxFit.contain, // Adjust the BoxFit as needed
        ),
      ),
    );
  }
}
