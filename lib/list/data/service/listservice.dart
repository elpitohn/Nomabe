import 'package:injectable/injectable.dart';
import 'package:nomabe/core/data/constants/api/serverrequests.dart';
import 'package:nomabe/list/data/model/productmodel.dart';

abstract class ListService {
  Future<List<ProductItem>> getProductItems();
}

@Injectable(as: ListService)
class ListServiceImpl implements ListService {
  @override
  Future<List<ProductItem>> getProductItems() async {
    final request = await NomabeRequestMaker()
        .makeGetRequest(); // TODO implement the proper request

    return request.data;
  }
}
