import 'package:flutter/material.dart';
import 'package:uas_wisata_madura/form/login_form.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/gambar1.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 100.0),
              child: Image.asset(
                "assets/logo1.png",
                width: 150.0,
                height: 150.0,
              ),
            ),
            SizedBox(height: 30.0),
            LoginForm(),
            SizedBox(height: 20.0),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: Text(
                "Don't have an account? Sign up here",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
