import 'package:flutter/material.dart';
import 'package:code_charm/constants/colors.dart';

AppBar customAppBar({
  required String title,
  Color? backgroundColor,
  double? elevation = 0,
  bool? centerTitle = false,
}) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(fontFamily: "ProductSans"),
    ),
    backgroundColor: backgroundColor ?? navColor,
    elevation: elevation,
    centerTitle: centerTitle,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    // toolbarHeight: 1250,
  );
}
