part of 'listcubit.dart';

abstract class ListState extends Equatable {
  const ListState();

  const factory ListState.loading() = ListLoadingState;

  const factory ListState.result(ProductItem result) = ListResultState;

  const factory ListState.error() = ListErrorState;

  @override
  List<Object?> get props => [];
}

class ListLoadingState extends ListState {
  const ListLoadingState();
}

class ListErrorState extends ListState {
  const ListErrorState();
}

class ListResultState extends ListState {
  const ListResultState(this.result);
  final ProductItem result;

  @override
  List<Object?> get props => [result];
}
