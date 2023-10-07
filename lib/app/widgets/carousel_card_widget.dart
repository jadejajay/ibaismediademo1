import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:my_app/configs/show_toast.dart';

// import 'package:dio/dio.dart';

class CarouselCard extends StatelessWidget {
  const CarouselCard({super.key, required this.link});
  final String link;
  // final dio = Dio();
  // final out = '${(await getTemporaryDirectory()).path}/BigBuckBunny.mp4';
  // Future outFile() async {
  //   await dio.download(
  //     'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
  //     out,
  //     onReceiveProgress: (received, total) {
  //       if (total != -1) {
  //         print(
  //             '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ ${(received / total * 100).toStringAsFixed(0)}% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
  //       }
  //     },
  //   );

  //   return out;
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        print("i am carousel item with : $link");
        // final picker = ImagePicker();
        // await picker.pickImage(source: ImageSource.gallery).then((file) async {
        //   File editedFile = await Navigator.of(context).push(MaterialPageRoute(
        //       // builder: (context) => StoryDesigner(
        //       //       filePath: file!.path,
        //       //     )));
        //       builder: (context) => Builder(builder: (context) {
        //             return ListView(children: [ContentList()]);
        //           })));

        //   // ------- you have editedFile

        //   print('editedFile: ${editedFile.path}');
        // });
        // showAlertDialog(context, "hello world!!!!", "stop navigating buddy");
      },
      child: Container(
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          image: DecorationImage(
            image: NetworkImage(link),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

//  Get.snackbar(
//           'SnackBar Title',
//           'This is a SnackBar!',
//           snackPosition: SnackPosition.BOTTOM,
//           duration: Duration(seconds: 3),
//         );


