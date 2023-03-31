import 'package:final_project_mobile/main.dart';
import 'package:final_project_mobile/screen/create_account_screen.dart';
import 'package:final_project_mobile/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  AuthService _service = AuthService();

  @override
  Widget build(BuildContext context) {
    final pr0 = const Color(0xFFE8EAF6);
    final pr1 = const Color(0xFFC5CAE9);
    final pr2 = const Color(0xFF9FA8DA);
    final pr3 = const Color(0xFF7986CB);
    final pr4 = const Color(0xFF5C6BC0);
    final pr6 = const Color(0xFF3949AB);
    final pr7 = const Color(0xFF303F9F);
    final pr8 = const Color(0xFF283593);
    final pr9 = const Color(0xFF1A237E);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: pr6,
          title: const Text("เข้าสู่ระบบ"),
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
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
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
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      bool res = await _service.login(
                          _emailController.text, _passwordController.text);
                      if (res) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("เข้าสู่ระบบ")));

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MyHomePage(title: 'หน้าหลัก')));
                      }
                    },
                    child: const Text("ยืนยัน"),
                    style: ElevatedButton.styleFrom(
                      primary: pr4,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CreateAccountScreen()));
                  },
                  child: Text(
                    "สร้างบัญชีใหม่ >>",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
