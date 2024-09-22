import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploader extends StatefulWidget {
  final Function(bool) onImageSelected; 

  const ImageUploader({super.key, required this.onImageSelected});

  @override
  _ImageUploaderState createState() => _ImageUploaderState();
}

class _ImageUploaderState extends State<ImageUploader> {
  File? _image;
  bool _isImageError = false;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery,); 

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
        _isImageError = false;
      });
      widget.onImageSelected(true); 
    } else {
      widget.onImageSelected(false); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Ảnh sản phẩm', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500)),
        SizedBox(height: 5.h),
        if (_image != null)
          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: Image.file(_image!, height: 150.h, width: 150.w, fit: BoxFit.cover),
          ),
        if (_isImageError)
          Text('Vui lòng chọn một ảnh!', style: TextStyle(color: Colors.red, fontSize: 14.sp)),
        ElevatedButton.icon(
          onPressed: _pickImage,
          icon: const Icon(Icons.cloud_upload_outlined, color: Colors.black),
          label: const Text(
            'Chọn tệp tin (tối đa 5MB)',
            style: TextStyle(color: Colors.black),
          ),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(190.w, 30.h),
            backgroundColor: const Color.fromARGB(239, 239, 239, 239),
            padding: EdgeInsets.symmetric(vertical: 10.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ],
    );
  }

  bool validate() {
    if (_image == null) {
      setState(() {
        _isImageError = true; 
      });
      return false;
    }
    return true;
  }
}
