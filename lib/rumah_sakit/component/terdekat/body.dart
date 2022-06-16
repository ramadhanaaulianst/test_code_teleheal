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
      namaRumahSakit: "Rumah Sakit Kasih Buddha Cinta Kasih Tzu Chi",
      alamatRumahSakit: "Jl. Lingkar Luar Kamal Raya - Cengkareng, Jakarta Barat, Jakarta, Indonesia 11730",
      gambarRumahSakit: "https://static.konsula.com/images/practice/0001002000/0001001134/rumah-sakit-kasih-budha-cinta-kasih-tzu-chi.800x600.jpg",
      dataRumahSakit: "Rumah Sakit Kasih Buddha Cinta Kasih Tzu Chi merupakan sebuah Rumah Sakit yang berlokasi di Cengkareng, Jakarta Barat, Jakarta, Indonesia. Saat ini, dokter-dokter yang melakukan praktek di Rumah Sakit Kasih Buddha Cinta Kasih Tzu Chi diantaranya adalah dr. Deasy Thio, Sp.KK, dan dr. Andri Hondir, Sp.OG. Adapun beberapa layanan kesehatan yang dapat Anda temukan di Rumah Sakit Kasih Buddha Cinta Kasih Tzu Chi adalah Anak, Gigi, Kebidanan dan Kandungan, Laboratorium, Bedah Mulut, dan lain-lain.",
    ),
    RumahSakit(
      namaRumahSakit: "Rumah Sakit Umum Pusat Persahabatan",
      alamatRumahSakit: "Jl. Persahabatan Raya No.1 - Pulo Gadung, Jakarta Timur, Jakarta, Indonesia 13230",
      gambarRumahSakit: "https://static.konsula.com/images/practice/0001001000/0001000168/rumah-sakit-umum-pusat-persahabatan.800x600.jpg",
      dataRumahSakit: "Rumah Sakit Umum Pusat Persahabatan adalah rumah sakit umum kelas A milik pemerintah yang terletak di Jakarta Timur, Indonesia. Rumah sakit yang didirikan di lahan seluas 134.521 m2 ini sekarang berstatus sebagai rumah sakit rujukan nasional untuk penyakit pernapasan. Saat ini RSUP Persahabatan memiliki kapasitas 600 tempat tidur dengan Fasilitas yang tersedia antara lain Rawat Jalan Asma, Rawat Jalan PPOK, TB DOTS Executive Room, Rawat Jalan MDR-TB, Rawat ICU Flu Burung, Pusat Kesehatan Respirasi dan Layanan Spesialistik Terpadu Griya Puspa, fasilitas spirometri, bronkoskopi, torakoskopi, sleep apnea lab, bangsal respirasi, ruang kemoterapi, layanan laboratorium patologi klinik & mikrobiologi, patologi anatomi dll.",
    ),
    RumahSakit(
      namaRumahSakit: "Rumah Sakit Grha Kedoya",
      alamatRumahSakit: "Jl. Panjang Arteri No.26 - Kebon Jeruk, Jakarta Barat, Jakarta, Indonesia 11520",
      gambarRumahSakit: "https://static.konsula.com/images/practice/0001001000/0001000072/rumah-sakit-grha-kedoya.800x600.jpg",
      dataRumahSakit: "Terletak di kawasan Jalan Panjang Arteri 26, Kedoya Jakarta Barat, RS Grha Kedoya menjadi salah satu Rumah Sakit Swasta Modern di Indonesia yang menyediakan layanan Prima. Dengan kapastias 200 tempat tidur yang didukung oleh Tim Dokter Spesialis dan Sub Spesialis yang professional di bidangnya dan Perawat yang berpengalaman serta didukung oleh peralatan berteknologi modern. RS Grha Kedoya hadir untuk memberikan jawaban pasti atas keinginan pasien untuk mendapatkan pelayanan bermutu yang terbaik di bidang kesehatan. Mengukir identitas khas RS Grha Kedoya memberikan pelayanan bermutu dan terbaik dengan sentuhan pribadi baik dari para dokter, perawat serta seluruh staf Rumah Sakit.",
    ),
    RumahSakit(
      namaRumahSakit: "Rumah Sakit Ibu dan Anak Hermina Jatinegara",
      alamatRumahSakit: "Jl. Raya Jatinegara Barat No.126-127 - Jatinegara, Jakarta Timur, Jakarta, Indonesia 13320",
      gambarRumahSakit: "https://static.konsula.com/images/practice/0001001000/0001000336/rumah-sakit-ibu-dan-anak-hermina-jatinegara.800x600.png",
      dataRumahSakit: "RSIA Hermina Group adalah rumah sakit swasta sosio-ekonomi yang mengkhususkan diri dalam bidang pelayanan spesialistik kebidanan penyakit kandungan dan kesehatan anak, serta ditunjang dengan unit-unit pelayanan spesialistik lain Dalam menjalankan fungsinya, RSIA Hermina Group memberikan pelayanan kesehatan untuk wanita dan anak, pelayanan kesehatan diberikan secara optimal dan profesional bagi pasien, keluarga pasien dan dokter-dokter provider.",
    ),
    RumahSakit(
      namaRumahSakit: "Rumah Sakit Siloam Kebon Jeruk",
      alamatRumahSakit: "Jl. Raya Perjuangan Kav 8 - Kebon Jeruk, Jakarta Barat, Jakarta, Indonesia 11530",
      gambarRumahSakit: "https://static.konsula.com/images/practice/0001001000/0001000001/rumah-sakit-siloam-kebon-jeruk1.800x600.jpg",
      dataRumahSakit: "Dengan berbagai layanan unggulan seperti Kardiologi (Siloam Heart Institute), Neurologi (Parkinson’s Disease and Movement Disorder Centre), Ortopedi, dan Urologi, Rumah Sakit Siloam Kebon Jeruk siap untuk memberikan layanan medis terbaik pada masyarakat. Dukungan dari tim dokter, suster, petugas kesehatan, dan staf adminstrasi yang berpengalaman menjadi kekuatan bagi Rumah sakit ini untuk menyediakan beragam layanan mulai dari pemeriksaan dan diagnosis sampai pengobatan dan pemulihan pasien. Berada di lokasi yang strategis di dekat jalan tol Jakarta-Merak di Jakarta Barat, rumah sakit yang didirikan pada tahun 2000 dengan nama Rumah Sakit Graha Medika ini menjadi sangat mudah dijangkau oleh berbagai kalangan.",
    ),
  ];
}