import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override

  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  String email = 'nil';
  String password = 'nil';

  bool passwordVisible = false;

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen',
        style: TextStyle(fontWeight: FontWeight.w600),),
        backgroundColor: Colors.deepOrange,
        leading: Icon(Icons.login),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30, bottom: 12.5),
              child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Enter your email id'
              ),
              onChanged: (text) {
                email = text;
              },
            )),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30, bottom: 15, top: 12.5),
              child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(), 
                labelText: 'Enter your password',
                suffixIcon: IconButton(
                  icon: Icon(passwordVisible? Icons.visibility : Icons.visibility_off), 
                  onPressed: () {
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },),
              ),
              obscureText: passwordVisible,
              
              onChanged: (text) {
                password = text;
              },
            )),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                foregroundColor: Colors.white,
                padding: EdgeInsets.only(left: 50, right: 50, top: 15, bottom: 15),
              ),
              onPressed: () {
                setState(() {
                  if(email == "heet.solanki@somaiya.edu" && password == "heet") {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Login Successful!'),
                      duration: Duration(seconds: 2),
                      backgroundColor: Colors.green,
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Login Failed!'),
                      duration: Duration(seconds: 2),
                      backgroundColor: Colors.red,
                    ));
                  }
                });
              }, 
              child: Text(
                'Login'
              )
            ),
          ],
        ),
      ),
    );
  }
}