import 'package:assignment/core/constant/asset_constant.dart';
import 'package:assignment/core/base/base_view_controller.dart';
import 'package:assignment/core/constant/app_strings.dart';
import 'package:assignment/core/theme/app_color.dart';
import 'package:assignment/core/theme/app_radius.dart';
import 'package:assignment/core/theme/app_spacing.dart';
import 'package:assignment/core/theme/app_typography.dart';
import 'package:assignment/core/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});

  final controller = Get.find<BaseViewController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         userProfile(),
          AppSpacing.h20,
          accountSettingHeading(),
          drawerTile(title: AppStrings.notification,activeKey: controller.activeScreen.value,onTap: () {
            controller.activeScreen.value = AppStrings.notification;
            controller.update();
          },trailing: notificationBadge("12")),
          drawerTile(title: AppStrings.payment,activeKey: controller.activeScreen.value,onTap: () {
            controller.activeScreen.value = AppStrings.payment;
            controller.update();
          }),
          drawerTile(title: AppStrings.transaction,activeKey: controller.activeScreen.value,onTap: () {
            controller.activeScreen.value = AppStrings.transaction;
            controller.update();
          }),
          drawerTile(title: AppStrings.privacy,activeKey:controller.activeScreen.value,onTap: () {
            controller.activeScreen.value = AppStrings.privacy;
            controller.update();
          }),
      
          accountSettingHeading(),
      
          drawerTile(title: AppStrings.listing,activeKey: controller.activeScreen.value,onTap: () {
            controller.activeScreen.value = AppStrings.listing;
            controller.update();
          },),
          drawerTile(title: AppStrings.host,activeKey: controller.activeScreen.value,onTap: () {
            controller.activeScreen.value = AppStrings.host;
            controller.update();
          }),
          accountSettingHeading(),
          drawerTile(title: AppStrings.darkMode,activeKey: controller.activeScreen.value,onTap: () {
            controller.activeScreen.value = AppStrings.darkMode;
            controller.update();
          }),
          drawerTile(title: AppStrings.update,activeKey:controller.activeScreen.value,onTap: () {
            controller.activeScreen.value = AppStrings.update;
            controller.update();
          }),
        ],
      )),
    );


  }

  Widget userProfile() => Padding(
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
          ), child: Image.asset(AppAssets.icGirl),
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
            controller.animationController.reverse();
          },child: Icon(CupertinoIcons.xmark,color: AppColor.white,size: 18,)),
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
                trailing ?? Icon(CupertinoIcons.right_chevron,color: AppColor.grey,size: 16,),
              ],
            ),
          ),
        ),
      );

  Widget accountSettingHeading()=> Padding(
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
