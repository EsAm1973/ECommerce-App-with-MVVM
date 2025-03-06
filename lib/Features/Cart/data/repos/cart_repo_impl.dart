import 'dart:convert';
import 'package:ecommerce_app/Core/data/database/cart_database.dart';
import 'package:ecommerce_app/Core/errors/database_failure.dart';
import 'package:ecommerce_app/Core/models/productModel.dart';
import 'package:ecommerce_app/Features/Cart/data/models/cart_item.dart';
import 'package:ecommerce_app/Features/Cart/data/repos/cart_repo.dart';

class CartRepositoryImpl implements CartRepo {
  final CartDatabase dbHelper;

  CartRepositoryImpl({required this.dbHelper});

  @override
  Future<List<CartItem>> getCartItems(int userId) async {
    final cartData = await dbHelper.getCartItems(userId);
    return cartData.map((item) {
      List<String> images = [];
      if (item['images'] != null) {
        images = List<String>.from(json.decode(item['images']));
      }
      final product = Product(
        id: item['product_id'],
        price: item['price'],
        oldPrice: item['old_price'],
        discount: item['discount'],
        image: item['image'],
        name: item['name'],
        description: item['description'],
        images: images,
        inFavorites: item['in_favorites'] == 1,
        inCart: item['in_cart'] == 1,
      );
      return CartItem(product: product, quantity: item['quantity']);
    }).toList();
  }

  @override
  Future<void> addToCart(int userId, Product product) async {
    try {
      // عند الإضافة يتم تعيين الكمية الافتراضية 1
      await dbHelper.insertCartItem(userId, product, 1);
    } catch (e) {
      // إذا كان المنتج موجوداً بالفعل سيتم رمي Exception لتبليغ المستخدم
      throw DuplicateProductException();
    }
  }

  @override
  Future<void> removeFromCart(int userId, int productId) async {
    await dbHelper.deleteCartItem(userId, productId);
  }

  @override
  Future<void> updateCartItemQuantity(
      int userId, int productId, int quantity) async {
    await dbHelper.updateCartItemQuantity(userId, productId, quantity);
  }
}
