import 'package:assignment/core/theme/app_shadows.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/home/widgets/custom_drawer.dart';
import 'base_view_controller.dart';

abstract class BaseView extends StatelessWidget {
  final controller = Get.find<BaseViewController>();
  BaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppShadows.dashboardGradient,
        ),
        height: double.infinity,
        width: double.infinity,
        child: AnimatedBuilder(
          animation: controller.animationController,
          builder:  (context, child) => Stack(children: [
              FadeTransition(opacity: controller.fadeAnimation,
              child: CustomDrawer()),
              Padding(
                padding: EdgeInsets.symmetric(vertical: controller.slideAnimation.value.dx / 10),
                child: Transform.translate(offset: controller.slideAnimation.value,
                  child: body(context)),
              ),
            ],),
        ),
      ),
    );
  }
  Widget body(BuildContext context);
}


