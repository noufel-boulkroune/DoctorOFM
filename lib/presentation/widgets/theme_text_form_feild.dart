import 'package:dr_office_management/data/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeTextField extends StatefulWidget {
  final TextInputAction? inputAction;
  final double? height;
  final bool? enable;
  final String? hintText;
  final String? labelText;
  final Function(String?)? validation;
  final IconData? icon;
  bool? isObscure;
  TextInputType? keyboardType;
  TextEditingController? inputController;
  final bool? isSearchField;
  Function? onTap;
  bool? isButton;
  Color? textColor;
  int? maxLine;
  int? minLine;
  final void Function(String?)? onSaved;

  ThemeTextField(
      {Key? key,
      this.inputAction,
      this.height,
      this.enable = true,
      this.isObscure = false,
      this.validation,
      this.hintText = "",
      this.labelText,
      this.icon,
      this.inputController,
      this.keyboardType,
      this.isSearchField = false,
      this.isButton,
      this.onTap,
      this.textColor,
      this.maxLine,
      this.minLine,
      this.onSaved})
      : super(key: key);

  @override
  _ThemeTextFieldState createState() => _ThemeTextFieldState();
}

class _ThemeTextFieldState extends State<ThemeTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 35.h,
          child: TextFormField(
            controller: widget.inputController,
            textAlignVertical: TextAlignVertical.center,
            readOnly: (widget.isButton ?? false) || !widget.enable!,
            onTap: () {
              if (widget.onTap != null) {
                widget.onTap!();
              }
            },
            maxLines: widget.maxLine ?? 1,
            minLines: widget.minLine ?? 1,
            autocorrect: false,
            obscureText: widget.isObscure!,
            textInputAction: widget.inputAction ?? TextInputAction.done,
            keyboardType: widget.keyboardType ?? TextInputType.text,
            cursorColor: Colors.black,
            style: TextStyle(
              color: widget.textColor ?? AppColors.textFieldTextColor,
            ),
            inputFormatters: [
              widget.keyboardType == TextInputType.emailAddress
                  ? FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s"))
                  : FilteringTextInputFormatter.deny(RegExp(''))
            ],
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.themeWhiteColor,
              contentPadding: EdgeInsets.all(19.w),
              errorMaxLines: 1,
              hintText: widget.hintText,
              labelText: widget.labelText,
              labelStyle: TextStyle(
                color: widget.textColor ?? AppColors.themeLightGrey,
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(
                  color: AppColors.errorColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(
                  color: AppColors.themeColor,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(
                  color: AppColors.errorColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(
                  color: AppColors.themeLightGrey,
                ),
              ),
            ),
            validator: widget.validation as String? Function(String?)?,
            onSaved: widget.onSaved,
          ),
        ),
      ],
    );
  }
}
