import 'package:block_test/feature/mock_api_call/data/repository/mock_repo.dart';
import 'package:block_test/feature/mock_api_call/ui/mock_screen/mock_detail_view.dart';
import 'package:block_test/feature/mock_api_call/ui/mock_state/network_bloc.dart';
import 'package:block_test/feature/mock_api_call/ui/mock_state/network_event.dart';
import 'package:block_test/feature/mock_api_call/ui/mock_state/network_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const _baseUrl = 'https://jsonplaceholder.typicode.com';

class MockViewPage extends StatefulWidget {
  const MockViewPage({super.key, required this.repo});
  final MockRepo repo;

  @override
  State<MockViewPage> createState() => _MockViewPageState();
}

class _MockViewPageState extends State<MockViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mock Data'),
      ),
      body: BlocProvider(
        create: (context) => NetworkBloc(
          mockRepo: widget.repo
        )..add(FetchData()),
        child: BlocConsumer<NetworkBloc, NetworkState>(
          listener: (BuildContext context, NetworkState state) {
            if (state is MockInitial) {
              context.read<NetworkBloc>().add(FetchData());
            }
            if (state is MockLoaded) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Data Loaded')));
            }
          },
          builder: (BuildContext context, NetworkState state) {
            switch (state) {
              case MockLoading():
                return const Center(
                  child: CircularProgressIndicator(),
                );

              case MockLoaded():
                return ListView.builder(
                  key: const Key('mock_list'),
                  itemCount: state.model.length,
                  itemBuilder: (context, index) {
                    var item = state.model[index];
                    return ListTile(
                      key: Key('mock_item_$index'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MockDetailView(
                                  id: '${item.id}',
                                  title: item.title ?? '',
                                  body: item.body ?? ''),
                            ));
                      },
                      title: Text(item.title ?? ''),
                      subtitle: Text(item.body ?? ''),
                    );
                  },
                );
              case MockError():
                return Center(
                  key: const Key('error'),
                  child: Text(state.error),
                );

              default:
                return const Center(
                  child: Text('Initial State'),
                );
            }
          },
        ),
      ),
    );
  }
}
