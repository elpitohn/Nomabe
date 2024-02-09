import 'package:injectable/injectable.dart';
import 'package:nomabe/list/data/model/productmodel.dart';
import 'package:nomabe/list/data/repository/listrepository.dart';

abstract class ListInteractor {
  Future<List<ProductItem>> getProductItems();
}

@Injectable(as: ListInteractor)
class ListInteractorImpl implements ListInteractor {
  final ListRepository _listRepository;

  ListInteractorImpl(this._listRepository);

  @override
  Future<List<ProductItem>> getProductItems() async {
    return _listRepository.getProductItems();
  }
}
