import 'package:assignment/core/base/base_view.dart';
import 'package:assignment/core/base/base_view_controller.dart';
import 'package:assignment/core/constant/app_strings.dart';
import 'package:assignment/core/theme/app_spacing.dart';
import 'package:assignment/features/home/views/account_view.dart';
import 'package:assignment/features/home/views/book_hotel_view.dart';
import 'package:assignment/features/home/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dashboard_view.dart';
import 'hotel_resort_view.dart';

class HomeScreen extends BaseView {
 final controller  =  Get.put(BaseViewController());
  HomeScreen({super.key});

  @override
  Widget body(BuildContext context) {
    return GetBuilder<BaseViewController>(
      builder:(controller) =>  Obx(() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Visibility(
            visible: controller.activeScreen.value == AppStrings.dashboard,
            child: Expanded(
              child: Padding(
                padding: AppSpacing.px16,
                child: DashboardView(controller: controller),
              ),
            ),
          ),

          Visibility(
            visible: controller.activeScreen.value == AppStrings.hotelResort,
            child: const Expanded(child: HotelResortView()),
          ),

          Visibility(
            visible: controller.activeScreen.value == AppStrings.bookingHotel,
            child: Expanded(
              child: Padding(
                padding: AppSpacing.px16,
                child: BookHotelView(),
              ),
            ),
          ),

          Visibility(
            visible: controller.activeScreen.value == AppStrings.account,
            child: Expanded(
              child: Padding(
                padding: AppSpacing.px16,
                child: AccountView(),
              ),
            ),
          ),

          Padding(
            padding: AppSpacing.px16,
            child: BottomNavBar(onChanged: (String? activeScreen) {
              controller.activeScreen.value = activeScreen??"";
              controller.update();
            },),
          ),

          AppSpacing.h20
        ],
      )),
    );
  }

}