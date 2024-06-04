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
  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: widget.inputController,
          textAlignVertical: TextAlignVertical.center,
          readOnly: (widget.isButton ?? false) || !(widget.enable ?? true),
          onTap: () {
            if (widget.onTap != null) {
              widget.onTap!();
            }
          },
          maxLines: widget.maxLine ?? 1,
          minLines: widget.minLine ?? 1,
          autocorrect: false,
          obscureText: widget.isObscure ?? false,
          textInputAction: widget.inputAction ?? TextInputAction.done,
          keyboardType: widget.keyboardType ?? TextInputType.text,
          cursorColor: Colors.black,
          style: TextStyle(
              color: widget.textColor ?? AppColors.textFieldTextColor,
              fontSize: 16.sp),
          inputFormatters: [
            if (widget.keyboardType == TextInputType.emailAddress)
              FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s"))
          ],
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.themeWhiteColor,
            contentPadding: EdgeInsets.all(10.w),
            errorMaxLines: 1,
            hintText: widget.hintText,
            labelText: widget.labelText,
            labelStyle: TextStyle(
                color: widget.textColor ?? AppColors.themeLightGrey,
                fontSize: 14.sp),
            hintStyle: TextStyle(fontSize: 14.sp),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(
                color: AppColors.errorColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(
                color: AppColors.themeColor,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(
                color: AppColors.errorColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(
                color: AppColors.themeLightGrey,
              ),
            ),
            errorText: _errorText,
          ),
          validator: (value) {
            setState(() {
              _errorText =
                  widget.validation != null ? widget.validation!(value) : null;
            });
            return _errorText;
          },
          onSaved: widget.onSaved,
        ),
      ],
    );
  }
}
