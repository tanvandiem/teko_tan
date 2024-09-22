import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:teko_app/models/products_models.dart';


class ProductController extends GetxController {
  var isLoading = false.obs;
  var productList = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    isLoading(true);
    try {
      var response = await http.get(Uri.parse(
          'https://hiring-test.stag.tekoapis.net/api/products/management'));

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(utf8.decode(response.bodyBytes));

        var productsData = jsonResponse['data'].firstWhere(
                (item) => item['type'] == 'ProductList')['customAttributes']
            ['productlist']['items'];

        var products = List<Product>.from(
            productsData.map((item) => Product.fromJson(item)));

        productList.assignAll(products);
      } else {
        print("Failed to load products: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching products: $e");
    } finally {
      isLoading(false);
    }
  }
}
