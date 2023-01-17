// import 'package:firebase2/Screens/Home.dart';
// import 'package:firebase2/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:google_signin_2/firebase.dart';
import 'package:google_signin_2/homae_page.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: ElevatedButton(
              child: Text(
                'Login',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
              ),
              onPressed: () async {
                await FirebaseServices().SignInwithGoogle();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
          ),
        ),
      ),
    );
  }
}
