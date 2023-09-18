part of 'main_bloc.dart';

class MainState extends Equatable {
  final bool hasError;
  final Exception? exception;
  final Map<ProductCategory?, List<Product>> products;
  const MainState({
    this.hasError = false,
    this.exception,
    this.products = const {},
  });

  const MainState._({
    this.hasError = false,
    this.exception,
    this.products = const {},
  });

  const MainState.initial()
      : this._(
          hasError: false,
          exception: null,
          products: const {},
        );

  MainState copyWith({
    bool? hasError,
    Exception? exception,
    Map<ProductCategory?, List<Product>>? products,
  }) {
    return MainState(
        hasError: hasError ?? this.hasError,
        exception: exception ?? this.exception,
        products: products ?? this.products);
  }

  @override
  List<Object?> get props => [hasError, products];
}
