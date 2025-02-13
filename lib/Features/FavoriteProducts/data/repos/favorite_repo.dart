
import 'package:ecommerce_app/Features/home/data/models/productModel.dart';

abstract class IFavoriteRepository {
  Future<void> addFavorite(Product product, int userId);
  Future<void> removeFavorite(int productId, int userId);
  Future<List<Product>> getFavorites(int userId);
}
