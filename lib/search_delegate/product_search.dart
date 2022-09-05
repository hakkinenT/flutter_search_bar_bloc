import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app_bar_project/bloc/product_search_bloc.dart';
import 'package:search_app_bar_project/models/product.dart';

class ProductSearch extends SearchDelegate<Product?> {
  final Bloc<ProductSearchEvent, ProductSearchState> productBloc;

  ProductSearch(this.productBloc);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    productBloc.add(ProductSearchEvent(query));

    return BlocBuilder(
      bloc: productBloc,
      builder: (BuildContext context, ProductSearchState state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.hasError) {
          return const Center(
            child: Text('Error'),
          );
        }
        return ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(state.products[index].name),
            );
          },
          itemCount: state.products.length,
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    productBloc.add(ProductSearchEvent(query));

    return BlocBuilder(
      bloc: productBloc,
      builder: (BuildContext context, ProductSearchState state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.hasError) {
          return const Center(
            child: Text('Error'),
          );
        }
        return ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(state.products[index].name),
            );
          },
          itemCount: state.products.length,
        );
      },
    );
  }
}
