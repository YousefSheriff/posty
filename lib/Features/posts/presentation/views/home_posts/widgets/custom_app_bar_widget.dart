import 'package:flutter/material.dart';
import 'package:posty/core/utils/app_colors.dart';
import 'package:posty/core/utils/app_styles.dart';

AppBar  CustomAppBarWidget () {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text('Posts', style: AppStyles.textStyle17),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.appPrimaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.add_rounded, color: Colors.white, size: 20),
          ),
        ),
      ],
    );

}
