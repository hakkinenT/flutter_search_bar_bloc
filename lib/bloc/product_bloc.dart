import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:search_app_bar_project/api/product_api.dart';

import '../models/product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(const ProductState()) {
    on<ProductFetched>(_onProductFetched);
  }

  void _onProductFetched(ProductFetched event, Emitter<ProductState> emit) {
    if (state.status == ProductStatus.initial) {
      final products = productsApi;
      return emit(
          state.copyWith(status: ProductStatus.success, products: products));
    }
  }
}
