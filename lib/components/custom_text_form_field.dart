import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  String label ;
  TextInputType keyboardType ;
  TextEditingController controller ;
  bool isPassword ;
  String? Function(String?) validator ;
  CustomTextFormField({required this.label,
    this.keyboardType = TextInputType.text,
    required this.controller,
    required this.validator,
    this.isPassword = false ,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        decoration: InputDecoration(
            label: Text(label),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 3,
              color: Theme.of(context).primaryColor
            ),
            borderRadius: BorderRadius.circular(15)
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 3,
                  color: Theme.of(context).primaryColor
              ),
              borderRadius: BorderRadius.circular(15)
          ),
        ),
        keyboardType: keyboardType,
        controller:controller ,
        validator: validator,
        obscureText: isPassword,
      ),
    );
  }
}
