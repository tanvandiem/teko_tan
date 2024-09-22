import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teko_app/models/products_models.dart';


class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(product.imageSrc, fit: BoxFit.cover),
            ),
            Text(
              product.name,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            Text(
              '${product.price} ₫',
              style: TextStyle(fontSize: 14.sp),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
