part of 'product_search_bloc.dart';

class ProductSearchState extends Equatable {
  const ProductSearchState._(
      {required this.products,
      required this.isLoading,
      required this.hasError});

  factory ProductSearchState.initial() {
    return const ProductSearchState._(
        products: [], isLoading: false, hasError: false);
  }

  factory ProductSearchState.loading() {
    return const ProductSearchState._(
        products: [], isLoading: true, hasError: false);
  }

  factory ProductSearchState.success(List<Product> products) {
    return ProductSearchState._(
        products: products, isLoading: false, hasError: false);
  }

  factory ProductSearchState.failure() {
    return const ProductSearchState._(
        products: [], isLoading: false, hasError: false);
  }

  final bool isLoading;
  final List<Product> products;
  final bool hasError;

  @override
  String toString() {
    return '''ProductSearchState { products: ${products.toString()}, isLoading: $isLoading, hasError: $hasError }''';
  }

  @override
  List<Object> get props => [isLoading, products, hasError];
}
