import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get_it/get_it.dart';
import 'package:waiter_delivery/components/custom_drawer/page_tile.dart';
import 'package:waiter_delivery/stores/page_store.dart';

class PageSection extends StatelessWidget {

  final PageStore pageStore = GetIt.I<PageStore>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageTile(
          icon: FeatherIcons.home,
          onTap: () => pageStore.setPage(0),
          highlighted: pageStore.pageIndex == 0,
        ),
      ],
    );
  }
}
