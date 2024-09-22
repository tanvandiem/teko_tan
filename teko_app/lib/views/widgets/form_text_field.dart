import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormTextField extends StatelessWidget {
  final String label;
  final bool isNumber;
  final bool isRequired;
  final TextEditingController controller;

  const FormTextField({
    required this.label,
    this.isNumber = false,
    this.isRequired = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              if (isRequired)
                TextSpan(
                  text: '* ',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                ),
              TextSpan(
                text: label,
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ],
          ),
        ),
        SizedBox(height: 5.h),
        TextFormField(
          controller: controller,
          keyboardType: isNumber ? TextInputType.number : TextInputType.text,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            
          ),
          validator: (value) {
            if (isRequired && (value == null || value.isEmpty)) {
              return '$label không được bỏ trống';
            }
            if (isNumber) {
              final numValue = num.tryParse(value!);
              if (numValue == null) {
                return '$label phải là số';
              }
            }
            return null;
          },
        ),
      ],
    );
  }
}
