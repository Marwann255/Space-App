import 'package:flutter/material.dart';
import 'package:space_app/utilites/app_colors.dart';
import 'package:space_app/utilites/app_scaffold.dart';
import 'package:space_app/utilites/text_style.dart';

import '../utilites/app_Constants.dart';
import '../utilites/app_buttons.dart';
import '../utilites/page_view.dart';

class homeScreen extends StatefulWidget {
  // String? routeName = "homeScreen";
  homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return AppScaffold(
      body: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.25,
            child: SafeArea(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Opacity(
                    opacity: 0.5,
                    child: Image.asset(
                      "assets/Rectangle 4.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          AppColors.black.withOpacity(0.4),
                        ],
                        begin: AlignmentGeometry.topCenter,
                        end: AlignmentGeometry.bottomCenter,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 0,
                    right: 0,
                    child: Text(
                      "Explore",
                      textAlign: TextAlign.center,
                      style: AppTextStyle.titleLarge,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Which Planet \nWould You like to explore?",
                        textAlign: TextAlign.start,
                        style: AppTextStyle.titleLarge,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          AppPageView(
            planetImage: AppConstants.planets,
            pageController: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
          ),
          SizedBox(height: screenHeight*0.07),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ActionButton(
                    icon: Icon(Icons.arrow_back),
                    onClick: () {
                      _pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                  SizedBox(width: 20),
                  Center(
                    child: Text(
                      AppConstants.planetNames[_currentPage],
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(width: 20),
                  ActionButton(
                    icon: Icon(Icons.arrow_forward),
                    onClick: () {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: screenHeight*0.05),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 24),
                    child: ExploreAppButtons(
                      text: AppConstants.buttonText,
                      planetName: AppConstants.planetNames[_currentPage],
                      onClick: () {
                        Navigator.pushNamed(
                          context,
                          "planetDetailedScreen",
                          arguments: _currentPage,
                        );
                      },
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
