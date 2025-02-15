part of 'category_cubit.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {}

final class CategorySuccess extends CategoryState {
  final List<Category> categories;
  const CategorySuccess({required this.categories});
}

final class CategoryFailure extends CategoryState {
  final String errorMessage;
  const CategoryFailure({required this.errorMessage});
}
