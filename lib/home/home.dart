import 'package:flutter/material.dart';
import 'package:teleheal_apps/banner/banner.dart';
import 'package:teleheal_apps/klinik/klinik.dart';
import 'package:teleheal_apps/rumah_sakit/rumah_sakit.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);


  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late TabController controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.view_headline_rounded,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            )
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color> [
                Colors.white,
                Colors.white,
              ]
            ),
          ),
        ),
      ),
      body: Column(
        children: const <Widget>[
          Expanded(
            child: RumahSakitView()
          ),
          SizedBox(height: 5),
          Expanded(
            child: BannerIklan(),
          ),
          SizedBox(height: 5),
          Expanded(
            child: KlinikView()
          ),
        ],
      ),
    );
  }
}