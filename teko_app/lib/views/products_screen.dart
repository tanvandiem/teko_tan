import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:teko_app/controllers/products_controller.dart';
import 'package:teko_app/views/products_form.dart';
import 'package:teko_app/views/products_gird.dart';


class ProductListView extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              const ProductForm(),
              SizedBox(height: 20.h),
              Obx(() => productController.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : ProductGrid()),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text(
        'Quản lý sản phẩm',
        style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
      ),
    );
  }
}
