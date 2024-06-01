import 'package:dr_office_management/data/constants/app_colors.dart';
import 'package:dr_office_management/data/constants/constants.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: screenHeight(context),
        color: Colors.black.withOpacity(0.2),
        child: Center(
          child: Center(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: CircularProgressIndicator(
                  color: AppColors.themeColor,
                ),
              ),
            ),
          ),
        ));
  }
}
