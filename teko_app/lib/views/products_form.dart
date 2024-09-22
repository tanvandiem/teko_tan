import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teko_app/views/widgets/form_text_field.dart';
import 'package:teko_app/views/widgets/image_uploader.dart';
import 'package:teko_app/views/widgets/submit_button.dart';

class ProductForm extends StatefulWidget {
  const ProductForm({super.key});

  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  bool _isImageSelected = false;

  void _onImageSelected(bool isSelected) {
    setState(() {
      _isImageSelected = isSelected;
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate() && _isImageSelected) {
      _showSuccessDialog();
    } else if (!_isImageSelected) {
      _showErrorDialog('Vui lòng chọn một ảnh!');
    } else {
      _showErrorDialog('Vui lòng kiểm tra các trường thông tin!');
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Thành công'),
          content: const Text('Sản phẩm đã được tạo thành công!'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); 
              },
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Lỗi'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); 
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormTextField(
            label: 'Tên sản phẩm',
            isRequired: true,
            controller: _nameController,
          ),
          SizedBox(height: 15.h),
          FormTextField(
            label: 'Giá sản phẩm',
            isNumber: true, 
            isRequired: true,
            controller: _priceController,
          ),
          SizedBox(height: 15.h),
          ImageUploader(onImageSelected: _onImageSelected),
          SizedBox(height: 15.h),
          Center(child: SubmitButton(onPressed: _submitForm)),
        ],
      ),
    );
  }
}
