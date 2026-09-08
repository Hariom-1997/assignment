import 'package:assignment/core/base/base_view_controller.dart';
import 'package:assignment/core/constant/app_strings.dart';
import 'package:assignment/core/theme/app_radius.dart';
import 'package:assignment/core/theme/app_shadows.dart';
import 'package:assignment/core/theme/app_spacing.dart';
import 'package:assignment/core/theme/app_typography.dart';
import 'package:assignment/features/home/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_color.dart';
import '../../../core/widgets/custom_text.dart';
import '../widgets/location_card.dart';

class DashboardView extends StatelessWidget {
  final BaseViewController controller;
  const DashboardView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: AppShadows.dashboardGradient,
        borderRadius: BorderRadius.circular(
            controller.slideAnimation.value.dx / 10),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSpacing.h20,
            headerBar(),
            AppSpacing.h32,
            SearchBox(
              onChanged: (value) => controller.filterLocations(value),
            ),
            AppSpacing.h32,
            Expanded(
              child: Obx(() => _buildLocationCardsList()),
            ),
          ],
        ),
      ),
    );
  }

  Widget headerBar() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CustomText(
        text: AppStrings.greeting,
        fontSize: AppTypography.hTitle.fontSize,
        fontWeight: AppTypography.hTitle.fontWeight,
      ),
        InkWell(
          onTap: () => controller.animationController.forward(),
          borderRadius: AppRadius.br30,
          child: Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: AppColor.blueGrey,
              borderRadius: AppRadius.br30,
            ),
            child: Center(
              child: Container(
                height: 10,
                width: 18,
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(color: AppColor.white, width: 1.5),
                    bottom: BorderSide(color: AppColor.white, width: 1.5),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );

  Widget _buildLocationCardsList() {
    return ListView.separated(
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      itemCount: controller.filteredLocations.length,
      separatorBuilder: (context, index) => AppSpacing.h16,
      itemBuilder: (context, index) {
        final location = controller.filteredLocations[index];
        return LocationCard(
          name: location['name']!,
          distance: location['distance']!,
          available: location['available']!,
          price: location['price']!,
          imagePath: location['imagePath']!,
        );
      },
    );
  }
}
