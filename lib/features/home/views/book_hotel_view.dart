import 'package:assignment/core/constant/app_strings.dart';
import 'package:assignment/core/theme/app_radius.dart';
import 'package:assignment/core/theme/app_shadows.dart';
import 'package:assignment/core/theme/app_spacing.dart';
import 'package:assignment/core/theme/app_typography.dart';
import 'package:assignment/core/theme/app_color.dart';
import 'package:assignment/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import 'package:assignment/features/home/controllers/booking_controller.dart';
import 'package:get/get.dart';

class BookHotelView extends StatelessWidget {
  BookHotelView({super.key});

  final controller = Get.put(BookingController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: AppSpacing.phv16_16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CalendarHeader(),
              const DateRange(),
              AppSpacing.h32,
              Obx(() => CalendarWidget(
                currentMonth: controller.currentMonth.value,
                onPrevious: controller.previousMonth,
                onNext: controller.nextMonth,
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class CalendarHeader extends StatelessWidget {
  const CalendarHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppStrings.twoNightStay,
          style: AppTypography.h0,
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            AppStrings.cancelDate,
            style: AppTypography.linkOrange,
          ),
        ),
      ],
    );
  }
}

class DateRange extends StatelessWidget {
  const DateRange({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSpacing.h8,
        Text(
          AppStrings.defaultDateRange,
          style: AppTypography.bodyLarge.copyWith(color: AppColor.grey500),
        ),
      ],
    );
  }
}

class CalendarWidget extends StatelessWidget {
  final DateTime currentMonth;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const CalendarWidget({
    Key? key,
    required this.currentMonth,
    required this.onPrevious,
    required this.onNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarGrid(currentMonth: currentMonth),
        AppSpacing.h40,
        NavigationButtons(
          onPrevious: onPrevious,
          onNext: onNext,
        ),
      ],
    );
  }
}

class MonthYear extends StatelessWidget {
  final DateTime currentMonth;

  const MonthYear({Key? key, required this.currentMonth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final monthName = _getMonthName(currentMonth.month);
    final year = currentMonth.year;

    return Center(
      child: CustomText(text: '$monthName $year',fontSize: AppTypography.titleLarge.fontSize,)
    );
  }

  String _getMonthName(int month) {
    return AppStrings.months[month - 1];
  }
}

class CalendarGrid extends StatelessWidget {
  final DateTime currentMonth;

  const CalendarGrid({Key? key, required this.currentMonth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firstDay = DateTime(currentMonth.year, currentMonth.month, 1);
    final lastDay = DateTime(currentMonth.year, currentMonth.month + 1, 0);
    final daysInMonth = lastDay.day;
    final firstWeekday = firstDay.weekday;

    final calendarDays = <int>[];

    // Add empty cells for days before month starts
    for (int i = 0; i < firstWeekday % 7; i++) {
      calendarDays.add(0);
    }

    // Add days of the month
    for (int i = 1; i <= daysInMonth; i++) {
      calendarDays.add(i);
    }

    // Add empty cells for days after month ends
    while (calendarDays.length % 7 != 0) {
      calendarDays.add(0);
    }

    return Container(
      decoration: BoxDecoration(
        color: AppColor.lightBlack,
        borderRadius: AppRadius.br30,
        border: Border.all(
          color: AppColor.grey10,
        ),
      ),
      padding: AppSpacing.p24,
      child: Column(
        children: [
          MonthYear(currentMonth: currentMonth),
          AppSpacing.h24,
          WeekdayHeader(),
          AppSpacing.h24,
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              crossAxisSpacing: 12,
              mainAxisSpacing: 16,
            ),
            itemCount: calendarDays.length,
            itemBuilder: (context, index) {
              final day = calendarDays[index];
              return CalendarDay(day: day);
            },
          ),
        ],
      ),
    );
  }
}

class WeekdayHeader extends StatelessWidget {
  const WeekdayHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weekdays = AppStrings.weekdays;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: weekdays.map((day) {
        return Expanded(
          child: Center(
            child: Text(
              day,
              style: AppTypography.weekday,
            ),
          ),
        );
      }).toList(),
    );
  }
}

class CalendarDay extends StatelessWidget {
  final int day;

  const CalendarDay({Key? key, required this.day}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (day == 0) {
      return const SizedBox.shrink();
    }

    return Center(
      child: Text(
        day.toString(),
        style: AppTypography.calendarDay,
      ),
    );
  }
}

class NavigationButtons extends StatelessWidget {
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const NavigationButtons({
    Key? key,
    required this.onPrevious,
    required this.onNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        NavigationButton(
          icon: Icons.arrow_back,
          onTap: onPrevious,
        ),
        AppSpacing.w60,
        NavigationButton(
          icon: Icons.arrow_forward,
          onTap: onNext,
        ),
      ],
    );
  }
}

class NavigationButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const NavigationButton({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: AppColor.primaryBlue,
          shape: BoxShape.circle,
          boxShadow: [
            AppShadows.smallBlueShadow,
          ],
        ),
        child: Icon(
          icon,
          color: AppColor.white,
          size: 24,
        ),
      ),
    );
  }
}
