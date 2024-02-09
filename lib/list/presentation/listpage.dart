import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nomabe/list/presentation/cubit/listcubit.dart';
import 'package:nomabe/list/presentation/widget/productwidget.dart';
import 'package:nomabe/list/presentation/widget/talkwithai.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ListCubit cubit = GetIt.I.get<ListCubit>();

  @override
  void initState() {
    cubit.getProductItems();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Page'),
      ),
      body: BlocProvider(
          create: (_) => cubit,
          child: BlocBuilder<ListCubit, ListState>(builder: (context, state) {
            switch (state.runtimeType) {
              case ListErrorState:
                // TODO: Add the button to load the page again
                // remove the circular indicator
                return const Center(
                  child: CircularProgressIndicator(),
                );

              case ListResultState:
                final result = (state as ListResultState).result;

                return Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView.builder(
                        itemCount: result.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ProductWidget(
                            productItem: result[index],
                          );
                        },
                      ),
                    ),
                    // const SizedBox(
                    //   height: NomabeDimens.nomabe_med_size,
                    // ),
                    const TalkWithAiButton(),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
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
