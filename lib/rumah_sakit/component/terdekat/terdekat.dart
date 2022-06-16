import 'package:flutter/material.dart';
import 'package:teleheal_apps/rumah_sakit/component/terdekat/body.dart';

class TerdekatRumahSakit extends StatefulWidget {
  const TerdekatRumahSakit({Key? key}) : super(key: key);

  @override
  State<TerdekatRumahSakit> createState() => _TerdekatRumahSakitState();
}

class _TerdekatRumahSakitState extends State<TerdekatRumahSakit> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}