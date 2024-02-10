// ignore_for_file: avoid_print

import 'package:cat_app/state/cat_api_state.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    print('home view build');

    return Scaffold(
      appBar: AppBar(title: const Text('Cat App')),
      body: const _CatListWidget(),
    );
  }
}

class _CatListWidget extends StatelessWidget {
  const _CatListWidget();

  @override
  Widget build(BuildContext context) {
    final catApiState = CatApiState.of(context);

    print('cat list widget build');

    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      controller: catApiState?.scrollController,
      children: [
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: catApiState?.catList.length ?? 0,
          itemBuilder: (context, index) {
            final item = catApiState?.catList[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(item?.url ?? ''),
            );
          },
        ),
        const SizedBox(
          height: 100,
          child: Center(child: CircularProgressIndicator.adaptive()),
        ),
      ],
    );
  }
}
