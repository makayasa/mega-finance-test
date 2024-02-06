import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:skeleton/app/controllers/network_controller.dart';
import 'package:skeleton/app/data/surah/surah.dart';
import 'package:skeleton/config/environtment.dart';
import 'package:skeleton/config/function_utils.dart';

class DetailSurahController extends GetxController {
  final network = Get.find<NetworkController>();
  final isLoading = true.obs;


  final suratNumber = 0.obs;
  final surah = Surah.empty().obs;
  final isTafsir = false.obs;

  void initialFunction() async {
    suratNumber.value = Get.arguments['nomor'];
    isTafsir.value = Get.arguments['is_tafsir'];
    getDetailSurah();
  }

  Future<void> getDetailSurah() async {
    try {
      final dio.Response res = await network.get(
        isTafsir.value ?
        '$baseurl/tafsir/${suratNumber.value}':
        '$baseurl/surat/${suratNumber.value}',
      );
      logKey('res getDetailSurah', res.statusCode);
      surah.value = Surah.fromJson(res.data['data']);
      isLoading.value = false;
      // logKey('res getDetailSurah', surah.toJson());
    } on dio.DioException catch (e) {
      Get.back();
      showToast('error');
      logKey('error getDetailSurah', e.response);
    }
  }

  @override
  void onInit() {
    super.onInit();
    initialFunction();
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
