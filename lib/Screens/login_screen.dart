import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:space_app/utilites/app_Constants.dart';
import 'package:space_app/utilites/app_buttons.dart';
import 'package:space_app/utilites/app_colors.dart';
import 'package:space_app/utilites/app_scaffold.dart';

class loginScreen extends StatelessWidget {
  // String routeName = "loginScreen";
  const loginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/Frame 1.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  AppConstants.homeScreenText,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 24),
                    child: ExploreAppButtons(
                      text: AppConstants.buttonText,
                      planetName: "",
                      onClick: () {
                        Navigator.pushNamed(context, "homeScreen");
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
