import 'dart:developer';

import 'package:flutter/material.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key, required this.onChanged});

  final ValueSetter<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    log('home search bar build');
    return SearchBar(
      hintText: 'Search character',
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: Colors.white24),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
