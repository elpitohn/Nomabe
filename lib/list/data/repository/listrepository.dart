import 'package:injectable/injectable.dart';
import 'package:nomabe/list/data/model/productmodel.dart';
import 'package:nomabe/list/data/service/listservice.dart';

abstract class ListRepository {
  Future<List<ProductItem>> getProductItems();
}

@Injectable(as: ListRepository)
class ListRepositoryImpl implements ListRepository {
  final ListService _listService;

  ListRepositoryImpl(this._listService);

  @override
  Future<List<ProductItem>> getProductItems() async {
    final request = await _listService.getProductItems();
    // Faça qualquer processamento adicional aqui, se necessário
    return request;
  }
}
