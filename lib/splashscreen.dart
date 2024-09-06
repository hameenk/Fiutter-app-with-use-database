import 'dart:async';
import 'dart:ffi';
//import 'dart:developer';
//import 'dart:js';
//import 'dart:js_util';

import 'package:flutter/material.dart';
//import 'package:flutter/scheduler.dart';
import 'package:pojectabc/homepage.dart';
import 'package:pojectabc/loginpage.dart';
import 'package:pojectabc/main.dart';
//import 'package:pojectabc/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    checkuserLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // getSavedData(context);

    return Scaffold(
      backgroundColor: Color.fromRGBO(56, 63, 17, 1),
      //appBar: AppBar(
      //backgroundColor: Colors.pink,
      //title: const Text('ameen'),
      // ),
      body: Center(
        child: CircleAvatar(
          radius: 56,
          child: Padding(
            padding: EdgeInsets.all(5),
            child: ClipOval(
              child: Image.asset(
                'assets/img/hinu.jpg',
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> gotoLogin() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (ctx) => loginpage(),
    ));
  }

  Future<void> gotosplash() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => homepage()));
  }

  Future<void> checkuserLoggedIn() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final userLoggedin = sharedPrefs.getBool(save_key_name);
    if (userLoggedin == null || userLoggedin == false) {
      gotoLogin();
    } else {
      gotosplash();
      // Navigator.of(context)
      //  .pushReplacement(MaterialPageRoute(builder: (ctx) => homepage()));
    }
  }
}
