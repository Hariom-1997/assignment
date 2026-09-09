import 'dart:ui';
import 'package:assignment/core/constant/app_strings.dart';
import 'package:assignment/core/theme/app_radius.dart';
import 'package:assignment/core/theme/app_shadows.dart';
import 'package:assignment/core/theme/app_spacing.dart';
import 'package:assignment/core/theme/app_typography.dart';
import 'package:assignment/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class LocationCard extends StatelessWidget {
  final String name;
  final String distance;
  final String available;
  final String price;
  final String imagePath;

  const LocationCard({
    Key? key,
    required this.name,
    required this.distance,
    required this.available,
    required this.price,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: AppRadius.br30,
        boxShadow: [
          AppShadows.cardShadow,
        ],
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          // Image Background
          Container(
            height: 280,
            width: double.infinity,
            color: AppColor.blueGrey,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: AppColor.blueGrey,
                  child: const Center(
                    child: Icon(
                      Icons.broken_image_outlined,
                      color: AppColor.grey,
                      size: 40,
                    ),
                  ),
                );
              },
            ),
          ),

          // Gradient Overlay
          Container(
            height: 280,
            decoration: BoxDecoration(
              gradient: AppShadows.overlayGradient75,
            ),
          ),

          // Info Section at Bottom — Ambient Glass Effect
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppRadius.r30),
                topRight: Radius.circular(AppRadius.r30),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color:AppColor.lightBlack,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(AppRadius.r30),
                      topRight: Radius.circular(AppRadius.r30),
                    ),
                    border: Border(
                      top: BorderSide(
                        color: AppColor.grey20,
                        width: 1,
                      ),
                    ),
                  ),
                  padding: AppSpacing.phv20_16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: AppTypography.titleXLarge,
                      ),
                      AppSpacing.h12,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InfoColumn(label: AppStrings.distance, value: distance),
                          InfoColumn(label: AppStrings.available, value: available),
                          InfoColumn(
                            label: AppStrings.price,
                            value: price,
                            valueColor: AppColor.lightBlue,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class InfoColumn extends StatelessWidget {
  final String label;
  final String value;
  final Color valueColor;

  const InfoColumn({
    Key? key,
    required this.label,
    required this.value,
    this.valueColor = AppColor.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.bodySmall,
        ),
        AppSpacing.h6,
        Text(
          value,
          style: AppTypography.titleLarge.copyWith(color: valueColor),
        ),
      ],
    );
  }
}
