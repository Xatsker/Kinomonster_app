import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kinomonster/main.dart';
import 'package:kinomonster/models/user.dart';
import 'package:kinomonster/services/auth.dart';
import 'package:kinomonster/widgets/logo.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({Key? key}) : super(key: key);

  @override
  State<AuthorizationPage> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String _email = '';
  String _password = '';
  bool showLogin = true;

  AuthService _authService = AuthService();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget _input(Icon icon, String hint, TextEditingController controller,
        bool obscure) {
      return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: TextField(
          controller: controller,
          obscureText: obscure,
          style: TextStyle(fontSize: 20, color: Colors.white),
          decoration: InputDecoration(
              hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white30),
              hintText: hint,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 3)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54, width: 1)),
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: IconTheme(
                  data: IconThemeData(color: Colors.white),
                  child: icon,
                ),
              )),
        ),
      );
    }

    Widget _button(String text, void func()) {
      return ElevatedButton(
        onPressed: () {
          func();
        },
        child: Text(text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: const Color.fromRGBO(43, 8, 8, 1),
                fontSize: 20)),
        style: ElevatedButton.styleFrom(
            primary: Colors.white,
            shadowColor: const Color.fromRGBO(43, 8, 8, 1)),
      );
    }

    Widget _form(String label, void func()) {
      return Container(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: 20,
              top: 10,
            ),
            child: _input(Icon(Icons.email), "Email", _emailController, false),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: _input(
                Icon(Icons.password), "Password", _passwordController, true),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: _button(label, func)),
          )
        ],
      ));
    }

    Future _loginButtonAction() async {
      _email = _emailController.text;
      _password = _passwordController.text;

      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _email.trim(), password: _password.trim());
      } on FirebaseAuthException catch (e) {
        print(e);
      }
      _emailController.clear();
      _passwordController.clear();
    }

    Future _registerButtonAction() async {
      _email = _emailController.text;
      _password = _passwordController.text;

      _email = _emailController.text;
      _password = _passwordController.text;

      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _email.trim(), password: _password.trim());
      } on FirebaseAuthException catch (e) {
        print(e);
      }
      _emailController.clear();
      _passwordController.clear();
    }

    return Scaffold(
      backgroundColor: const Color.fromRGBO(43, 8, 8, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Logo(),
          SizedBox(
            height: 50,
          ),
          (showLogin
              ? Column(
                  children: [
                    _form("ВОЙТИ", _loginButtonAction),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: GestureDetector(
                        child: Text(
                          'Не регистрировались раньше? Регистация!',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onTap: () {
                          setState(() {
                            showLogin = false;
                          });
                        },
                      ),
                    )
                  ],
                )
              : Column(
                  children: [
                    _form("РЕГИСТРАЦИЯ", _registerButtonAction),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: GestureDetector(
                        child: Text(
                          'Уже зарегестрированы? Войти!',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onTap: () {
                          setState(() {
                            showLogin = true;
                          });
                        },
                      ),
                    )
                  ],
                )),
        ],
      ),
    );
  }
}
