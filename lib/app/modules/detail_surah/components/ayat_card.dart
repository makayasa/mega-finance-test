import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeleton/app/components/default_text.dart';
import 'package:skeleton/app/modules/detail_surah/controllers/detail_surah_controller.dart';
import 'package:skeleton/config/color_constants.dart';

class AyatCard extends GetView<DetailSurahController> {
  const AyatCard({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        color: index % 2 == 0 ? kBgBlack : kInactiveColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: DefText(
                '${controller.surah.value.ayat![index].teksArab} ${controller.surah.value.ayat![index].nomorAyat}',
                color: kWhiteMilk,
              ).large,
            ),
            const SizedBox(height: 10),
            DefText(
              '${controller.surah.value.ayat![index].nomorAyat}. ${controller.surah.value.ayat![index].teksLatin}',
              fontStyle: FontStyle.italic,
              color: kWhiteMilk,
            ).normal,
            const SizedBox(height: 10),
            DefText(
              '${controller.surah.value.ayat![index].nomorAyat}. ${controller.surah.value.ayat![index].teksIndonesia}',
              color: kWhiteMilk,
            ).normal,
          ],
        ),
      ),
    );
  }
}
