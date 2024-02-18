import 'dart:developer';

import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    log('home app bar build');

    return AppBar(title: const Text('Rick And Morty App'));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
