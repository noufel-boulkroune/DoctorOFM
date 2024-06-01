import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dr_office_management/data/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ThemeButton extends StatefulWidget {
  final Function onPressed;
  final String label;
  final Color bgColor;
  final Color textColor;
  final double? buttonHeight;
  final Color? borderColor;
  final double? borderWidth;

  const ThemeButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.bgColor = AppColors.themeColor,
    this.textColor = AppColors.tagBGColor,
    this.buttonHeight,
    this.borderColor,
    this.borderWidth,
  }) : super(key: key);

  @override
  _ThemeButtonState createState() => _ThemeButtonState();
}

class _ThemeButtonState extends State<ThemeButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: widget.buttonHeight ?? 40.h,
      child: ElevatedButton(
        onPressed: () {
          widget.onPressed();
        },
        style: ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          backgroundColor: MaterialStateProperty.all(widget.bgColor),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
          elevation: MaterialStateProperty.all(10),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.w),
              side: widget.borderColor != null && widget.borderWidth != null
                  ? BorderSide(
                      color: widget.borderColor!,
                      width: widget.borderWidth!,
                    )
                  : BorderSide.none,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 14, 10, 14),
          child: Text(
            widget.label,
            style: TextStyle(color: widget.textColor, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
