import 'package:flutter/material.dart';
import 'package:teleheal_apps/rumah_sakit/component/bpjs/body.dart';

class BpjsKlinik extends StatefulWidget {
  const BpjsKlinik({Key? key}) : super(key: key);

  @override
  State<BpjsKlinik> createState() => _BpjsKlinikState();
}

class _BpjsKlinikState extends State<BpjsKlinik> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}