import 'package:assignment/core/constant/app_strings.dart';
import 'package:assignment/core/theme/app_color.dart';
import 'package:assignment/core/theme/app_radius.dart';
import 'package:assignment/core/theme/app_spacing.dart';
import 'package:assignment/core/theme/app_typography.dart';
import 'package:flutter/material.dart';

import 'package:assignment/features/home/controllers/dashboard_controller.dart';
import 'package:get/get.dart';

class SearchBox extends StatefulWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onMicTap;
  final String hintText;

  const SearchBox({
    Key? key,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.onMicTap,
    this.hintText = AppStrings.searchLocationHint,
  }) : super(key: key);

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  late TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();
  final controller = Get.put(DashboardController());

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _focusNode.addListener(() {
      controller.updateSearchFocus(_focusNode.hasFocus);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        // Transparent dark grey — ambient glass effect
        color: AppColor.grey08,
        borderRadius: AppRadius.br50,
        border: Border.all(
          color: controller.isSearchFocused.value
              ? AppColor.grey50
              : AppColor.grey20,
          width: 1,
        ),
      ),
      padding: AppSpacing.phv20_4,
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: AppColor.grey500,
            size: 20,
          ),
          AppSpacing.w12,
          Expanded(
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              onChanged: widget.onChanged,
              onSubmitted: widget.onSubmitted,
              style: AppTypography.bodyLarge,
              cursorColor: AppColor.white70,
              cursorWidth: 1.5,
              cursorRadius: const Radius.circular(2),
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: AppTypography.bodyLarge.copyWith(color: AppColor.grey600),
                contentPadding: AppSpacing.py12,
              ),
            ),
          ),
          AppSpacing.w8,
          GestureDetector(
            onTap: widget.onMicTap,
            child: Icon(
              Icons.mic,
              color: AppColor.grey500,
              size: 20,
            ),
          ),
        ],
      ),
    ));
  }
}
