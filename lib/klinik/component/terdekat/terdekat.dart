import 'package:flutter/material.dart';
import 'package:teleheal_apps/klinik/component/terdekat/body.dart';

class TerdekatKlinik extends StatefulWidget {
  const TerdekatKlinik({Key? key}) : super(key: key);

  @override
  State<TerdekatKlinik> createState() => _TerdekatKlinikState();
}

class _TerdekatKlinikState extends State<TerdekatKlinik> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}