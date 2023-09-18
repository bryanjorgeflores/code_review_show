import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final MainRepository _mainRepository;

  MainBloc({required MainRepository mainRepository})
      : _mainRepository = mainRepository,
        super(const MainState.initial()) {
    on<LoadProductsEvent>(_onLoadProducts);
  }

  void _onLoadProducts(LoadProductsEvent event, Emitter<MainState> emit) async {
    await emit.forEach<Map<ProductCategory?, List<Product>>>(
        _mainRepository.getProducts(), onData: (products) {
      return state.copyWith(
        products: products,
      );
    }, onError: <Exception>(exception, __) {
      return state.copyWith(hasError: true, exception: exception);
    });

    emit(state.copyWith(hasError: false));
  }
}
