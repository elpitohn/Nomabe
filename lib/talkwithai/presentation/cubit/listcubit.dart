import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:nomabe/core/data/constants/mocks/listitemrequestmock.dart';
import 'package:nomabe/list/data/model/productmodel.dart';

part 'liststate.dart';

@injectable
abstract class ListCubit extends Cubit<ListState> {
  ListCubit() : super(const ListState.loading());

  Future<void> getProductItems();

  @factoryMethod
  factory ListCubit.create() => _ItemsCubit();
}

class _ItemsCubit extends ListCubit {
  _ItemsCubit() : super();

  @override
  Future<void> getProductItems() async {
    try {
      // TODO(Andre): Add request api
      // await Future.delayed(Duration(seconds: 2));

      // List<ProductItem> productItems = [];

      List<ProductItem> productItems = mockedConvertedListItems;

      emit(ListState.result(productItems));
    } catch (e) {
      emit(const ListState.error());
    }
  }
}
