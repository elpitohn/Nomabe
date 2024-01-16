import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nomabe/list/data/model/productmodel.dart';

part 'liststate.dart';

abstract class ListCubit extends Cubit<ListState> {
  ListCubit() : super(ListState.loading());

  Future<void> getProductItems();
}

class _ListCubit extends ListCubit {
  _ListCubit() : super();

  @override
  Future<void> getProductItems() async {
    try {
      // TODO(Andre): Add api request
      // await Future.delayed(Duration(seconds: 2));

      // List<ProductItem> productItems = [];

      // emit(ListState.result(productItems));
    } catch (e) {
      emit(ListState.error());
    }
  }
}
