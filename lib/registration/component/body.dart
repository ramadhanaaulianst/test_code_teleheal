import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teleheal_apps/login/login.dart';
import 'package:teleheal_apps/registration/component/background.dart';
import 'package:teleheal_apps/registration/component/registration_form.dart';
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
                          Text("Register Account"),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const RegistrationForm(),
                       const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account? ",
                            style: TextStyle(fontSize: 16),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(const LoginView());
                            },
                            child: const Text(
                              "Log In",
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