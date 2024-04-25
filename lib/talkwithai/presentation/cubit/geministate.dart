part of 'geminicubit.dart';

abstract class GeminiState extends Equatable {
  const GeminiState();

  const factory GeminiState.loading() = GeminiLoadingState;

  const factory GeminiState.result() = GeminiResultState;

  const factory GeminiState.error() = GeminiErrorState;

  @override
  List<Object?> get props => [];
}

class GeminiLoadingState extends GeminiState {
  const GeminiLoadingState();
}

class GeminiErrorState extends GeminiState {
  const GeminiErrorState();
}

class GeminiResultState extends GeminiState {
  const GeminiResultState();
}
