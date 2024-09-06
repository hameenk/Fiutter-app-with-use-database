import 'package:flutter/cupertino.dart';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:pojectabc/homepage.dart';
import 'package:pojectabc/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class loginpage extends StatefulWidget {
  loginpage({Key? key}) : super(key: key);

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  final _usernamecontroller = TextEditingController();

  final _passwordcontrllor = TextEditingController();
  bool datamatched = true;
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 18, 51, 19),
        title: const Text(
          style: TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.normal,
          ),
          'HINUCAKES',
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Color.fromARGB(255, 18, 59, 92),
                  ),
                  'LOG IN ',
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: _usernamecontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'username',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'value is empty';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  obscureText: true,
                  controller: _passwordcontrllor,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'password',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'value is empty';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: !datamatched,
                      child: const Text(
                        "user namepassword does't match",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          checkLogin(context);
                        } else {
                          print('data empty');
                        }
                      },
                      child: Text(
                        'Login In',
                        style: const TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: (const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> checkLogin(BuildContext context) async {
    final username = _usernamecontroller.text;
    final passsword = _passwordcontrllor.text;

    if (username == passsword) {
      setState(() {
        datamatched = true;
      });
      final sharedPrefs = await SharedPreferences.getInstance();
      await sharedPrefs.setBool(save_key_name, true);

      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => homepage()));
      //snackbar
    } else {
      final errormessage = 'username or password doesnot match';
      //snackbar
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(15),
        backgroundColor: Colors.red,
        content: Text(errormessage),
      ));
      //alert dialog
      showDialog(
          context: context,
          builder: (ctx1) {
            return AlertDialog(
              title: const Text('ERROR'),
              content: Text(errormessage),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(ctx1).pop();
                    },
                    child: const Text("CLOSE"))
              ],
            );
          }); //show text
      setState(() {
        datamatched = false;
      });
    }
  }
}
