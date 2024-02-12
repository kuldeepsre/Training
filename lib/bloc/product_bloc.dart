
import 'package:dreambiztech/api/api_repository.dart';
import 'package:dreambiztech/api/response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<GetProductList>((event, emit) async {
      try {
        emit(ProductLoading());
        final mList = await _apiRepository.fetchProductList();
        emit(ProductLoaded(mList));
        if (mList.error != null) {
          emit(ProductError(mList.error));
        }
      } on NetworkError {
        emit(
            const ProductError("Failed to fetch data. is your device online?"));
      }
    });
  }
}