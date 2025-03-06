import 'package:ecommerce_app/Core/models/productModel.dart';
import 'package:ecommerce_app/Features/Cart/data/models/cart_item.dart';

abstract class CartRepo {
  Future<List<CartItem>> getCartItems(int userId);
  Future<void> addToCart(int userId, Product product);
  Future<void> removeFromCart(int userId, int productId);
  Future<void> updateCartItemQuantity(int userId, int productId, int quantity);
}
