import 'package:flutter/material.dart';
import 'package:pojectabc/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 18, 51, 19),
        title: Text("Hinu cakees"),
        titleTextStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        actions: [
          IconButton(
            onPressed: () {
              signout(context);
            },
            icon: (Icon(Icons.exit_to_app)),
            color: Colors.white,
          ),
        ],
      ),
      body: Center(
        child: Text('ameen'),
      ),
    );
  }

  signout(BuildContext ctx) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.clear();

    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => loginpage()), (route) => false);
  }
}
