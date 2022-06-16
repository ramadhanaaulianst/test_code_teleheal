import 'package:flutter/material.dart';
import 'package:teleheal_apps/klinik/component/bpjs/bpjs.dart';
import 'package:teleheal_apps/klinik/component/partner/partner.dart';
import 'package:teleheal_apps/klinik/component/semua/semua.dart';
import 'package:teleheal_apps/klinik/component/terdekat/terdekat.dart';
import 'package:teleheal_apps/theme/appbar_theme_color.dart';
import 'package:teleheal_apps/theme/constants.dart';

class KlinikView extends StatefulWidget {
  const KlinikView({Key? key}) : super(key: key);


  @override
  _KlinikViewState createState() => _KlinikViewState();
}

class _KlinikViewState extends State<KlinikView> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
    controller.addListener(() {});
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Klinik"),
          flexibleSpace: const AppBarThemeColor(),
        ),
        body: Column(
          children: <Widget>[
            Material(
              elevation: 2,
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Color.fromRGBO(43, 190, 83, 1)
                    )
                  )
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: TabBar(
                    controller: controller,
                    indicatorColor: kPrimaryColor,
                    labelStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins"
                    ),
                    labelColor: Colors.black,
                    unselectedLabelColor: const Color.fromRGBO(43, 190, 83, 1),
                    tabs: const <Widget>[
                      Tab(text: "Semua"),
                      Tab(text: "BPJS"),
                      Tab(text: "Partner"),
                      Tab(text: "Terdekat"),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: controller,
                children: const <Widget>[
                  SemuaKlinik(),
                  BpjsKlinik(),
                  PartnerKlinik(),
                  TerdekatKlinik(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}