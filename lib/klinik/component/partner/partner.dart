import 'package:flutter/material.dart';
import 'package:teleheal_apps/klinik/component/partner/body.dart';

class PartnerKlinik extends StatefulWidget {
  const PartnerKlinik({Key? key}) : super(key: key);

  @override
  State<PartnerKlinik> createState() => _PartnerKlinikState();
}

class _PartnerKlinikState extends State<PartnerKlinik> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}