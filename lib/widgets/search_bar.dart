import 'package:assignment/core/constant/app_strings.dart';
import 'package:assignment/core/theme/app_color.dart';
import 'package:assignment/core/theme/app_radius.dart';
import 'package:assignment/core/theme/app_spacing.dart';
import 'package:assignment/core/theme/app_typography.dart';
import 'package:assignment/providers/dashboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _focusNode.addListener(() {
      context.read<DashboardProvider>().updateSearchFocus(_focusNode.hasFocus);
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
    return Consumer<DashboardProvider>(
      builder: (context, controller, child) => AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: AppColor.grey08,
          borderRadius: AppRadius.br50,
          border: Border.all(
            color: controller.isSearchFocused
                ? AppColor.grey50
                : AppColor.grey20,
            width: 1,
          ),
        ),
        padding: AppSpacing.phv20_4,
        child: Row(
          children: [
            const Icon(
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
              child: const Icon(
                Icons.mic,
                color: AppColor.grey500,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
