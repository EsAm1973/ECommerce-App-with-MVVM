class DuplicateProductException implements Exception {
  final String message;
  DuplicateProductException([this.message = 'المنتج موجود بالفعل في السلة']);
  @override
  String toString() => message;
}