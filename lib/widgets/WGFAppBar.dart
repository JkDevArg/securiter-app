import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class WGFAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WGFAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GFAppBar(
      leading: GFIconButton(
        icon: const Icon(
          Icons.message,
          color: Colors.white,
        ),
        onPressed: () {},
        type: GFButtonType.transparent,
      ),
      searchBar: true,
      title: const Text("Securiter"),
      actions: <Widget>[
        GFIconButton(
          icon: const Icon(
            Icons.account_circle_rounded,
            color: Colors.white,
          ),
          onPressed: () {},
          type: GFButtonType.transparent,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
