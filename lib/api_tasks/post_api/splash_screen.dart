import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart';  // Ensure this is correctly imported
import 'post_api_screen.dart';  // Ensure this is correctly imported

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    print("Retrieved Token: $token"); // Debugging line

    await Future.delayed(Duration(seconds: 4));

    if (token != null && token.isNotEmpty) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => PostApiScreen()));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Splash Screen',
              style: GoogleFonts.poppins(
                  color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            SpinKitCircle(color: Colors.white),
          ],
        ),
      ),
    );
  }
}
