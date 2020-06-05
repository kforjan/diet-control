import 'package:flutter/material.dart';

class AppbarMain extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      leading: Padding(
        padding: EdgeInsets.all(7),
        child: ClipOval(
          child: Container(
            color: Colors.white,
            child: Icon(
              Icons.cake,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
      title: Text('GoodDiet'),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
