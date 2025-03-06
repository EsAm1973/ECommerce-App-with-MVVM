import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/Core/errors/database_failure.dart';
import 'package:ecommerce_app/Core/models/productModel.dart';
import 'package:ecommerce_app/Features/Cart/data/models/cart_item.dart';
import 'package:ecommerce_app/Features/Cart/data/repos/cart_repo.dart';
import 'package:equatable/equatable.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo) : super(CartInitial());
  final CartRepo cartRepo;

  Future<void> loadCart(int userId) async {
    emit(CartLoading());
    try {
      final cartItems = await cartRepo.getCartItems(userId);
      // الحفاظ على حالة الاختيارات السابقة إذا كانت موجودة
      Map<int, bool> selected = {};
      if (state is CartSuccess) {
        final current = state as CartSuccess;
        for (var item in cartItems) {
          selected[item.product.id] =
              current.selectedItems[item.product.id] ?? false;
        }
      } else {
        for (var item in cartItems) {
          selected[item.product.id] = false;
        }
      }
      emit(CartSuccess(cartItems: cartItems, selectedItems: selected));
    } catch (e) {
      emit(CartFailure(errorMessage: e.toString()));
    }
  }

  Future<bool> addProduct(int userId, Product product) async {
    try {
      await cartRepo.addToCart(userId, product);
      await loadCart(userId);
      return true;
    } on DuplicateProductException {
      // حالة متوقعة: المنتج موجود بالفعل
      await loadCart(userId);
      return false;
    } catch (e) {
      emit(CartFailure(errorMessage: e.toString()));
      return false;
    }
  }

  Future<void> removeFromCart(int userId, int productId) async {
    if (state is CartSuccess) {
      final currentState = state as CartSuccess;
      final updatedCartItems = currentState.cartItems
          .where((item) => item.product.id != productId)
          .toList();
      final updatedSelectedItems =
          Map<int, bool>.from(currentState.selectedItems);
      updatedSelectedItems.remove(productId);
      // إصدار حالة جديدة مع القائمة المحدثة دون حذف كامل البيانات
      emit(CartSuccess(
          cartItems: updatedCartItems, selectedItems: updatedSelectedItems));
      try {
        await cartRepo.removeFromCart(userId, productId);
      } catch (e) {
        // في حالة فشل عملية الحذف يمكنك التعامل مع الخطأ دون إعادة تحميل الشاشة بالكامل
      }
    }
  }

  Future<void> updateCartItemQuantity(
      int userId, int productId, int quantity) async {
    if (state is CartSuccess) {
      final currentState = state as CartSuccess;
      // تحديث القائمة محليًا
      final updatedCartItems = currentState.cartItems.map((item) {
        if (item.product.id == productId) {
          return CartItem(product: item.product, quantity: quantity);
        }
        return item;
      }).toList();
      // إصدار حالة جديدة مع القائمة المحدثة
      emit(CartSuccess(
          cartItems: updatedCartItems,
          selectedItems: currentState.selectedItems));
      // تحديث قاعدة البيانات في الخلفية
      try {
        await cartRepo.updateCartItemQuantity(userId, productId, quantity);
      } catch (e) {
        // هنا يمكن إعادة التراجع عن التحديث أو عرض رسالة خطأ دون إعادة تحميل الشاشة بالكامل
      }
    }
  }

  // دوال لإدارة حالة الاختيارات:
  void toggleItemSelection(int productId) {
    if (state is CartSuccess) {
      final current = state as CartSuccess;
      final updated = Map<int, bool>.from(current.selectedItems);
      updated[productId] = !(updated[productId] ?? false);
      emit(CartSuccess(cartItems: current.cartItems, selectedItems: updated));
    }
  }

  void toggleSelectAll(bool value) {
    if (state is CartSuccess) {
      final current = state as CartSuccess;
      final updated = <int, bool>{};
      for (var item in current.cartItems) {
        updated[item.product.id] = value;
      }
      emit(CartSuccess(cartItems: current.cartItems, selectedItems: updated));
    }
  }

  Future<void> removeSelectedItems(int userId) async {
    if (state is CartSuccess) {
      final current = state as CartSuccess;
      for (var item in current.cartItems) {
        if (current.selectedItems[item.product.id] == true) {
          await cartRepo.removeFromCart(userId, item.product.id);
        }
      }
      await loadCart(userId);
    }
  }
}
