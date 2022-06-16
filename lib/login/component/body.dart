import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teleheal_apps/component/socal_card.dart';
import 'package:teleheal_apps/login/component/background.dart';
import 'package:teleheal_apps/login/component/login_form.dart';
import 'package:teleheal_apps/registration/registration.dart';
import 'package:teleheal_apps/theme/constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);


  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: const BorderSide(
                    width: 0.4, color: Colors.grey
                  )
                ),
                elevation: 8.0,
                margin: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 6.0),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 30, left: 20, right: 20),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        "assets/images/teleheal_backgrounds.png",
                        height: 200,
                        width: 200,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const <Widget> [
                          Text("Login to your account"),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const LoginForm(),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocalCard(
                            icon: "assets/icons/google-icon.svg",
                            press: () {},
                          ),
                          SocalCard(
                            icon: "assets/icons/facebook-2.svg",
                            press: () {},
                          ),
                          SocalCard(
                            icon: "assets/icons/twitter.svg",
                            press: () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don’t have an account? ",
                            style: TextStyle(fontSize: 16),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(const RegistrationView());
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 16,
                                color: kPrimaryColor
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}