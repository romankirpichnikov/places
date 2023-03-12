import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Color backgroundColor;
  final Widget? leading;
  final bool centerTitle;
  final PreferredSizeWidget? bottom;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 24);

  const CustomAppBar({
    super.key,
    this.title,
    this.backgroundColor = Colors.white,
    this.leading,
    this.centerTitle = true,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      elevation: 0,
      toolbarHeight: 64,
      titleSpacing: 16,
      leading: leading,
      bottom: bottom,
    );
  }
}
