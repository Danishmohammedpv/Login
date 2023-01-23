// import 'package:firebase2/Screens/login.dart';
// import 'package:firebase2/services/firebase_services.dart';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:google_signin_2/firebase.dart';
import 'package:google_signin_2/login_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController noteController = TextEditingController();
  User? userid = FirebaseAuth.instance.currentUser;
  // final _controller = TextEditingController();

  // Future<void> _saveTask() async {
  //   final taskName = _controller.text;
  //   await FirebaseFirestore.instance
  //       .collection("Tasks")
  //       .add({"name": _saveTask});
  //   _controller.clear();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(FirebaseAuth.instance.currentUser!.photoURL!),
            SizedBox(
              height: 20,
            ),
            Text("${FirebaseAuth.instance.currentUser!.displayName}"),
            Text("${FirebaseAuth.instance.currentUser!.email}"),
            ElevatedButton(
              onPressed: () async {
                await FirebaseServices().signOut();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Loginscreen()));
              },
              child: const Text(
                'Logout',
              ),
            ),
            Expanded(
                child: TextFormField(
              maxLines: null,
              controller: noteController,
              // controller: _controller,
              decoration: InputDecoration(hintText: "Enter tasks"),
            )),
            TextButton(
                onPressed: (() async {
                  var note = noteController.text.trim();
                  if (note != "") {
                    try {
                      await FirebaseFirestore.instance
                          .collection("notes")
                          .doc()
                          .set({
                        "createdAt": DateTime.now(),
                        "note": note,
                        "userid": userid?.uid,
                      });
                    } catch (e) {
                      print("error $e");
                    }
                  }

                  // await _saveTask();
                }),
                child: Text('Save')),
          ],
        )));
  }
}
