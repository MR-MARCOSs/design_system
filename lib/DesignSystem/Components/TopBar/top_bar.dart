import 'package:flutter/material.dart';
import 'top_bar_view_model.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final TopBarViewModel viewModel;

  const TopBar({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define default colors if not provided
    final backgroundColor = viewModel.backgroundColor ??
        (viewModel.style == TopBarStyle.light ? Colors.white : Colors.black);
    final titleColor = viewModel.titleColor ??
        (viewModel.style == TopBarStyle.light ? Colors.black : Colors.white);

    return AppBar(
      title: Text(
        viewModel.title,
        style: TextStyle(
          color: titleColor,
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: viewModel.actions,
      backgroundColor: backgroundColor,
      elevation: 0, // Modern design often has minimal elevation
      iconTheme: IconThemeData(color: titleColor),
      toolbarHeight: 80.0, // Adjust height as needed
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(16.0),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80.0); // Match the toolbar height
}
