import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeleton/config/constant.dart';

import '../components/surah_card.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
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
            return SurahCard(index: index);
          },
        ),
      ),
    );
  }
}
