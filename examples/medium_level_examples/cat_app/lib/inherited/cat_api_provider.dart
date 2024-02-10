import 'package:cat_app/core/cat_api_service.dart';
import 'package:cat_app/model/cat_model.dart';
import 'package:cat_app/state/cat_api_state.dart';
import 'package:flutter/material.dart';

class CatApiProvider extends StatefulWidget {
  const CatApiProvider({super.key, required this.child});

  final Widget child;

  @override
  State<CatApiProvider> createState() => _CatApiProviderState();
}

class _CatApiProviderState extends State<CatApiProvider> {
  late List<CatModel> catList;
  late final CatApiService catApiService;

  @override
  void initState() {
    catList = [];
    catApiService = const CatApiService();

    fetchCats();
    super.initState();
  }

  Future<void> fetchCats() async {
    final cats = await catApiService.fetchCats();

    setState(() {
      catList = List.from(catList..addAll(cats));
    });
  }

  @override
  Widget build(BuildContext context) {
    print('provider build');

    return CatApiState(
      catList: catList,
      fetchCats: fetchCats,
      child: widget.child,
    );
  }
}
