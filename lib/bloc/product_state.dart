part of 'product_bloc.dart';

enum ProductStatus { initial, success }

class ProductState extends Equatable {
  const ProductState(
      {this.status = ProductStatus.initial, this.products = const <Product>[]});

  final ProductStatus status;
  final List<Product> products;

  ProductState copyWith({ProductStatus? status, List<Product>? products}) {
    return ProductState(
        status: status ?? this.status, products: products ?? this.products);
  }

  @override
  String toString() {
    return '''ProductState { status: $status, products:${products.length} }''';
  }

  @override
  List<Object> get props => [status, products];
}
