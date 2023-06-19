import 'package:blog/config/custom_color.dart';
import 'package:blog/config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyTextField extends StatefulWidget {
  final double width;
  final double? height;
  final String text;
  final Widget? icon;
  final TextEditingController controller;
  final double radius;
  final bool isPass;
  final bool? isEmpty;
  final int? maxLength;
  final String? initValue;
  final Function(String)? onChanged;
  final TextStyle? hintStyle;
  final TextStyle? lableStyle;
  const MyTextField({
    Key? key,
    required this.width,
    this.height,
    required this.text,
    this.icon,
    this.maxLength,
    this.initValue,
    this.onChanged,
    required this.controller,
    required this.isPass,
    this.isEmpty,
    required this.radius, this.hintStyle, this.lableStyle,
  }) : super(key: key);

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  bool isHide = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: bodyText,
      cursorColor: kPrimaryColor,
      maxLines: 1,
      obscureText: isHide,
      maxLength: widget.maxLength,
      keyboardType: TextInputType.multiline,
      onChanged: (value) {
        if (widget.isEmpty != true &&
            widget.controller.text == '' &&
            widget.initValue != null) {
          setState(() {
            widget.controller.text = widget.initValue!;
          });
          //dismiss keyboard
          FocusScope.of(context).unfocus();
        }
      },
      decoration: InputDecoration(
          prefixIcon: widget.icon,
          // hintText: 'type something',
          filled: true,
          fillColor: inputFieldColor,
          hintStyle: widget.hintStyle,
          labelText: widget.text,
          counterStyle: bodyText,
          labelStyle: widget.lableStyle,
          suffixIcon: widget.isPass
              ? InkWell(
                  onTap: () {
                    setState(() {
                      isHide = !isHide;
                    });
                  },
                  child: isHide
                      ? const Icon(
                          FontAwesomeIcons.eyeSlash,
                          color: unselectedTextColor,
                          size: 16,
                        )
                      : const Icon(
                          FontAwesomeIcons.eye,
                          color: unselectedTextColor,
                          size: 16,
                        ),
                )
              : null,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius),
              borderSide: const BorderSide(color: kPrimaryColor)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius),
              borderSide: const BorderSide(color: inputFieldColor)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius),
              borderSide: const BorderSide(color: unselectedTextColor))),
    );
  }
}