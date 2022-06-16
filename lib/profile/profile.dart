import 'package:flutter/material.dart';
import 'package:teleheal_apps/profile/component/body.dart';
import 'package:teleheal_apps/theme/appbar_theme_color.dart';

class ProfilView extends StatefulWidget {
  const ProfilView({Key? key}) : super(key: key);

  @override
  _ProfilViewState createState() => _ProfilViewState();
}

class _ProfilViewState extends State<ProfilView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile",),
        flexibleSpace: const AppBarThemeColor(),
      ),
      body: const Body(),
    );
  }
}