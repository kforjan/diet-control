import 'package:flutter/material.dart';

import '../screens/edit_inputs_screen.dart';

class AppbarMain extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: <Widget>[
        PopupMenuButton(
          icon: Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
          itemBuilder: (context) => [
            PopupMenuItem(
              child: Text('Edit'),
              value: 0,
            ),
          ],
          onSelected: (value) {
            if (value == 0) {
              Navigator.pushNamed(
                  context, EditInputsScreen.routeName);
            }
          },
        ),
      ],
      backgroundColor: Theme.of(context).primaryColor,
      leading: Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
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
