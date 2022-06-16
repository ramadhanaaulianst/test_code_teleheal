import 'dart:async';
import 'package:teleheal_apps/theme/constants.dart';
import 'package:teleheal_apps/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({Key? key}) : super(key: key);


  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SharedPreferences loginData;
  late bool isLogin;

  void checkLogin() async {
    loginData = await SharedPreferences.getInstance();
    isLogin = (loginData.getBool("login") ?? false);
    if (isLogin == true) {
      // Timer(
      //   const Duration(seconds: 2),
      //     ()=> Get.offAll(const MainPage())
      // );
    } else {
      Timer(
        const Duration(seconds: 2),
          ()=> Get.offAll(const LoginView())
      );
    }
  }
  
  @override
  void initState() {
    super.initState();
    checkLogin();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget> [
                Image.asset(
                  "assets/images/teleheal_backgrounds.png",
                  height: 300.0,
                  width: 300.0,
                ),
                const Text("Welcome!",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor
                  ),
                ),
                const SizedBox(height: 50),
                const CircularProgressIndicator(
                  color: kSecondaryColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}