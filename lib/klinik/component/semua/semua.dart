import 'package:flutter/material.dart';
import 'package:teleheal_apps/klinik/component/semua/body.dart';

class SemuaKlinik extends StatefulWidget {
  const SemuaKlinik({Key? key}) : super(key: key);

  @override
  State<SemuaKlinik> createState() => _SemuaKlinikState();
}

class _SemuaKlinikState extends State<SemuaKlinik> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}