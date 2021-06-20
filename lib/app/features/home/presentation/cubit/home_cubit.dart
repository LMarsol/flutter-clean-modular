import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_modular/app/features/home/domain/usecases/get_data_usecase.dart';
import 'package:flutter_clean_modular/app/features/home/presentation/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._getDataUseCase) : super(HomeInitial());

  final GetDataUseCase _getDataUseCase;

  Future<void> fetchData() async {
    emit(HomeLoading());

    var result = await _getDataUseCase();

    result.fold(
      (l) => emit(HomeInitial()),
      (data) => emit(HomeSuccess(data.message)),
    );
  }
}
