import 'package:flutter/material.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:uas_wisata_madura/form/login_form.dart';
import 'package:uas_wisata_madura/page/signup_page.dart';
import 'package:uas_wisata_madura/screens/category_screen.dart';
import 'package:uas_wisata_madura/services/firebase_sign_in.dart';

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
              onPressed: () => slideRightWidget(
                newPage: SignupPage(),
                context: context,
              ),
              child: Text(
                "Don't have an account? Sign up here",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 0),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.transparent),
              onPressed: () {
                signInWithGoogle().then((result) {
                  if (result != null) {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return CategoryScreen();
                    }));
                  }
                });
              },
              child: Image.asset(
                "assets/google.png",
                width: 40,
                height: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
