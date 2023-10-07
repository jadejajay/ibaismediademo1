// ignore_for_file: avoid_print

/// Author: Damodar Lohani
/// profile: https://github.com/lohanidamodar

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibaismedia/app/modules/mainscreen/controllers/mainscreen_controller.dart';
import 'package:ibaismedia/app/modules/mainscreen/controllers/timer_controller.dart';
// import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
// import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:ibaismedia/app/utils.dart' as assets;
import 'package:ibaismedia/app/widgets/avatar_widget.dart';
import 'package:ibaismedia/app/widgets/carousel_widget.dart';
// import 'package:ibaismedia/app/widgets/countdown.dart';
import 'package:ibaismedia/app/widgets/networkimage.dart';

import 'package:firebase_auth/firebase_auth.dart';

// Get the current user
final user = FirebaseAuth.instance.currentUser;

// Access the custom claims
final userType = user;

class HomePage extends GetView<MainscreenController> {
  final CountdownController countdownController =
      Get.find<CountdownController>();
  final List<String> categories = [
    'Hardware',
    'Wooden',
    'Tiles & Sanitary',
    'HomeDecor',
  ];
  final List<String> images = [
    assets.images[0],
    assets.images[2],
    assets.images[1],
    assets.images[3]
  ];
  final List<String> flashSaleImages = [
    "http://itekindia.com/chats/makeforce.png",
    "http://itekindia.com/chats/Hi-rise.png",
    "http://itekindia.com/chats/kehar.png"
  ];

  HomePage({super.key});

