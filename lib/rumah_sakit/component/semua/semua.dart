import 'package:flutter/material.dart';
import 'package:teleheal_apps/rumah_sakit/component/semua/body.dart';

class SemuaRumahSakit extends StatefulWidget {
  const SemuaRumahSakit({Key? key}) : super(key: key);

  @override
  State<SemuaRumahSakit> createState() => _SemuaRumahSakitState();
}

class _SemuaRumahSakitState extends State<SemuaRumahSakit> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}