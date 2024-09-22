import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teko_app/models/products_models.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(0),
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(product.imageSrc, fit: BoxFit.cover),
            ),
            SizedBox(height: 4.h),
            Text(
              product.name,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            Text(
              '${product.price} đ',
              style: TextStyle(fontSize: 14.sp),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
