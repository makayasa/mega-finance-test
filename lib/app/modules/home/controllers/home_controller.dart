import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:skeleton/app/controllers/network_controller.dart';
import 'package:skeleton/app/data/surah/surah.dart';
import 'package:skeleton/app/routes/app_pages.dart';
import 'package:skeleton/config/environtment.dart';
import 'package:skeleton/config/function_utils.dart';

class HomeController extends GetxController {
  final network = Get.find<NetworkController>();

  final listSurah = <Surah>[].obs;

  Future<void> getSurah() async {
    try {
      final dio.Response res = await network.get(
        '$baseurl/surat',
      );
      for (var e in res.data['data']) {
        final surah = Surah.fromJson(e);
        listSurah.add(surah);
      }
      logKey('res getSurah', res.statusCode);
    } on dio.DioException catch (e) {
      logKey('error getSurah', e.response);
    }
  }

  void toDetailSurah(int nomor, {bool isTafsir = false}) {
    Get.toNamed(
      Routes.DETAIL_SURAH,
      arguments: {
        'nomor': nomor,
        'is_tafsir':isTafsir,
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    getSurah();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
