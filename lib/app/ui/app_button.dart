import 'package:flutter/material.dart';

import '../constants/app_constant.dart';
import 'app_image_assets.dart';
import 'app_text.dart';

class AppButton extends StatelessWidget {
  final String? text;
  final Color? color;
  final Color? textColor;
  final double? height;
  final double? width;
  final Function()? onTap;
  final TextStyle? textStyle;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final BorderRadius? borderRadius;
  final double? fontSize;
  final String? fontFamily;
  final BoxBorder? border;

  const AppButton(
      {super.key,
      @required this.onTap,
      @required this.text,
      this.color,
      this.textColor,
      this.height,
      this.width,
      this.textStyle,
      this.alignment,
      this.padding,
      this.textAlign,
      this.fontWeight,
      this.fontSize,
      this.border,
      this.borderRadius,
      this.fontFamily});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        height: height ?? 48,
        width: width,
        alignment: alignment ?? Alignment.center,
        decoration: BoxDecoration(
          border: border,
          color: color ?? AppColorConstants.appPrimary,
          borderRadius: borderRadius ?? BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0A000000), // Shadow color and opacity
              offset: Offset(0, 2), // Horizontal and vertical offset
              blurRadius: 5, // Spread radius
              spreadRadius: 0, // How far shadow extends
            ),
          ],
        ),
        child: Text(
          text!,
          style: textStyle ??
              TextStyle(
                  fontSize: fontSize ?? 15,
                  color: textColor ?? Colors.white,
                  fontWeight: fontWeight ?? FontWeight.w500,
                  fontFamily: fontFamily),
        ),
      ),
    );
  }
}

class AppIconTextButton extends StatelessWidget {
  final String? text;
  final Color? color;
  final Color? borderColor;
  final Color? textColor;
  final Color? iconColor;
  final double? iconHeight;
  final double? height;
  final double? width;
  final Function()? onTap;
  final TextStyle? textStyle;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final BorderRadius? borderRadius;
  final double? fontSize;
  final String? fontFamily;
  final String? icon;

  const AppIconTextButton({
    super.key,
    @required this.onTap,
    @required this.text,
    @required this.icon,
    this.color,
    this.borderColor,
    this.textColor,
    this.iconColor,
    this.iconHeight,
    this.height,
    this.width,
    this.textStyle,
    this.alignment,
    this.padding,
    this.margin,
    this.textAlign,
    this.fontWeight,
    this.fontSize,
    this.borderRadius,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: const WidgetStatePropertyAll(AppColorConstants.appTransparent),
      onTap: onTap,
      child: Container(
          padding: padding,
          margin: margin,
          height: height ?? 49,
          width: width,
          alignment: alignment ?? Alignment.center,
          decoration: BoxDecoration(
              color: color ?? AppColorConstants.appPrimary,
              borderRadius: borderRadius ?? BorderRadius.circular(12),
              border: Border.all(color: borderColor ?? AppColorConstants.appPrimary.withOpacity(0.6))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppImageAsset(
                image: icon,
                color: iconColor,
                height: iconHeight ?? 22,
                width: iconHeight ?? 22,
              ),
              const SizedBox(width: 7),
              Flexible(
                child: AppText(
                  text: text,
                  fontSize: fontSize ?? 14,
                  fontFamily: fontFamily,
                  fontWeight: fontWeight ?? FontWeight.w700,
                  fontColor: textColor ?? AppColorConstants.appWhite,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          )),
    );
  }
}
