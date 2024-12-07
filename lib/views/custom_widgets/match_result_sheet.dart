import 'package:flutter/material.dart';
import 'package:xarttest/constants/asset_constants.dart';
import 'package:xarttest/constants/color_constants.dart';
import 'package:xarttest/constants/dimension_constants.dart';
import 'package:xarttest/constants/font_constants.dart';
import 'dart:math' as math;

import 'package:xarttest/constants/string_constants.dart';
import 'package:xarttest/views/custom_widgets/avatar_name_widget.dart';

class MatchResultSheet extends StatelessWidget {
  final Color backgroundColor;

  MatchResultSheet({required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: DimensionConstants.bottomSheetHeight,
      padding: const EdgeInsets.only(
          left: DimensionConstants.padding5,
          right: DimensionConstants.padding5,
          top: DimensionConstants.padding5),
      decoration: const BoxDecoration(
          color: ColorConstants.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(DimensionConstants.borderRadius10),
              topRight: Radius.circular(DimensionConstants.borderRadius10))),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(DimensionConstants.borderRadius10),
                topRight: Radius.circular(DimensionConstants.borderRadius10),
              ),
              child: CustomPaint(
                size: Size(MediaQuery.of(context).size.width,
                    DimensionConstants.dimen190),
                painter:
                    CurvedBackgroundPainter(backgroundColor: backgroundColor),
              ),
            ),
          ),
          Positioned(
            top: DimensionConstants.dimen10,
            right: 0,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close_rounded,
                color: ColorConstants.white,
                size: DimensionConstants.avatarSize,
              ),
            ),
          ),
          const Positioned(
              top: DimensionConstants.dimen20,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'You Won 🎉',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: FontSizeConstants.font32,
                          fontWeight: FontWeight.w500,
                          shadows: <Shadow>[
                            Shadow(
                                offset: Offset(.5, .5),
                                blurRadius: 5.0,
                                color: ColorConstants.grey800),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: DimensionConstants.spacing5),
                  Text(
                    'Opponent lossed by Timeout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: FontSizeConstants.font18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )),
          Positioned(
              top: DimensionConstants.dimen115,
              left: DimensionConstants.borderRadius60,
              right: DimensionConstants.borderRadius60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AvatarNNameWidget(
                    name: "Amit",
                    profileUrl:
                        "https://www.pngarts.com/explore/153063/download/153062",
                  ),
                  const Text(
                    '0-1',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: FontSizeConstants.font32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AvatarNNameWidget(
                    name: 'Yahoo2003',
                    profileUrl:
                        "https://www.pngarts.com/files/5/Avatar-Face-PNG-Image.png",
                  ),
                ],
              )),
          Positioned(
            top: DimensionConstants.dimen280,
            left: DimensionConstants.dimen20,
            right: DimensionConstants.dimen20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        DimensionConstants.borderRadius10),
                    border: Border.all(
                      color: ColorConstants.grey800,
                      width: 1.0,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: ColorConstants.black,
                        offset: Offset(0, 3),
                        blurRadius: 1.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConstants.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          DimensionConstants.borderRadius10,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: DimensionConstants.spacing32,
                        vertical: DimensionConstants.spacing16,
                      ),
                    ),
                    child: const Text(
                      StringConstants.rematch,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: FontSizeConstants.font18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: DimensionConstants.spacing16),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        DimensionConstants.borderRadius10),
                    border: Border.all(
                      color: ColorConstants.grey800,
                      width: 1.0,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: ColorConstants.black,
                        offset: Offset(0, 3),
                        blurRadius: 1.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConstants.grey800,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          DimensionConstants.borderRadius10,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: DimensionConstants.spacing32,
                        vertical: DimensionConstants.spacing16,
                      ),
                    ),
                    child: const Text(
                      StringConstants.newGame,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: FontSizeConstants.font18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CurvedBackgroundPainter extends CustomPainter {
  final Color backgroundColor;

  CurvedBackgroundPainter({required this.backgroundColor});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = backgroundColor;

    final path = Path();
    path.moveTo(0, size.height * 0.6);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height * 0.6,
    );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CurvedBackgroundPainter oldDelegate) => false;
}
