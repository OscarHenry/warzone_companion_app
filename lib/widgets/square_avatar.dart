import 'package:flutter/material.dart';

class SquareAvatar extends StatelessWidget {
  final String imageUrl;
  final double size;

  const SquareAvatar({
    Key? key,
    required this.imageUrl,
    this.size = 32,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      constraints: BoxConstraints.tight(Size.square(size)),
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image:
            DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
        gradient: LinearGradient(
          colors: [
            Colors.blue[50]!,
            Colors.lightBlueAccent[100]!,
          ],
          tileMode: TileMode.decal,
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
    );
  }
}
