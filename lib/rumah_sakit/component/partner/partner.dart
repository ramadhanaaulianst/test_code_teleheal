import 'package:flutter/material.dart';
import 'package:teleheal_apps/rumah_sakit/component/partner/body.dart';

class PartnerRumahSakit extends StatefulWidget {
  const PartnerRumahSakit({Key? key}) : super(key: key);

  @override
  State<PartnerRumahSakit> createState() => _PartnerRumahSakitState();
}

class _PartnerRumahSakitState extends State<PartnerRumahSakit> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}