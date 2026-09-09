import 'package:assignment/core/constant/app_strings.dart';
import 'package:assignment/core/theme/app_radius.dart';
import 'package:assignment/core/theme/app_spacing.dart';
import 'package:assignment/core/theme/app_typography.dart';
import 'package:assignment/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../core/theme/app_color.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<SettingItem> settings = [
      SettingItem(
        icon: Icons.person_outline,
        title: AppStrings.editProfile,
        subtitle: AppStrings.subtitleEditProfile,
        badge: '',
      ),
      SettingItem(
        icon: Icons.person_add_outlined,
        title: AppStrings.accountTitle,
        subtitle: AppStrings.subtitleAccount,
        badge: '',
      ),
      SettingItem(
        icon: Icons.notifications_outlined,
        title: AppStrings.notification,
        subtitle: AppStrings.subtitleNotification,
        badge: '',
      ),
      SettingItem(
        icon: Icons.palette_outlined,
        title: AppStrings.appearance,
        subtitle: AppStrings.subtitleAppearance,
        badge: '',
      ),
      SettingItem(
        icon: Icons.help_outline,
        title: AppStrings.helpFeedback,
        subtitle: AppStrings.subtitleHelp,
        badge: '',
      ),
      SettingItem(
        icon: Icons.person_add_outlined,
        title: AppStrings.inviteFriend,
        subtitle: AppStrings.subtitleInvite,
        badge: '',
      ),
      SettingItem(
        icon: Icons.security_outlined,
        title: AppStrings.privacySecurity,
        subtitle: AppStrings.subtitlePrivacy,
        badge: '',
      ),
      SettingItem(
        icon: Icons.credit_card_outlined,
        title: AppStrings.subscription,
        subtitle: AppStrings.subtitleSubscription,
        badge: AppStrings.comingSoon,
      ),
    ];

    return SafeArea(
      child: ListView.separated(
        padding: AppSpacing.phv16_16,
        itemCount: settings.length,
        separatorBuilder: (context, index) => AppSpacing.h12,
        itemBuilder: (context, index) {
          return SettingItemWidget(setting: settings[index]);
        },
      ),
    );
  }
}

class SettingItem {
  final IconData icon;
  final String title;
  final String subtitle;
  final String badge;

  SettingItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.badge,
  });
}

class SettingItemWidget extends StatelessWidget {
  final SettingItem setting;

  const SettingItemWidget({Key? key, required this.setting}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.lightBlack,
        borderRadius: AppRadius.br30,
        border: Border.all(
          color: AppColor.grey15,
        ),
      ),
      padding: AppSpacing.p8,
      child: Row(
        children: [
          IconCircle(icon: setting.icon),
          AppSpacing.w16,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: setting.title,
                  color: AppColor.white,
                  fontSize: AppTypography.titleMedium.fontSize,
                  fontWeight: AppTypography.titleMedium.fontWeight,
                ),
                if (setting.subtitle.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: AppSpacing.s4),
                    child: CustomText(
                      text: setting.subtitle,
                    ),
                  ),
              ],
            ),
          ),
          if (setting.badge.isNotEmpty)
            Container(
              decoration: BoxDecoration(
                color: AppColor.orange20,
                borderRadius: AppRadius.br12,
                border: Border.all(
                  color: AppColor.orange,
                  width: 1,
                ),
              ),
              padding: AppSpacing.phv12_6,
              child: Text(
                setting.badge,
                style: AppTypography.badgeOrange,
              ),
            )
          else
            const Icon(
              Icons.arrow_forward_ios,
              color: AppColor.grey600,
              size: 18,
            ),
        ],
      ),
    );
  }
}

class IconCircle extends StatelessWidget {
  final IconData icon;

  const IconCircle({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: AppColor.lightBlack,
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColor.grey20,
        ),
      ),
      child: Icon(
        icon,
        color: AppColor.grey300,
        size: 24,
      ),
    );
  }
}
