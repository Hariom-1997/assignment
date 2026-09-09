import 'package:assignment/core/constant/asset_constant.dart';
import 'package:assignment/providers/base_provider.dart';
import 'package:assignment/core/constant/app_strings.dart';
import 'package:assignment/core/theme/app_color.dart';
import 'package:assignment/core/theme/app_radius.dart';
import 'package:assignment/core/theme/app_spacing.dart';
import 'package:assignment/core/theme/app_typography.dart';
import 'package:assignment/core/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<BaseProvider>();

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            userProfile(context, controller),
            AppSpacing.h20,
            accountSettingHeading(),
            drawerTile(
              title: AppStrings.notification,
              activeKey: controller.activeScreen,
              onTap: () {
                controller.activeScreen = AppStrings.notification;
              },
              trailing: notificationBadge("12"),
            ),
            drawerTile(
              title: AppStrings.payment,
              activeKey: controller.activeScreen,
              onTap: () {
                controller.activeScreen = AppStrings.payment;
              },
            ),
            drawerTile(
              title: AppStrings.transaction,
              activeKey: controller.activeScreen,
              onTap: () {
                controller.activeScreen = AppStrings.transaction;
              },
            ),
            drawerTile(
              title: AppStrings.privacy,
              activeKey: controller.activeScreen,
              onTap: () {
                controller.activeScreen = AppStrings.privacy;
              },
            ),
            accountSettingHeading(),
            drawerTile(
              title: AppStrings.listing,
              activeKey: controller.activeScreen,
              onTap: () {
                controller.activeScreen = AppStrings.listing;
              },
            ),
            drawerTile(
              title: AppStrings.host,
              activeKey: controller.activeScreen,
              onTap: () {
                controller.activeScreen = AppStrings.host;
              },
            ),
            accountSettingHeading(),
            drawerTile(
              title: AppStrings.darkMode,
              activeKey: controller.activeScreen,
              onTap: () {
                controller.activeScreen = AppStrings.darkMode;
              },
            ),
            drawerTile(
              title: AppStrings.update,
              activeKey: controller.activeScreen,
              onTap: () {
                controller.activeScreen = AppStrings.update;
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget userProfile(BuildContext context, BaseProvider controller) => Padding(
    padding: AppSpacing.px16,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: AppSpacing.p2,
          height: 45, width: 45,
          decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: AppRadius.br25
          ), child: Image.asset(AppAssets.icImage),
        ),
        AppSpacing.w15,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(text: AppStrings.userName,fontSize: AppTypography.h2.fontSize,fontWeight: AppTypography.h2.fontWeight,color: AppColor.white,),
            CustomText(text: AppStrings.userLocation,fontSize: AppTypography.bodyMedium.fontSize,fontWeight: FontWeight.w400,),
          ],
        ),
        AppSpacing.w40,
        Padding(
          padding: const EdgeInsets.only(top: AppSpacing.s4),
          child: InkWell(onTap: () {
            controller.animationController?.reverse();
          },child: const Icon(CupertinoIcons.xmark,color: AppColor.white,size: 18,)),
        ),
      ],
    ),
  );

  Widget drawerTile({required String title,required String activeKey,required VoidCallback onTap, Widget? trailing,}) =>
      InkWell(
        onTap: onTap,
        child: Container(
          width: 270,
          height: 60,
          decoration: BoxDecoration(
              color: title == activeKey?AppColor.primaryBlue:AppColor.transparent, borderRadius: BorderRadius.only(
              topRight: Radius.circular(AppRadius.r30), bottomRight: Radius.circular(AppRadius.r30))),
          child: Padding(
            padding: AppSpacing.px16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: title == activeKey?  AppColor.white:AppColor.black38,
                      borderRadius: AppRadius.br25
                  ),
                  child: Icon(
                    Icons.notification_important_outlined, color:title == activeKey?AppColor.primaryBlue: AppColor.grey,),
                ),
                AppSpacing.w15,
                Expanded(child: CustomText(text: title, fontSize: AppTypography.titleLarge.fontSize,)),
                trailing ?? const Icon(CupertinoIcons.right_chevron,color: AppColor.grey,size: 16,),
              ],
            ),
          ),
        ),
      );

  Widget accountSettingHeading()=> const Padding(
    padding: AppSpacing.phv15_20,
    child: CustomText(text: AppStrings.accountSetting,color: AppColor.white,),
  );

  Widget notificationBadge(String count)=>Container(
    height: 22,
    width: 30,
    decoration: BoxDecoration(
        color: AppColor.amber,
      borderRadius: AppRadius.br25
    ),
    child: Center(child: Text(count,style: AppTypography.badge)),
  );
}
