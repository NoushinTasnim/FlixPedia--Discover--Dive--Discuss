import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final IconData iconData;
  final String text;
  final bool obscureText;
  final TextEditingController textInputController;
  final String errorText;

  const TextFieldWidget({super.key,
    required this.text,
    required this.iconData,
    this.obscureText = false,
    required this.textInputController,
    this.errorText = '',
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool _isPasswordVisible = false; // Track whether there is an error

  @override
  Widget build(BuildContext context) {
    bool hasError = widget.errorText.isNotEmpty;
    return TextField(
      style: Theme.of(context).textTheme.bodySmall,
      cursorColor: Theme.of(context).cardColor,
      controller: widget.textInputController,
      obscureText: widget.obscureText ? !_isPasswordVisible : false,
      decoration: InputDecoration(
        labelText: widget.text,
        labelStyle: Theme.of(context).textTheme.bodySmall,
        filled: true,
        fillColor: Theme.of(context).canvasColor.withOpacity(0.45),
        prefixIcon: Icon(
          widget.iconData,
          color: Theme.of(context).cardColor,
          size: 20,
        ),
        suffixIcon: widget.obscureText
            ? IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
            size: 20,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        )
            : null,
        hintText: widget.text,
        hintStyle: Theme.of(context).textTheme.titleSmall,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red), // Set the error border color to red
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onChanged: (val) {
        setState(() {
          hasError = widget.errorText.isNotEmpty; // Set hasError based on errorText
        });
      },
    );
  }
}
