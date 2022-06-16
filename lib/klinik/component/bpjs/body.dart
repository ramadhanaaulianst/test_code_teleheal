import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:teleheal_apps/component/card_field_item_text.dart';
import 'package:teleheal_apps/component/highlight_item_name.dart';
import 'package:teleheal_apps/model/rumah_sakit_model.dart';
import 'package:teleheal_apps/theme/constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late List semuaRumahSakit;
  final ScrollController _scrollController = ScrollController();

  @override
  initState(){
    semuaRumahSakit = getRumahSakit();
    initializeDateFormatting();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(padding: 
        const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: semuaRumahSakit.length,
                itemBuilder: (context, index){
                  return cardList(semuaRumahSakit[index]);
                }
              ),
            ),
          ],
        ),
      ),
    );
  }

  Card cardList(RumahSakit dataRumahSakit) {
    return Card(
      elevation: 3.0,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(25),
        side: const BorderSide(
          width: 0.4, color: Colors.grey
        )
      ),
      child: buatListTile(dataRumahSakit),
    );
  }

  ListTile buatListTile(RumahSakit dataRumahSakit) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 44,
          minHeight: 44,
          maxWidth: 64,
          maxHeight: 64,
        ),
        child: Image.network(dataRumahSakit.gambarRumahSakit.toString()),
      ),
      title: HighlightItemName(
        child: Text(
          dataRumahSakit.namaRumahSakit.toString(),
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CardFieldItemText(
              label: "Alamat",
              contentData: dataRumahSakit.alamatRumahSakit,
              flexLeftRow: 12,
              flexRightRow: 20,
            ),
          ],
        ),
      ),
      trailing: Transform.translate(
        offset: const Offset(-12, 0),
        child: ShaderMask(
          shaderCallback: (Rect bounds) {
            return const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color> [
                kPrimaryColor,
                kSecondaryColor,
              ],
              tileMode: TileMode.mirror,
            ).createShader(bounds);
          },
          child: SvgPicture.asset("assets/icons/arrow_ios.svg",
            height: 15,
            width: 15,
            color: kPrimaryColor,
          ),
        ),
      ),
      onTap: () {
        // Get.to(
        //   DetailDeliveryOrderView(
        //     noDeliveryOrder: dataDeliveryOrder[index].noDeliveryOrder.toString(),
        //     statusMenu: "Approval",
        //   )
        // );
      },
    );
  }

}

List getRumahSakit() {
  return [
    RumahSakit(
      namaRumahSakit: "Rumah Sakit Ciputra Citra Garden City",
      alamatRumahSakit: "Jl. Satu Maret - Kalideres, Jakarta Barat, Jakarta, Indonesia 11820",
      gambarRumahSakit: "https://static.konsula.com/images/practice/0001001000/0001000249/rumah-sakit-ciputra-citra-garden-city2.800x600.jpg",
      dataRumahSakit: "Ciputra Hospital Jakarta adalah rumah sakit yang berada di Citra 5, perumahan CitraGarden City Jakarta. Ciputra Hospital di CitraGarden City merupakan rumah sakit kedua, setelah yang pertama dibangun di CitraRaya Cikupa Tangerang. Ciputra Hospital dibangun oleh Grup Ciputra di bawah PT. Ciputra Development Tbk, yang dibangun untuk memberikan layanan kesehatan terpadu bagi warga yang tinggal di CitraGarden City maupun masyarakat yang ada di sekitarnya.",
    ),
    RumahSakit(
      namaRumahSakit: "Rumah Sakit Mata Aini Prof. Dr. Isak Salim",
      alamatRumahSakit: "Jl. Rumah Sakit Mata AINI, HR. Rasuna Said - Setiabudi, Jakarta Selatan, Jakarta, Indonesia 12920",
      gambarRumahSakit: "https://static.konsula.com/images/practice/0001001000/0001000998/rumah-sakit-mata-aini-prof-dr-isak-salim.800x600.jpg",
      dataRumahSakit: "Rumah Sakit Mata Aini Prof. Dr. Isak Salim merupakan sebuah Rumah Sakit yang berlokasi di Setiabudi, Jakarta Selatan, Jakarta, Indonesia. Saat ini, dokter-dokter yang melakukan praktek di Rumah Sakit Mata Aini Prof. Dr. Isak Salim diantaranya adalah dr. Lumongga B. Simangunsong, Sp.M, dr. Bondan Harmani, Sp.M, dr. Nida Farida, Sp.M, dan dokter lainnya. Adapun beberapa layanan kesehatan yang dapat Anda temukan di Rumah Sakit Mata Aini Prof. Dr. Isak Salim adalah Apotek, Laboratorium, Mata, Penyakit Dalam, Gawat Darurat, dan lain-lain",
    ),
    RumahSakit(
      namaRumahSakit: "Rumah Sakit Kasih Buddha Cinta Kasih Tzu Chi",
      alamatRumahSakit: "Jl. Lingkar Luar Kamal Raya - Cengkareng, Jakarta Barat, Jakarta, Indonesia 11730",
      gambarRumahSakit: "https://static.konsula.com/images/practice/0001002000/0001001134/rumah-sakit-kasih-budha-cinta-kasih-tzu-chi.800x600.jpg",
      dataRumahSakit: "Rumah Sakit Kasih Buddha Cinta Kasih Tzu Chi merupakan sebuah Rumah Sakit yang berlokasi di Cengkareng, Jakarta Barat, Jakarta, Indonesia. Saat ini, dokter-dokter yang melakukan praktek di Rumah Sakit Kasih Buddha Cinta Kasih Tzu Chi diantaranya adalah dr. Deasy Thio, Sp.KK, dan dr. Andri Hondir, Sp.OG. Adapun beberapa layanan kesehatan yang dapat Anda temukan di Rumah Sakit Kasih Buddha Cinta Kasih Tzu Chi adalah Anak, Gigi, Kebidanan dan Kandungan, Laboratorium, Bedah Mulut, dan lain-lain.",
    ),
  ];
}