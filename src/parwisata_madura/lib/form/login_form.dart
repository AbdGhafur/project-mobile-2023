import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "Email",
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Password",
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/category');
            },
            child: Text("Login"),
          ),
        ],
      ),
    );
  }
}
