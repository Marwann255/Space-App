import 'package:flutter/material.dart';
import 'package:space_app/utilites/app_buttons.dart';
import 'package:space_app/utilites/app_colors.dart';
import 'package:space_app/utilites/app_scaffold.dart';
import 'package:space_app/utilites/text_style.dart';

import 'app_Constants.dart';

class AppPageView extends StatefulWidget {
  // final Map<String, Widget> planetImage;
  final Map<String, Widget> planetImage;
  final PageController pageController;
  final ValueChanged<int> onPageChanged;

  const AppPageView({
    super.key,
    required this.planetImage,
    required this.pageController,
    required this.onPageChanged,
  });

  @override
  State<AppPageView> createState() => _AppPageViewState();
}

// List<String> planetImageIndex = ["","","","","","","","","",];

class _AppPageViewState extends State<AppPageView> {
  static int currentPage = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final planetWidget = widget.planetImage.values.toList();

    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(44),
          child: Container(
            height: screenHeight * 0.45,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: PageView(
                    controller: widget.pageController,
                    onPageChanged: widget.onPageChanged,
                    children: planetWidget,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
