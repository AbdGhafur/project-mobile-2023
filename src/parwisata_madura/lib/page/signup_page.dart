import 'package:flutter/material.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:uas_wisata_madura/form/signup_form.dart';
import 'package:uas_wisata_madura/page/login_page.dart';

class SignupPage extends StatelessWidget {
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
            SignupForm(),
            SizedBox(height: 20.0),
            TextButton(
              onPressed: () => slideLeftWidget(
                newPage: LoginPage(),
                context: context,
              ),
              child: Text(
                "Already have an account? Log in here",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
