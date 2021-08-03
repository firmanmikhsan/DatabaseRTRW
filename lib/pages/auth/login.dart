import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            Container(
              width: 400,
              child: LoginForm(),
            )
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  LoginForm({
    Key? key,
  }) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          UsernameField(),
          Padding(padding: EdgeInsets.only(top: 15, bottom: 15)),
          PasswordField(),
          Padding(
            padding: EdgeInsets.all(18),
            child: ElevatedButton(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text("Masuk", style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Poppins"
                  )
                ),
              ),
              onPressed: (){
                if (_formKey.currentState!.validate()) {
                  
                }
              },
            )
          ),
        ],
      )
    );
  }
}

class PasswordField extends StatelessWidget {
  
  bool _obscureText = true;
  late String _password;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscureText,
      decoration: InputDecoration(
        hintText: "Masukan Katasandi",
        suffixIcon: InkWell(
          onTap: (){
            _obscureText = !_obscureText;
            (context as Element).markNeedsBuild();
          },
          onHover: (value){
            
          },
          child: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
        ),
        icon: Icon(Icons.lock)
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Harap isi katasandi";
        }
        return null;
      },
    );
  }
}

class UsernameField extends StatelessWidget {
  const UsernameField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Masukan Username",
        icon: Icon(Icons.people)
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Harap isi username";
        }
        return null;
      },
    );
  }
}
