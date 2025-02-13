import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/Core/models/productModel.dart';
import 'package:ecommerce_app/Features/FavoriteProducts/data/repos/favorite_repo.dart';
import 'package:equatable/equatable.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final IFavoriteRepository favoriteRepository;

  FavoriteCubit({required this.favoriteRepository}) : super(FavoriteInitial());

  Future<void> fetchFavorites(int userId) async {
    try {
      emit(FavoriteLoading());
      final favorites = await favoriteRepository.getFavorites(userId);
      emit(FavoriteLoaded(favorites));
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }

  /// Toggles the favorite status for a product:
  /// - If the product is already a favorite, it removes it.
  /// - Otherwise, it adds the product as a favorite.
  Future<void> toggleFavorite(Product product, int userId) async {
    try {
      final isFav = await favoriteRepository.isFavorite(product.id, userId);
      if (isFav) {
        await favoriteRepository.removeFavorite(product.id, userId);
      } else {
        await favoriteRepository.addFavorite(product, userId);
      }
      // Refresh favorites after toggling.
      fetchFavorites(userId);
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }

  Future<void> addFavorite(Product product, int userId) async {
    try {
      await favoriteRepository.addFavorite(product, userId);
      // Refresh favorites after addition.
      fetchFavorites(userId);
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }

  Future<void> removeFavorite(int productId, int userId) async {
    try {
      await favoriteRepository.removeFavorite(productId, userId);
      // Refresh favorites after removal.
      fetchFavorites(userId);
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }
}
