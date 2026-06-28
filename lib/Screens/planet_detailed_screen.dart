import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:space_app/utilites/app_buttons.dart';
import 'package:space_app/utilites/page_view.dart';

import '../utilites/app_Constants.dart';
import '../utilites/app_colors.dart';
import '../utilites/app_scaffold.dart';
import '../utilites/text_style.dart';

class planetDetailed extends StatefulWidget {
  const planetDetailed({super.key});

  @override
  State<planetDetailed> createState() => _planetDetailedState();
}

class _planetDetailedState extends State<planetDetailed> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int index = ModalRoute.of(context)!.settings.arguments as int;
    final screenHeight = MediaQuery.of(context).size.height;
    return AppScaffold(
      body: SingleChildScrollView(
        child: Column(
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
                        AppConstants.planetNames[index],
                        textAlign: TextAlign.center,
                        style: AppTextStyle.titleLarge,
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          AppConstants.planetTitle[AppConstants
                              .planetNames[index]]!,
                          textAlign: TextAlign.start,
                          style: AppTextStyle.titleLarge,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 5,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ActionButton(
                            icon: Icon(Icons.arrow_back),
                            onClick: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: AppConstants.planets[AppConstants.planetNames[index]],
                ),
                SizedBox(height: 20),
                Padding(
                  // padding: const EdgeInsets.all(8.0),
                  padding: EdgeInsets.symmetric(horizontal: 16),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("About", style: AppTextStyle.titleLarge),
                      SizedBox(height: 10),
                      Text(
                        AppConstants.planetAboutDetailed[AppConstants
                            .planetNames[index]]!,
                        style: AppTextStyle.bodyLarge,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Distance from Sun (km) : " +
                            "${AppConstants.planetDistanceFromTheSun[AppConstants.planetNames[index]]!}",
                        style: AppTextStyle.detailedText,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Length of Day (hours) : " +
                            "${AppConstants.lengthOfDay[AppConstants.planetNames[index]]!}",
                        style: AppTextStyle.detailedText,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Orbital Period (Earth years) : " +
                            "${AppConstants.orbitalPeriod[AppConstants.planetNames[index]]!}",
                        style: AppTextStyle.detailedText,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Radius (km) : " +
                            "${AppConstants.radius[AppConstants.planetNames[index]]!}",
                        style: AppTextStyle.detailedText,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Mass (kg) : " +
                            "${AppConstants.mass[AppConstants.planetNames[index]]!}",
                        style: AppTextStyle.detailedText,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Gravity (m/s²) : " +
                            "${AppConstants.gravity[AppConstants.planetNames[index]]!}",
                        style: AppTextStyle.detailedText,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Surface Area (km²) : " +
                            "${AppConstants.surfaceArea[AppConstants.planetNames[index]]!}",
                        style: AppTextStyle.detailedText,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
