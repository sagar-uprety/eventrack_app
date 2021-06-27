import 'package:flutter/material.dart';

import 'package:get/get_utils/get_utils.dart';

import '../utilities/colors.dart';

class FormInputField extends StatelessWidget {
  const FormInputField(
      {Key? key,
      this.controller,
      required this.label,
      this.autofocus = false,
      this.initialValue,
      this.obscureText = false,
      this.readOnly = false,
      this.maxLength,
      this.maxLines = 1,
      this.icon,
      this.onClickedSuffix,
      this.width,
      this.helperText,
      this.keyboardType = TextInputType.text,
      this.suffixIcon,
      this.validator})
      : assert(initialValue == null || controller == null),
        assert(maxLines == null || maxLines > 0),
        assert(maxLength == null || maxLength > 0),
        assert(
            validator != null, 'Validator is necessary to ensure proper data.'),
        assert(!obscureText || maxLines == 1,
            'Obscured fields cannot be multiline.'),
        super(key: key);

  final TextEditingController? controller;
  final IconData? icon, suffixIcon;
  final String label;
  final String? initialValue;
  final bool autofocus, obscureText, readOnly;
  final String? helperText;
  final TextInputType keyboardType;
  final int? maxLines;
  final TextAlign textAlign;
  final int? maxLength;
  final double? width;
  final String? Function(String?)? validator;
  final void Function()? onClickedSuffix;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: TextFormField(
        key: key,
        controller: controller,
        initialValue: initialValue,
        keyboardType: keyboardType,
        textAlign: textAlign,
        decoration: InputDecoration(
          counterText: '',
          labelText: label,
          helperText: helperText != null ? "**$helperText" : null,
          helperStyle: Theme.of(context)
              .textTheme
              .overline!
              .copyWith(fontSize: 14, color: AppColors.dark50),
          alignLabelWithHint: true,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          icon: icon != null ? Icon(icon) : null,
          suffixIcon: suffixIcon != null
              ? IconButton(
                  icon: Icon(suffixIcon),
                  onPressed: onClickedSuffix,
                )
              : null,
          labelStyle: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: AppColors.dark50),
          filled: true,
          fillColor: AppColors.dark25,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.dark50, width: 2),
          ),
          errorBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.red, width: 4),
          ),
          errorStyle: Theme.of(context)
              .textTheme
              .overline!
              .copyWith(fontSize: 14, color: AppColors.red),
          errorMaxLines: 2,
        ),
        autofocus: autofocus,
        obscureText: obscureText,
        readOnly: readOnly,
        maxLines: maxLines,
        maxLength: maxLength,
        validator: validator,
      ),
    ).paddingSymmetric(horizontal: 24, vertical: 8);
  }
}
