import 'package:flutter/material.dart';
import 'main_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            FractionallySizedBox(
              widthFactor: 1, // between 0 and 1
              heightFactor: 0.3,
              child: Container(
                color: const Color(0xff008080),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    iconApp,
                    inputBox('อีเมล', 250),
                    inputBox('รหัสผ่าน', 250),
                    _forgetPasswordButton(),
                    _loginButton(context),
                    const Text('หรือสมัครสมาชิก'),
                    const SizedBox(
                      height: 5,
                    ),
                    _registerPageButton(context)
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

Widget iconApp = Container(
  margin: const EdgeInsets.only(bottom: 30),
  padding: const EdgeInsets.all(1), // Border width
  decoration: BoxDecoration(
      boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 4)],
      borderRadius: BorderRadius.circular(20)),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: SizedBox.fromSize(
      size: const Size.fromRadius(105), // Image radius
      child: Image.asset(
        'images/iconApp.png',
        fit: BoxFit.cover,
      ),
    ),
  ),
);

Widget inputBox(String name, double width) {
  return Container(
    margin: const EdgeInsets.only(bottom: 5.0),
    width: width,
    child: Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            name,
            textAlign: TextAlign.start,
            style: const TextStyle(fontFamily: 'Kanit'),
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        SizedBox(
          height: 35,
          child: TextField(
            decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 0.0)),
                filled: true,
                fillColor: Colors.grey[300],
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 8)),
          ),
        )
      ],
    ),
  );
}

Widget _registerPageButton(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(bottom: 5.0),
    width: 250,
    child: ElevatedButton.icon(
        style:
            ElevatedButton.styleFrom(backgroundColor: const Color(0xff008080)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RegisterPage()),
          );
        },
        icon: const Icon(Icons.app_registration),
        label: const Text('สมัครสมาชิก')),
  );
}

Widget _loginButton(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(bottom: 5.0),
    width: 250,
    child: ElevatedButton.icon(
        style:
            ElevatedButton.styleFrom(backgroundColor: const Color(0xff008080)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyStatefulWidget()),
          );
        },
        icon: const Icon(Icons.login),
        label: const Text('เข้าสู่ระบบ')),
  );
}

Widget _forgetPasswordButton() {
  return Container(
    margin: const EdgeInsets.only(left: 183),
    width: 85,
    child: TextButton(
      style: TextButton.styleFrom(foregroundColor: Colors.red),
      onPressed: (() {}),
      child: const Text(
        'ลืมรหัสผ่าน',
      ),
    ),
  );
}
