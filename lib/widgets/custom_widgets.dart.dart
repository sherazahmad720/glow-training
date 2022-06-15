import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:training/constants.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField(
      {this.controller,
      this.onSave,
      this.validator,
      this.label = '',
      this.isPassword = false});
  TextEditingController? controller;
  var onSave;
  var validator;
  String label;

  bool isPassword;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword ? hidePassword : false,
      onSaved: widget.onSave,
      validator: widget.validator,
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                    !hidePassword ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
              )
            : null,
        label: Text(widget.label),
      ),
    );
  }
}

// Widget customTextField(
//     {TextEditingController? controller,
//     onSave,
//     validator,
//     String label = '',
//     bool isPassword = false}) {
//   return TextFormField(
//     obscureText: isPassword,
//     onSaved: onSave,
//     validator: validator,
//     decoration: InputDecoration(
//       label: Text(label),
//     ),
//   );
// }

Widget customButton(String buttonText,
    {Color? backgroundColor, Color? textColor, onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: backgroundColor ?? iceBlue),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            buttonText,
            style: TextStyle(color: textColor ?? Colors.white),
          ),
        ],
      ),
    ),
  );
}
