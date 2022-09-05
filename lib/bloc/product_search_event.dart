part of 'product_search_bloc.dart';

class ProductSearchEvent extends Equatable {
  final String query;

  const ProductSearchEvent(this.query);

  @override
  String toString() {
    return '''ProductSearchEvent { query: $query }''';
  }

  @override
  List<Object> get props => [query];
}
