import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeleton/app/components/default_text.dart';
import 'package:skeleton/app/modules/detail_surah/controllers/detail_surah_controller.dart';
import 'package:skeleton/config/color_constants.dart';

class TafsirCard extends GetView<DetailSurahController> {
  const TafsirCard({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        color: index % 2 == 0 ? kBgBlack : kInactiveColor,
        child: DefText(
          '${controller.surah.value.tafsir![index].ayat}. ${controller.surah.value.tafsir![index].teks}',
          color: kWhiteMilk,
        ).normal,
      ),
    );
  }
}
