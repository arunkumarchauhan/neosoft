import 'package:flutter/material.dart';

AppBar buildAppbarWithTitleBackAndSearchButton(
    {required BuildContext context,
    required String title,
    Function? onSearchPressed}) {
  return AppBar(
    title: Text(
      title,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.headline2,
    ),
    centerTitle: true,
    actions: [
      IconButton(
        onPressed: onSearchPressed == null ? () {} : () => onSearchPressed,
        icon: const Icon(
          Icons.search,
          size: 30,
        ),
      )
    ],
    leading: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: const Icon(
        Icons.arrow_back_ios,
        size: 25,
      ),
    ),
  );
}
