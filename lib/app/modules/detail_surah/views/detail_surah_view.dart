import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeleton/app/components/default_text.dart';
import 'package:skeleton/config/color_constants.dart';
import 'package:skeleton/config/constant.dart';

import '../components/ayat_card.dart';
import '../components/tafsir_card.dart';
import '../controllers/detail_surah_controller.dart';

class DetailSurahView extends GetView<DetailSurahController> {
  const DetailSurahView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(controller.surah.value.namaLatin),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: kBgWhite,
          ),
        ),
      ),
      body: Obx(
        () => AnimatedCrossFade(
          crossFadeState: controller.isLoading.value ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: kDefaultFastDuration,
          layoutBuilder: (topChild, topChildKey, bottomChild, bottomChildKey) {
            return topChild;
          },
          firstChild: const SizedBox(
            child: Center(
              child: CircularProgressIndicator(
                color: kPrimaryColor,
              ),
            ),
          ),
          secondChild: ListView(
            children: [
              Obx(
                () => Visibility(
                  visible: controller.suratNumber.value != 1 && controller.suratNumber.value != 9 && !controller.isTafsir.value,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: kInactiveColor,
                    ),
                    child: Center(
                      child: DefText(
                        ' بِسْمِ ٱللَّٰهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ',
                        color: kWhiteMilk,
                      ).extraHuge,
                    ),
                  ),
                ),
              ),
              Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.isTafsir.value ? controller.surah.value.tafsir?.length ?? 0 : controller.surah.value.ayat?.length ?? 0,
                  itemBuilder: (context, index) {
                    if (controller.isTafsir.value) {
                      return TafsirCard(
                        index: index,
                      );
                    }
                    return AyatCard(index: index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
