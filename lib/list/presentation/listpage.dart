import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nomabe/core/data/constants/mocks/listitemrequestmock.dart';
import 'package:nomabe/list/data/model/productmodel.dart';
import 'package:nomabe/list/presentation/cubit/listcubit.dart';
import 'package:nomabe/list/presentation/widget/productwidget.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ListCubit cubit = GetIt.I.get<ListCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Page'),
      ),
      body: BlocProvider(
          create: (_) => cubit,
          child: BlocBuilder<ListCubit, ListState>(builder: (context, state) {
            switch (state) {
              case ListErrorState:
                // TODO: Add the button to load the page again
                // remove the circular indicator
                return const Center(
                  child: CircularProgressIndicator(),
                );

              case ListResultState:
                final result = (state as ListResultState).result;

                return ListView.builder(
                  // colocar blocProvider aqui
                  itemCount: result.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductWidget(
                      productItem: result[index],
                    );
                  },
                );

              default:
                return const Center(
                  child: CircularProgressIndicator(),
                );
            }
          })),
    );
  }
}
