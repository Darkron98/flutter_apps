import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? suffixIcon;
  final TextInputType? textInputType;
  final bool obscureText;

  final String formProperty;
  final Map<String, String> formValues;

  static IconData customIcon = Icons.visibility;

  const CustomInputField({
    Key? key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.icon,
    this.suffixIcon,
    this.textInputType,
    this.obscureText = false,
    required this.formProperty,
    required this.formValues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      obscureText: obscureText,
      autofocus: false,
      initialValue: '',
      textCapitalization: TextCapitalization.words,
      onChanged: (value) => formValues[formProperty] = value,
      validator: (value) {
        if (value == null) return 'Este campo es obligatorio';
        return value.length < 3 ? 'minimo de 3 caracteres' : null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        counterText: '3 caracteres',
        //prefixIcon: Icon(Icons.verified_user_outlined),
        border: OutlineInputBorder(),
        suffixIcon: labelText == 'pass'
            ? FloatingActionButton(
                backgroundColor: Color.fromARGB(0, 0, 0, 0),
                splashColor: Color.fromARGB(0, 0, 0, 0),
                elevation: 0,
                child: Icon(
                  customIcon,
                  color: Colors.grey,
                ),
                onPressed: () {},
              )
            : null,
        icon: icon == null ? null : Icon(icon),
      ),
    );
  }
}
