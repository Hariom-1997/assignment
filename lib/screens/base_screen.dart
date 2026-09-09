import 'package:assignment/core/theme/app_shadows.dart';
import 'package:assignment/providers/base_provider.dart';
import 'package:assignment/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  BaseScreenState createState();
}

abstract class BaseScreenState<T extends BaseScreen> extends State<T> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BaseProvider>().init(this);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BaseProvider>(
      builder: (context, controller, child) {
        final animationController = controller.animationController;

        if (animationController == null) {
          return const Scaffold(
            body: SizedBox.shrink(),
          );
        }

        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: AppShadows.dashboardGradient,
            ),
            height: double.infinity,
            width: double.infinity,
            child: AnimatedBuilder(
              animation: animationController,
              builder: (context, child) {
                return Stack(
                  children: [
                    FadeTransition(
                      opacity: controller.fadeAnimation,
                      child: const CustomDrawer(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: controller.slideAnimation.value.dx / 10,
                      ),
                      child: Transform.translate(
                        offset: controller.slideAnimation.value,
                        child: body(context, controller),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget body(BuildContext context, BaseProvider controller);
}
