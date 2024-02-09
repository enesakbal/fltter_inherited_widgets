import 'package:cat_app/state/cat_api_state.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cat App')),
      floatingActionButton: FloatingActionButton(
        onPressed: CatApiState.of(context)?.fetchCats,
        child: const Icon(Icons.add),
      ),
      body: const Column(
        children: [
          Expanded(
            child: _CatListWidget(),
          ),
        ],
      ),
    );
  }
}

class _CatListWidget extends StatelessWidget {
  const _CatListWidget();

  @override
  Widget build(BuildContext context) {
    final catApiState = CatApiState.of(context);

    return ListView.separated(
      itemCount: catApiState?.catList.length ?? 0,
      itemBuilder: (context, index) {
        final item = catApiState?.catList[index];
        return Image.network(item?.url ?? '');
      },
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}
