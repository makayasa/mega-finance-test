import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeleton/app/components/default_button.dart';
import 'package:skeleton/app/components/default_text.dart';
import 'package:skeleton/app/modules/home/controllers/home_controller.dart';
import 'package:skeleton/config/color_constants.dart';
import 'package:skeleton/config/constant.dart';

class SurahCard extends GetView<HomeController> {
  const SurahCard({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: const BoxDecoration(
          color: kPrimaryColor2,
          borderRadius: kDefaultBorderRadius10,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    // color: kPrimaryColor,
                    color: kWhiteMilk,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: DefText(
                      '${index + 1}',
                      color: kBgBlack,
                    ).normal,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefText(
                      controller.listSurah[index].namaLatin,
                      fontWeight: FontWeight.bold,
                    ).large,
                    const SizedBox(height: 5),
                    DefText(
                      controller.listSurah[index].arti,
                      color: kSecondaryColor,
                    ).semilarge,
                  ],
                ),
                const Spacer(),
                DefText(
                  controller.listSurah[index].nama,
                  fontWeight: FontWeight.bold,
                ).large,
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: DefaultButton(
                    onTap: () {
                      controller.toDetailSurah(controller.listSurah[index].nomor, isTafsir: true);
                    },
                    child: Center(
                      child: DefText('Tafsir').normal,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: DefaultButton(
                    onTap: () {
                      controller.toDetailSurah(controller.listSurah[index].nomor);
                    },
                    child: Center(
                      child: DefText('Baca').normal,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
