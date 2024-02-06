import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeleton/app/components/default_text.dart';
import 'package:skeleton/config/color_constants.dart';
import 'package:skeleton/config/constant.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Obx(
        () => ListView.separated(
          padding: kDefaultScaffoldPadding.copyWith(top: 20, bottom: 20),
          itemCount: controller.listSurah.length,
          separatorBuilder: (context, index) {
            return const SizedBox(height: 10);
          },
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              decoration: const BoxDecoration(
                color: kPrimaryColor2,
                borderRadius: kDefaultBorderRadius10,
              ),
              child: Row(
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
            );
          },
        ),
      ),
    );
  }
}
