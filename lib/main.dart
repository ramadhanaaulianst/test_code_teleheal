import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teleheal_apps/login/login.dart';
import 'package:teleheal_apps/splashscreen/splashscreen.dart';
import 'package:teleheal_apps/theme/theme.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: GetMaterialApp(
        theme: theme(),
        home: const SplashScreen(),
        getPages: [
          GetPage(name: "/login", page: () => const LoginView()),
        ],
      ),
    );
  }
}