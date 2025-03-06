class DuplicateProductException implements Exception {
  final String message;
  DuplicateProductException([this.message = 'Product is already in cart']);
  @override
  String toString() => message;
}