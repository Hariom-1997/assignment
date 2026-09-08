import 'package:assignment/core/constant/app_strings.dart';
import 'package:assignment/core/base/base_view_controller.dart';
import 'package:assignment/core/theme/app_color.dart';
import 'package:assignment/core/theme/app_radius.dart';
import 'package:assignment/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  final Function(String? activeScreen) onChanged;
  BottomNavBar({super.key, required this.onChanged});

  final controller = Get.find<BaseViewController>();

  final List<Map<String, dynamic>> _items = [
    {'icon': Icons.home_outlined, 'title': AppStrings.dashboard},
    {'icon': Icons.airplanemode_on_rounded, 'title': AppStrings.hotelResort},
    {'icon': Icons.calendar_month, 'title': AppStrings.bookingHotel},
    {'icon': Icons.verified_user_outlined, 'title': AppStrings.account},
  ];

  static const double _spacing = 10;
  static const double _inactiveWidth = 52;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: AppColor.darkGrey,
        borderRadius: AppRadius.br25,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double totalWidth = constraints.maxWidth;
          final int itemCount = _items.length;
          final int inactiveCount = itemCount - 1;
          final double totalSpacing = _spacing * (itemCount - 1);

          final double activeWidth = totalWidth -
              (_inactiveWidth * inactiveCount) -
              totalSpacing;

          return Obx(() => Row(
            children: List.generate(itemCount, (index) {
              final item = _items[index];
              final bool isActive = item['title'] == controller.activeScreen.value;

              return Padding(
                padding: EdgeInsets.only(
                  right: index < itemCount - 1 ? _spacing : 0,
                ),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  width: isActive ? activeWidth : _inactiveWidth,
                  child: iconMenu(
                    icon: item['icon'],
                    title: item['title'],
                    isActive: isActive,
                    onTap: () {
                      onChanged(item['title']);
                    },
                  ),
                ),
              );
            }),
          ));
        },
      ),
    );
  }

  Widget iconMenu({
    required IconData icon,
    required String title,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(25),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: isActive ? Colors.blue : AppColor.darkGrey,
          borderRadius: BorderRadius.circular(25),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: ClipRect(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(icon, color: Colors.white),
              AnimatedSize(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                child: isActive
                    ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(width: 8),
                    Flexible(
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: isActive ? 1 : 0,
                        child: CustomText(
                          text: title,
                          color: Colors.white,
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ],
                )
                    : const SizedBox(width: 0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}