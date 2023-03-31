import 'package:final_project_mobile/screen/login_screen.dart';
import 'package:final_project_mobile/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateAccountScreen extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  AuthService _service = AuthService();

  @override
  Widget build(BuildContext context) {
    // Define the app's theme
    final ThemeData theme = ThemeData(
      primarySwatch: Colors.indigo,
      accentColor: Colors.indigo[400],
      fontFamily: 'Montserrat',
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 18, color: Colors.white),
        bodyText1: TextStyle(fontSize: 16.0, color: Colors.grey[700]),
        button: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );

    return MaterialApp(
      theme: theme,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "สร้างบัญชีใหม่",
            style: theme.textTheme.headline1,
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.indigo, Colors.green],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              children: [
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: "อีเมล",
                    hintStyle: TextStyle(color: Colors.grey[700]),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "รหัสผ่าน",
                    hintStyle: TextStyle(color: Colors.grey[700]),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    bool res = await _service.register(
                        _emailController.text, _passwordController.text);
                    if (res) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("สร้างบัญชีแล้ว")),
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: theme.accentColor,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                  ),
                  child: Text(
                    "ยืนยัน",
                    style: theme.textTheme.button,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
