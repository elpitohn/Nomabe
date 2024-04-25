import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'geministate.dart';

@injectable
abstract class GeminiCubit extends Cubit<GeminiState> {
  GeminiCubit() : super(const GeminiState.loading());

  void emmitResultForGemini();
  void emmitErrorForGemini();

  @factoryMethod
  factory GeminiCubit.create() => _GeminiCubit();
}

class _GeminiCubit extends GeminiCubit {
  _GeminiCubit() : super();

  @override
  void emmitResultForGemini() {
    emit(const GeminiState.result());
  }

  @override
  void emmitErrorForGemini() {
    emit(const GeminiState.error());
  }
}
