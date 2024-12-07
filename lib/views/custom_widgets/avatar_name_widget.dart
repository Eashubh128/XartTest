import 'package:flutter/material.dart';
import 'package:xarttest/constants/color_constants.dart';
import 'package:xarttest/constants/dimension_constants.dart';
import 'package:xarttest/constants/font_constants.dart';

class AvatarNNameWidget extends StatelessWidget {
  String name;
  String profileUrl;
  AvatarNNameWidget({super.key, required this.name, required this.profileUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: DimensionConstants.borderRadius40,
          backgroundColor: ColorConstants.avatarBackgroundColor,
          child: ClipOval(
            child: Image.network(
              profileUrl,
              fit: BoxFit.cover,
              errorBuilder:
                  (BuildContext context, Object error, StackTrace? stackTrace) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2.0,
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: DimensionConstants.spacing10),
        Text(
          name,
          style: const TextStyle(
            color: Colors.black,
            fontSize: FontSizeConstants.font18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
