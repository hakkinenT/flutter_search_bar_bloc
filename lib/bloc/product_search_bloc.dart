import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:search_app_bar_project/api/product_api.dart';

import '../models/product.dart';

part 'product_search_event.dart';
part 'product_search_state.dart';

class ProductSearchBloc extends Bloc<ProductSearchEvent, ProductSearchState> {
  ProductSearchBloc() : super(ProductSearchState.initial()) {
    on<ProductSearchEvent>(_onProductSearchEvent);
  }

  void _onProductSearchEvent(
      ProductSearchEvent event, Emitter<ProductSearchState> emit) {
    emit(ProductSearchState.loading());
    try {
      List<Product> products = getProductByName(event.query);
      emit(ProductSearchState.success(products));
    } catch (e) {
      emit(ProductSearchState.failure());
    }
  }
}