  Widget _buildListView(_, index) {
    if (index == 0) return const Carousel();
    if (index == 1) return _buildCategoriesGrid();
    if (index == 2) return _buildFlashSales();
    if (index == 3) return _buildPopular();
    if (index == 4) {
      return const Center(
          child: Text(
        'Explore Our Services',
        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
      ));
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: () {
                print("this is also clickable");
              },
              child: Column(
                children: <Widget>[
                  PNetworkImage(images[index % images.length]),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    'Top Quality fashion item',
                    softWrap: true,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    'Rs.1,254',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                print("this is also clickable");
              },
              child: Column(
                children: <Widget>[
                  PNetworkImage(images[(index - 1) % images.length]),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    'Top Quality fashion item',
                    softWrap: true,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    'Rs.1,254',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPopular() {
    return SizedBox(
      height: 180,
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                _buildPopularItem(
                  'Posts',
                  'Create beautiful post in a minute',
                  "http://itekindia.com/chats/bgbigwidth.jpeg",
                ),
                const SizedBox(
                  width: 10.0,
                ),
                _buildPopularItem(
                  'Videos',
                  'Create corporate videos very easily',
                  "http://itekindia.com/chats/bgbigwidth.jpeg",
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                _buildPopularItem(
                  'Dialogues',
                  'Add A.I. voice in your video',
                  "http://itekindia.com/chats/bgbigwidth.jpeg",
                ),
                const SizedBox(
                  width: 10.0,
                ),
                _buildPopularItem(
                  'Ads',
                  'Make advertisement as never before',
                  "http://itekindia.com/chats/bgbigwidth.jpeg",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Expanded _buildPopularItem(title, content, image) {
    return Expanded(
      child: Stack(
        children: [
          SizedBox(
            height: 70,
            // color: Colors.black,
            child: PNetworkImage(
              image,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            height: 70,
            decoration: BoxDecoration(
                // color: Colors.grey.shade200,
                border: Border(
                    left: BorderSide(
                        color: Colors.red.shade200,
                        style: BorderStyle.solid,
                        width: 5))),
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(0.0),
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    colors: [Colors.black45, Color.fromARGB(0, 255, 255, 255)],
                  )),
                ),
                ListTile(
                  onTap: () {
                    print("this is $title");
                  },
                  title: Text(
                    title,
                    style: GoogleFonts.robotoSerif(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  subtitle: Text(
                    content,
                    style: GoogleFonts.robotoSerif(
                        fontSize: 10, color: Colors.white),
                  ),
                  // trailing: SizedBox(
                  //     width: 50,
                  //     child: PNetworkImage(
                  //       image,
                  //       fit: BoxFit.fitWidth,
                  //     )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFlashSales() {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  const Text(
                    'Broadcast Ads',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  GetX<CountdownController>(
                    init: countdownController,
                    builder: (controller) {
                      String hours = (controller.remainingTime.inMinutes % 24)
                          .toString()
                          .padLeft(2, '0');
                      String minutes = (controller.remainingTime.inMinutes % 60)
                          .toString()
                          .padLeft(2, '0');
                      String seconds = (controller.remainingTime.inSeconds % 60)
                          .toString()
                          .padLeft(2, '0');

                      return Row(
                        children: [
                          const SizedBox(
                            width: 4,
                          ),
                          Container(
                            color: Colors.black,
                            child: Text(
                              hours,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Container(
                            color: Colors.black,
                            child: Text(
                              minutes,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Container(
                            color: Colors.black,
                            child: Text(
                              seconds,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
              Text(
                'Show All',
                style: GoogleFonts.roboto(color: Colors.black87),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              _buildFlashSaleItem(0),
              _buildFlashSaleItem(1),
              _buildFlashSaleItem(2),
            ],
          )
        ],
      ),
    );
  }

  Expanded _buildFlashSaleItem(int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          print("you pressed on $index");
        },
        child: Container(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: <Widget>[
              Container(
                height: 80,
                // color: Colors.blue,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(flashSaleImages[index]),
                        fit: BoxFit.contain)),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Stack(
                children: <Widget>[
                  ClipPath(
                    clipper: const ShapeBorderClipper(
                        shape: StadiumBorder(
                            side: BorderSide(
                                width: 1,
                                style: BorderStyle.solid,
                                color: Colors.red))),
                    child: Container(
                      height: 20,
                      color: Colors.red.shade200,
                    ),
                  ),
                  ClipPath(
                    clipper: const ShapeBorderClipper(
                        shape: StadiumBorder(
                            side: BorderSide(
                                width: 1,
                                style: BorderStyle.solid,
                                color: Colors.red))),
                    child: Container(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      height: 20,
                      // width: 70,
                      color: Colors.red,
                      alignment: Alignment.center,
                      child: Text(
                        '${(2 - index) * 999 + 6} Views',
                        // textAlign: TextAlign.center,

                        style: const TextStyle(
                            color: Colors.white,
                            backgroundColor: Colors.red,
                            fontSize: 10),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5.0,
              ),
              // const Text('Rs.275')
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buildSlider() {
  //   return SizedBox(
  //     height: 120.0,
  //     child: Stack(
  //       children: <Widget>[
  //         ClipPath(
  //           clipper: DiagonalPathClipperOne(),
  //           child: Container(
  //             height: 110,
  //             color: Colors.deepPurple,
  //           ),
  //         ),
  //         Container(
  //           padding: const EdgeInsets.symmetric(horizontal: 20.0),
  //           child: Swiper(
  //             autoplay: true,
  //             itemBuilder: (BuildContext context, int index) {
  //               return Image.network(
  //                 images[index],
  //                 fit: BoxFit.cover,
  //               );
  //             },
  //             itemCount: 4,
  //             pagination: const SwiperPagination(),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildCategoriesGrid() {
    return SizedBox(
      height: 110.0,
      child: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 0.0,
        ),
        itemBuilder: (_, int index) {
          return GestureDetector(
            onTap: () => print(categories[index]),
            child: Column(
              children: <Widget>[
                AvatarWidget(
                  image: images[index],
                  height: 60,
                  width: 60,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  categories[index % categories.length],
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          );
        },
        itemCount: categories.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView.builder(
        itemBuilder: _buildListView,
        itemCount: 10,
      )),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.shopping_cart), label: 'Cart'),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
      //   ],
      //   currentIndex: 0,
      //   type: BottomNavigationBarType.fixed,
      //   fixedColor: Colors.red,
      // ),
    );
  }
}
