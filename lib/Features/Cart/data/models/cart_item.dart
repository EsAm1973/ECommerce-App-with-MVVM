import 'package:ecommerce_app/Core/models/productModel.dart';

class CartItem {
  final Product product;
  final int quantity;

  CartItem({required this.product, required this.quantity});
}
