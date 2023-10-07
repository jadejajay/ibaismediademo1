import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:curved_drawer_fork/curved_drawer_fork.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibaismedia/app/modules/mainscreen/controllers/timer_controller.dart';
import 'package:ibaismedia/app/modules/mainscreen/views/profile_view.dart';
import '../controllers/mainscreen_controller.dart';

class MainscreenView extends GetView<MainscreenController> {
  MainscreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CountdownController pageController =
        Get.put(CountdownController(Duration(days: 1), () {
      print('finished');
    }));
    return Scaffold(
      appBar: EasySearchBar(
          backgroundColor: Colors.white,
          title: Text(
            'IBAIS MEDIA',
            style: GoogleFonts.righteous(),
          ),
          onSearch: (value) => controller.searchValue = value,
          actions: [
            IconButton(
                icon: const Icon(Icons.person),
                onPressed: () {
                  Get.to(const ProfileView());
                })
          ],
          asyncSuggestions: (value) async =>
              await controller.fetchSuggestions(value)),
      drawer: CurvedDrawer(
        color: Colors.white,
        labelColor: Colors.black54,
        animationDuration: const Duration(milliseconds: 500),
        width: 75.0,
        items: const <DrawerItem>[
          DrawerItem(icon: Icon(Icons.person)),
          //Optional Label Text
          DrawerItem(icon: Icon(Icons.message), label: "Messages")
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
      body: Obx(() => controller.loadWidget()),
      bottomNavigationBar: ConvexAppBar.badge(
        const {0: '99+', 1: Icons.assistant_photo, 2: Colors.redAccent},
        backgroundColor: Colors.white,
        color: Colors.black,
        activeColor: Colors.black,
        badgeMargin: const EdgeInsets.fromLTRB(30, 0, 0, 20),
        // style: TabStyle.reactCircle,
        items: const [
          TabItem(icon: Icons.list),
          TabItem(icon: Icons.calendar_today),
          TabItem(icon: Icons.assessment),
        ],

        initialActiveIndex: 0,
        onTap: (int i) => {
          controller.currentParameter.value = (i + 1),
        },
      ),
    );
  }
}
