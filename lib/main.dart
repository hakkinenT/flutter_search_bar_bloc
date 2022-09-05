import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app_bar_project/search_delegate/product_search.dart';

import 'bloc/product_bloc.dart';
import 'bloc/product_search_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductBloc(),
        ),
        BlocProvider(
          create: (context) => ProductSearchBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const PageInital(),
      ),
    );
  }
}

class PageInital extends StatelessWidget {
  const PageInital({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<ProductBloc>(context)..add(const ProductFetched()),
      child: const MyHomePage(title: 'productos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
                onPressed: () async {
                  await showSearch(
                      context: context,
                      delegate: ProductSearch(
                          BlocProvider.of<ProductSearchBloc>(context)));
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body: const ProductContent());
  }
}

class ProductContent extends StatelessWidget {
  const ProductContent({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ProductBloc>().state;

    if (state.status == ProductStatus.initial) {
      return const SizedBox();
    } else {
      if (state.products.isEmpty) {
        return const Center(
          child: Text('Não há produtos cadastrados'),
        );
      } else {
        return ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(state.products[index].name),
            );
          },
          itemCount: state.products.length,
        );
      }
    }
  }
}
