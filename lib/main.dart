//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pojectabc/loginpage.dart';
//import 'package:pojectabc/loginpage.dart';

import 'package:pojectabc/splashscreen.dart';

const save_key_name = 'userloggedIn';
main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: splashscreen(),
    );
  }
}
