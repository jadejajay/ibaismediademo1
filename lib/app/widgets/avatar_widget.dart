import 'package:flutter/material.dart';
import 'package:ibaismedia/app/widgets/networkimage.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    super.key,
    required this.image,
    required this.width,
    required this.height,
  });

  final String image;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.blue,
      maxRadius: 30.0,
      child: ClipOval(
        child: PNetworkImage(
          image,
          width: width,
          height: height,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
