import 'package:assignment/core/constant/app_strings.dart';
import 'package:assignment/core/constant/asset_constant.dart';
import 'package:assignment/core/theme/app_color.dart';
import 'package:assignment/core/theme/app_radius.dart';
import 'package:assignment/core/theme/app_spacing.dart';
import 'package:flutter/material.dart';

import 'package:assignment/features/home/controllers/hotel_resort_controller.dart';
import 'package:get/get.dart';

class HotelResortView extends StatefulWidget {
  const HotelResortView({super.key});

  @override
  State<HotelResortView> createState() => _HotelResortViewState();
}

class _HotelResortViewState extends State<HotelResortView> {
  final PageController _pageController = PageController();
  final controller = Get.put(HotelResortController());

  final List<String> hotelImages = [
    AppAssets.hotelUrl1,
    AppAssets.hotelUrl2,
    AppAssets.hotelUrl3,
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: AppColor.scaffoldBackground,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                // 1. HOTEL IMAGE CAROUSEL
                SizedBox(
                  height: size.height * 0.40,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: hotelImages.length,
                    onPageChanged: (index) {
                      controller.updateImage(index);
                    },
                    itemBuilder: (context, index) {
                      return Image.network(
                        '${hotelImages[index]}?auto=format&fit=crop&w=1200&q=80',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: AppColor.grey600,
                            child: const Icon(
                              Icons.image,
                              color: AppColor.white,
                              size: 50,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),

                // Dark overlay gradient
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColor.black.withValues(alpha: 0.3),
                          AppColor.transparent,
                          AppColor.black.withValues(alpha: 0.5),
                        ],
                      ),
                    ),
                  ),
                ),

                // 2. IMAGE DOTS
                Positioned(
                  bottom: 45,
                  left: 0,
                  right: 0,
                  child: Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      hotelImages.length,
                          (index) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          height: 6,
                          width: controller.currentImage.value == index ? 32 : 20,
                          decoration: BoxDecoration(
                            color: controller.currentImage.value == index
                                ? AppColor.orangeAccent
                                : AppColor.white70,
                            borderRadius: AppRadius.br25,
                          ),
                        );
                      },
                    ),
                  )),
                ),

                // 3. FLOATING CARD VIEW
                Positioned(
                  top: size.height * 0.34,
                  left: 0,
                  right: 0,
                  child: Material(
                    color: AppColor.transparent,
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: AppColor.cardBackground,
                        borderRadius: AppRadius.br30,
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.black.withValues(alpha: 0.2),
                            blurRadius: 14,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: AppSpacing.hotelCardPadding,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Host Row
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 56,
                                  height: 56,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: AppColor.white24,
                                      width: 2,
                                    ),
                                  ),
                                  child: ClipOval(
                                    child: Image.network(
                                      '${AppAssets.hostUrl}?auto=format&fit=crop&w=300&q=80',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                AppSpacing.w16,
                                const Expanded(
                                  child: Text(
                                    AppStrings.hostedBy,
                                    style: TextStyle(
                                      color: AppColor.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      height: 1.3,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 18),
                              child: Divider(color: AppColor.white12, height: 1),
                            ),

                            // Rating / Reviews / Date
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: AppColor.orangeAccent,
                                  size: 20,
                                ),
                                AppSpacing.w6,
                                const Text(
                                  AppStrings.hotelRating,
                                  style: TextStyle(
                                    color: AppColor.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(height: 16, width: 1, color: AppColor.white30),
                                const SizedBox(width: 10),
                                const Expanded(
                                  child: Text(
                                    AppStrings.hotelReviews,
                                    style: TextStyle(
                                      color: AppColor.white70,
                                      fontSize: 13,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Container(height: 16, width: 1, color: AppColor.white30),
                                const SizedBox(width: 10),
                                const Text(
                                  AppStrings.bookingDateRange,
                                  style: TextStyle(
                                    color: AppColor.white70,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),

                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 18),
                              child: Divider(color: AppColor.white12, height: 1),
                            ),

                            // Address
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 44,
                                  width: 44,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColor.blueAccent,
                                  ),
                                  child: const Icon(
                                    Icons.location_on_outlined,
                                    color: AppColor.white,
                                    size: 22,
                                  ),
                                ),
                                AppSpacing.w16,
                                const Expanded(
                                  child: Text(
                                    AppStrings.hotelAddress,
                                    style: TextStyle(
                                      color: AppColor.greyLightText,
                                      fontSize: 13.5,
                                      height: 1.45,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
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

            // Spacing to offset stacked card height
            const SizedBox(height: 200),

            // ------------------------------------------------
            // DESCRIPTION SECTION
            // ------------------------------------------------
            Container(
              color: AppColor.scaffoldBackground,
              padding: AppSpacing.hotelDescriptionPadding,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.description,
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    AppStrings.hotelFullDescription,
                    style: TextStyle(
                      color: AppColor.greyDescription,
                      fontSize: 14.5,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
