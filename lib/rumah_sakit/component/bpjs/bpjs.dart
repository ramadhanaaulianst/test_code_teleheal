import 'package:flutter/material.dart';
import 'package:teleheal_apps/rumah_sakit/component/bpjs/body.dart';

class BpjsRumahSakit extends StatefulWidget {
  const BpjsRumahSakit({Key? key}) : super(key: key);

  @override
  State<BpjsRumahSakit> createState() => _BpjsRumahSakitState();
}

class _BpjsRumahSakitState extends State<BpjsRumahSakit> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}