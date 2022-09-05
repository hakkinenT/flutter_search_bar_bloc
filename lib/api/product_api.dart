import '../models/product.dart';

List<Product> productsApi = [
  Product(name: 'Sal', quantidade: 2),
  Product(name: 'Açucar', quantidade: 2),
  Product(name: 'Macarrão', quantidade: 2),
  Product(name: 'Feijão', quantidade: 2),
  Product(name: 'Café', quantidade: 2),
];

List<Product> getProductByName(String productName) {
  final productByName = productsApi.where((product) =>
      product.name.toLowerCase().contains(productName.toLowerCase()));
  return productByName.toList();
}
