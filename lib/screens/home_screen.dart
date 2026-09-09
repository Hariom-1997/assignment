import 'package:assignment/core/constant/app_strings.dart';
import 'package:assignment/core/theme/app_spacing.dart';
import 'package:assignment/screens/account_screen.dart';
import 'package:assignment/screens/book_hotel_screen.dart';
import 'package:assignment/screens/dashboard_screen.dart';
import 'package:assignment/screens/hotel_resort_screen.dart';
import 'package:assignment/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:assignment/providers/base_provider.dart';
import 'package:assignment/screens/base_screen.dart';

class HomeScreen extends BaseScreen {
  const HomeScreen({super.key});

  @override
  BaseScreenState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseScreenState<HomeScreen> {
  @override
  Widget body(BuildContext context, BaseProvider controller) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Visibility(
          visible: controller.activeScreen == AppStrings.dashboard,
          child: const Expanded(
            child: Padding(
              padding: AppSpacing.px16,
              child: DashboardScreen(),
            ),
          ),
        ),

        Visibility(
          visible: controller.activeScreen == AppStrings.hotelResort,
          child: const Expanded(child: HotelResortScreen()),
        ),

        Visibility(
          visible: controller.activeScreen == AppStrings.bookingHotel,
          child: const Expanded(
            child: Padding(
              padding: AppSpacing.px16,
              child: BookHotelScreen(),
            ),
          ),
        ),

        Visibility(
          visible: controller.activeScreen == AppStrings.account,
          child: const Expanded(
            child: Padding(
              padding: AppSpacing.px16,
              child: AccountScreen(),
            ),
          ),
        ),

        Padding(
          padding: AppSpacing.px16,
          child: BottomNavBar(
            onChanged: (String? activeScreen) {
              controller.activeScreen = activeScreen ?? "";
            },
          ),
        ),

        AppSpacing.h20
      ],
    );
  }
}
